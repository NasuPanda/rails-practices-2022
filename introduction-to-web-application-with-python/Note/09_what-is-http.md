## HTTPとはなんぞや

TCPによって「どのようにデータの信頼性・連続性を保証するか」という点は解決されている。

次に必要なのは、**メッセージ(リクエスト)フォーマット**の統一。

フォーマットがクライアントごとに異なれば、当然ながら正しく処理することは難しい。

そこで、「メッセージフォーマットのお約束」が必要になってくる。

それがHTTP/SMTP/POP等のプロトコル。
OSI参照モデルに当てはめるとアプリケーション層。

アプリケーション層のプロトコルは、TCPによって通信の信頼性が担保されていることを前提としている。

# RFC : Request for Comments

[Request for Comments - Wikipedia](https://ja.wikipedia.org/wiki/Request_for_Comments)


HTTPのルールは IETF という団体によって制定されている。

IETFという団体はHTTP以外にもたくさんのインターネット技術に関するプロトコルや仕様類に関する制定を行っており、詳細な仕様や説明は RFC というドキュメントとして発行される。

HTTP/1.1（本書で取り扱うHTTP）のルールについては、 RFC 7230, RFC 7231, RFC 7232, RFC 7233, RFC 7234, RFC 7235という6つのドキュメントに分割されて定義されている。
例えば、その中でもHTTPの基本について書かれた RFC7230 は、[ここ](https://tools.ietf.org/html/rfc7230) から読むことが出来る。

RFCは全文英語だが、日本語訳も存在する。

[RFC 7230 — HTTP/1.1: Message Syntax and Routing （日本語訳）](https://triple-underscore.github.io/RFC7230-ja.html)

# RFCの見方

[ざっくりとしたRFCの読み方](https://zenn.dev/bigen1925/books/introduction-to-web-application-with-python/viewer/what-is-http#1.1.4-%E3%83%AA%E3%82%AF%E3%82%A8%E3%82%B9%E3%83%88%E3%83%A9%E3%82%A4%E3%83%B3%E3%81%AE%E3%81%BE%E3%81%A8%E3%82%81%E3%81%A8rfc)

```
HTTP-message   = start-line
                 *( header-field CRLF )
                 CRLF
                 [ message-body ]
```

RFCの記法は拡張BNF記法と呼ばれる。これ自体もRFCで定義されている。

- *(X) は、Xの0回以上の繰り返し（= 全くなくてもよいし、いくらでもたくさんあって良い）がくること
- X | Y は、XまたはYがくること
- [X] は、Xが省略可能であること (= なくてもよい)
- CRLF : 改行コード
- SP : 半角空白

# HTTPリクエストの構成

```http
GET / HTTP/1.1
Host: localhost:8080
Connection: keep-alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
Sec-Fetch-Site: none
Sec-Fetch-Mode: navigate
Sec-Fetch-User: ?1
Sec-Fetch-Dest: document
Accept-Encoding: gzip, deflate, br
Accept-Language: ja-JP,ja;q=0.9,en-US;q=0.8,en;q=0.7
```

1. 1行目: リクエストライン
2. 2行目~空行まで: リクエストヘッダー
3. 空行から後ろ〜: リクエストボディ

## リクエストライン

**形式**

```
<method> <request-target> <HTTP-version>
```

**例**

```
GET / HTTP/1.1
```

### 補足 : request-target

`request-target` というより `path` と呼ぶことのほうが多いらしい。
`path`は「ディレクトリの階層そのもの」を指していたときの名残。ディレクトリの場所というよりはリソースそのものの場所を指す。

## リクエストヘッダ

リクエストヘッダーは、HTTPリクエストの2行目〜空行に書かれる。補助的な情報を伝える目的で使われる。
実際には3種類に分かれる。

**形式**

```
<field-name>: <field-value>
```

**例**

```
Host: localhost:8080
Connection: keep-alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
Sec-Fetch-Site: none
Sec-Fetch-Mode: navigate
Sec-Fetch-User: ?1
Sec-Fetch-Dest: document
Accept-Encoding: gzip, deflate, br
Accept-Language: ja-JP,ja;q=0.9,en-US;q=0.8,en;q=0.7
```

## リクエストボディ

リクエストボディはHTTPリクエストの空行以降〜 に書かれ、リクエストの本文を表す。

例えば、`POST`メソッドで何らかの情報をサーバに送る時に使う。

**例**

```
POST /bigen1925/test/pull/1/change_base HTTP/1.1
Host: github.com
Connection: keep-alive
Content-Length: 140
... 省略...
Accept-Encoding: gzip, deflate, br
Accept-Language: ja-JP,ja;q=0.9,en-US;q=0.8,en;q=0.7

authenticity_token=<this is secret>&new_base_binary=NC04
```

サービスごとに独自のパラメータや情報をおくる際には、リクエストボディに情報を記載する。

# レスポンスの構成

```http
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

HTTPレスポンスは次のような構成。

1. ステータスライン
2. レスポンスヘッダー
3. レスポンスボディ

## ステータスライン

**形式**

```
<Http-Version> <Status-Code> <Reason-Phrase>
```

**例**

```
HTTP/1.1 200 OK
```

### 説明句(Reason-Phrase)

レスポンスの概要を人間に理解しやすい簡潔な文として付け加えるためのもの。

ステータスコードとは違い、特に定義されているわけではない。(クライアントはReason-Phraseを無視するものと定義されている)

## レスポンスヘッダー

レスポンスヘッダー は、 HTTPレスポンスの2行目〜空行までに書かれ、リクエストのときと同様付加的な情報を伝える。

実際には3種類に分かれる。また、レスポンスヘッダでしか使ってはいけないヘッダーがある。

**例**

```
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
```

## レスポンスボディ

HTTPレスポンスの空行以降に書かれるもの。
リクエストされたコンテンツの中身、エラー内容などを含む。

**例**

```html
<html><body><h1>It works!</h1></body></html>
```

HTML,JavaScript,CSS,画像のバイナリデータ等を扱える。
`Content-Type`ヘッダでデータ形式を指定する。