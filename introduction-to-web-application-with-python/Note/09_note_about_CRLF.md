## 補足 : CRLF

参考 : [CRLF（CR/LF）とは - 意味をわかりやすく - IT用語辞典 e-Words](https://e-words.jp/w/CRLF.html)

CRLF(CR/LF : Carriage Return / Line Feed)とは、**テキスト（文字）データの中で改行を指示するための、特殊な文字コードの組み合わせ**。
CR（Carriage Return：行頭復帰/コード0x0D）とLF（Line Feed：改行/コード0x0A）を順に繋げたもの。

- CR : 行の先頭に移動する
- LF : 1行下(の同じ桁)に移動する

WindowsはCRLFを改行コードとしているが、UNIX系OSや現行のmacOSシリーズ（Mac OS X）ではLF単独を標準の改行コードとしているため、変換が必要になる場合がある。