# n-voice-package

日本語音声合成エンジン　N Voice(琴詠ニア)の実行ファイルセットとその Node.js用パッケージ

## 実行環境
Windows (x86-64bit)

## 内容
N Voice本体は `n-voice/` にあります。
このリポジトリは、上記の内容をまとめて @n-air-app/n-voice-package という名前で GitHub のパッケージリポジトリに npm (yarn)用パッケージを作成します。

## Node.jsから依存関係としてインストールする
```bash
npm login --scope=@n-air-app --registry=https://npm.pkg.github.com
> Username: USERNAME (of GitHub)
> Password: TOKEN (GitHub Personal Access Token with packages:read scope)
> Email: PUBLIC-EMAIL-ADDRESS

yarn add @n-air-app/n-voice-package
```

## ユーザー辞書をビルドする
ユーザー辞書は `user.csv` から `npm run dic` でビルドします。
npm などでinstallするときはパッケージビルド時に構築していますが、このリポジトリを`git clone` した環境では適宜 `npm run dic` でビルドしてください。

## N Voice の利用方法
[n-voice/doc/README.md](n-voice/doc/README.md)

* 実際の使い方はこれを利用している [N Air](https://github.com/n-air-app/n-air-app) のソースコードも参考にしてください。

## license
* [N-Voice.txt](n-voice/LICENSE/LICENSE_N-Voice.txt)
* バイナリ収録している依存物のライセンス
    * [LICENSE_MeCab.txt](n-voice/LICENSE/LICENSE_MeCab.txt)
    * [LICENSE_OpenJTalk.txt](n-voice/LICENSE/LICENSE_OpenJTalk.txt)
    * [LICENSE_PyTorch.txt](n-voice/LICENSE/LICENSE_PyTorch.txt)

## copyright
Copyright (c) 2022-2023, DWANGO Co.,Ltd.
All rights reserved.

## publish package
update version and
```bash
git push && git push --tags
```
