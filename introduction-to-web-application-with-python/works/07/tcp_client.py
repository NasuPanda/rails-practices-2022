from email import message
import socket
from urllib import request

def output_pretty(message):
    print("=" * 10)
    print(message)
    print("=" * 10)
    
class TCPClient:
    def request(self):
        output_pretty("クライアントを起動")

        try:
            # socket生成
            client_socket = socket.socket()
            client_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

            output_pretty("サーバと接続")
            client_socket.connect(("127.0.0.1", 80))
            output_pretty("サーバとの接続が完了")

            with open("./client_send.txt", "rb") as f:
                request = f.read()

            # リクエストを送信
            client_socket.send(request)

            response = client_socket.recv(4096)

            # レスポンスの内容を、ファイルに書き出す
            with open("client_recv.txt", "wb") as f:
                f.write(response)

            # 通信を終了させる
            client_socket.close()

        finally:
            output_pretty("クライアントを停止します")


if __name__ == '__main__':
    client = TCPClient()
    client.request()