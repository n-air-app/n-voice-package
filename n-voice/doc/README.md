# N Voice

N Voice は日本語の TTS エンジンです。

## 実行コマンド

下記のコマンドで実行できます。

```sh
n-voice.exe dict-dir user.dic model.pt extra-voices-dir
```

* `dict-dir`
   	- Open JTalk の辞書 (Shift-JIS) を置いてあるディレクトリパスを指定します。
      	* 現在は `open_jtalk_dic_shift_jis-1.11/` を同梱しています。
* `user.dic`
   	- ユーザー辞書ファイルへのパスを指定します。
		* 同梱の `user.csv` を `mecab-dict-index.exe` で変換したものです。
* `model.pt`
   	* 学習済みの TTS モデルファイルへのパスを指定します。
* `extra-voices-dir`
   	* エクストラボイスを置いたデータディレクトリへのパスを指定します。
		- `n-voice_extra-voices` に同梱されています。


## エンジンプロトコル

* エンジンが起動したあと、標準入力からコマンドを送信することで各種操作を指定します。
* コマンドを実行すると、標準出力から応答が返ります (標準エラー出力の内容は未定義)。
	- 成功すると ok と内容が空白区切りで 1 行で返る。
		* 内容がない場合は ok だけが返る。
	- 失敗すると ng とエラーコード(後述)が空白区切りで 1 行で返る。

### コマンド一覧

| コマンド | 引数 (空白区切り) | 応答 |
|---|---|---|
| なし (起動直後) | なし | ok / ng エラーコード |
| quit | なし | ok |
| protocol_version | なし | ok プロトコルのバージョン文字列 |
| name | なし | ok エンジン名 |
| version | なし | ok エンジンのバージョン文字列 |
| list_commands | なし | ok エンジンが対応しているコマンド名が空白区切りで列挙(順不同)された文字列 |
| talk | 話速␣テキスト␣保存WAVファイルパス | ok エクストラボイスの番号(0は合成音声) / ng エラーコード |
| max_time | なし | ok 現在の合成音の最大秒数 |
| set_max_time | 合成音の最大秒数 | ok / ng エラーコード |
| test | テキスト | ok / ng エラーコード |

### 備考

`talk` コマンドが音声合成のコマンドです:
* 引数の `テキスト` と `保存WAVファイルパス` (拡張子 `.wav` 必須) は Shift-JIS テキストを Base64 でエンコードしている必要があります。
* `話速` は基準速度からの相対値であり、1.0 が通常速度、0.5 が倍速になります。
* デフォルトで Audacity で読み込める形式のラベルファイルを生成します。
	- 保存WAVファイル名が `test.wav` の場合、ラベルのファイル名は `test.wav.txt` となります。
	- ラベルファイルには、各行に各音素の情報が `開始時間⭾終了時間⭾音素名`のフォーマットで記載されます。
		* 時間の単位は秒(実数)です。
	   	* 区切り文字はタブです。
		* 音素名一覧は `ry` `r` `my` `m` `ny` `n` `j` `z` `by` `b` `dy` `d` `gy` `g` `ky` `k` `ch` `ts` `sh` `s` `hy` `h` `v` `f` `py` `p` `ty` `t` `y` `w` `N` `a` `i` `u` `e` `o` `I` `U` `cl` `pau` `silB` `silE` です。

`test` コマンドは実行の確認用の簡易コマンドです。
* `テキスト` には、文字コード `Shift-JIS` の漢字仮名交じり文 (Base64 エンコードなし) を指定できます。
* 話速 1 で `test.wav` に合成音声が保存され、そのまま再生されます。

## エクストラボイス

`talk` コマンドにおいて特定の単語が指定されると、録音済みの音声を編集なしでコピーした結果を返します。

| ボイス番号 | 対応音声 | 対応単語 | |
|--:|---|---|---|
| 1 | 888_#.wav | ODg4, gleCV4JX | 888, ８８８ |
| 2 | 8888_#.wav | ODg4OA==, gleCV4JXglc= | 8888, ８８８８ |
| 3 | enchotsu_#.wav | gqaC8YK/guWCwg== | えんちょつ |
| 4 | kokotsu_#.wav | grGCpIKxgsI= | こうこつ |
| 5 | kp_#.wav | a3A=, gouCkA== | kp, ｋｐ |
| 6 | kusa_#.wav | kZA= | 草 |
| 7 | noshi_#.wav | gsyCtQ==, g22DVg==, ybw= | のし, ノシ, ﾉｼ |
| 8 | ok_#.wav | gqhr, gqiCiw== | おk, おｋ |
| 9 | otsu_#.wav | gqiCwg== | おつ |
| 10 | shoken_#.wav | j4mMqQ== | 初見 |
| 11 | shokendesu_#.wav | j4mMqYLFgrc= | 初見です |
| 12 | wakotsu_#.wav | gu2CsYLC | わこつ |
| 13 | ww_#.wav | d3c=, gpeClw== | ww, ｗｗ |
| 14 | www_#.wav | d3d3, gpeCl4KX | www, ｗｗｗ |

### コマンド例

```sh
talk 1 ODg4 ODg4Lndhdg==
talk 1 ODg4OA== ODg4OC53YXY=
talk 1 gqaC8YK/guWCwg== ZW5jaG90c3Uud2F2
talk 1 grGCpIKxgsI= a29rb3RzdS53YXY=
talk 1 a3A= a3Aud2F2
talk 1 kZA= a3VzYS53YXY=
talk 1 gsyCtQ== bm9zaGkud2F2
talk 1 gqhr b2sud2F2
talk 1 gqiCwg== b3RzdS53YXY=
talk 1 j4mMqQ== c2hva2VuLndhdg==
talk 1 j4mMqYLFgrc= c2hva2VuZGVzdS53YXY=
talk 1 gu2CsYLC d2Frb3RzdS53YXY=
talk 1 d3c= d3cud2F2
talk 1 d3d3 d3d3Lndhdg==
```

## エラーコード

| エラー番号 | 内容 |
|--:|---|
| 1 | 起動時の引数の数が不正です。 |
| 2 | 引数で指定された pytorch モデルのロードに失敗しました。 |
| 3 | 引数で指定されたユーザー辞書のロードに失敗しました。 |
| 101 | 不明なコマンドです。 |
| 102 | コマンドが読み取れません。 |
| 201 | ファイルの保存に失敗しました。 |
| 202 | ファイルの複製に失敗しました。 |
| 301 | 入力テキストの読み取りに失敗しました。 |
| 302 | 保存WAVファイルパスの読み取りに失敗しました。 |
| 401 | 入力テキストのパースに失敗しました。 |
