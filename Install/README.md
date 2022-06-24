# Install-command
ゲーム用インストーラー
## 概要
装置とパスを選択させ、ZIPを展開するソフト
## How to build
このフォルダにファイル名"bin.zip"を追加した上でINSTALL.exeを実行する。
## 構成
[]はディレクトリ
```
[Install]
	├── INSTALL.exe(実行用ファイル)
	├── install.hsp(ソースコード)
	├── ZLibWrap.dll(ZIP展開用ライブラリ)
	├── hsptmp(お察しください)
        ├── obj(お察しください)
        ├── start.ax(お察しください)
	└── zipfile.as(ZIP展開用拡張)
```
# 報告されているバグ
・Win8.1で解凍時にソフトがフリーズする
# 注意事項
・実行するコンピュータにＭＳ　ゴシックを必要とする。
