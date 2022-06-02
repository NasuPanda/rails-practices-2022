# まともなWebサーバにする

そもそもまともなWebサーバとは？ : **HTTPのルールに従い通信を行うサーバ。**
つまり、**HTTPのルールに則ったレスポンスを返すことが出来る**サーバ。

## 現状の問題点

今のサーバはどんな時でも↓のレスポンスを返す。

問題点はヘッダ。

`Date`が常に固定。`Server`がApache...
まともなWebサーバを作るには、これらを適切に設定してやる必要がある。

```
HTTP/1.1 200 OK
Date: Wed, 28 Oct 2020 07:57:45 GMT
Server: Apache/2.4.41 (Unix)
Content-Location: index.html.en
Vary: negotiate
TCN: choice
Last-Modified: Thu, 29 Aug 2019 05:05:59 GMT
ETag: "2d-5913a76187bc0"
Accept-Ranges: bytes
Content-Length: 45
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Content-Type: text/html

<html><body><h1>It works!</h1></body></html>
```

### 補足 : ヘッダー色々

- `Vary`は、ブラウザや中間サーバーがキャッシュを使用するかどうかを制御するためのヘッダー
- `Content-Location`は、返却されたレスポンスを取得するための、代わりのURLを示す
- `ETag`は、レスポンスを生成するリソースの特定のバージョンを示す識別子
  - リソースが更新される度に更新される
  - 多くの場合ファイルやコンテンツのハッシュ値が使われる
- `Accept-Ranges`は、Range Requestsという「リソースの部分的なリクエスト」に対応していることを示す
- `Content-Length`は、レスポンスボディのバイト数を10進数で示す値
- `Keep-Alive`は、コネクションの再利用に関して、いつまでコネクションを再利用して良いかの情報を返す
- `Connection`は、一度確立したTCPコネクションを次のリクエストで再利用して良いかどうかを返す

## 改良ポイント

- Dateでレスポンス生成日時を返すようにする
- HostでKittenServer/0.1を返すようにする
- Content-Lengthでボディのバイト数を返すようにする
- ConnectionでCloseを返すようにする
- Content-Typeでtext/htmlを返すようにする

### 補足 : Chrome Developer ToolでHTTPリクエスト/レスポンスを見る

NetWorkタブ > Name欄から見たいものを選ぶ

## 実装

`encode`でバイト型に変換することを忘れずに。

```py
import socket
from datetime import datetime


class WebServer:
    """
    Webサーバーを表すクラス
    """
    def serve(self):
        """
        サーバーを起動する
        """

        print("=== サーバーを起動します ===")

        try:
            # socketを生成
            server_socket = socket.socket()
            server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

            # socketをlocalhostのポート8080番に割り当てる
            server_socket.bind(("localhost", 8080))
            server_socket.listen(10)

            # 外部からの接続を待ち、接続があったらコネクションを確立する
            print("=== クライアントからの接続を待ちます ===")
            (client_socket, address) = server_socket.accept()
            print(f"=== クライアントとの接続が完了しました remote_address: {address} ===")

            # クライアントから送られてきたデータを取得する
            request = client_socket.recv(4096)

            # クライアントから送られてきたデータをファイルに書き出す
            with open("server_recv.txt", "wb") as f:
                f.write(request)

            # レスポンスボディを生成
            response_body = "<html><body><h1>It works!</h1></body></html>"

            # レスポンスラインを生成
            response_line = "HTTP/1.1 200 OK\r\n"
            # レスポンスヘッダーを生成
            response_header = ""
            response_header += f"Date: {datetime.utcnow().strftime('%a, %d %b %Y %H:%M:%S GMT')}\r\n"
            response_header += "Host: KittenServer/0.1\r\n"
            response_header += f"Content-Length: {len(response_body.encode())}\r\n"
            response_header += "Connection: Close\r\n"
            response_header += "Content-Type: text/html\r\n"

            # ヘッダーとボディを空行でくっつけた上でbytesに変換し、レスポンス全体を生成する
            response = (response_line + response_header + "\r\n" + response_body).encode()

            # クライアントへレスポンスを送信する
            client_socket.send(response)

            # 通信を終了させる
            client_socket.close()

        finally:
            print("=== サーバーを停止します。 ===")


if __name__ == '__main__':
    server = WebServer()
    server.serve()

```