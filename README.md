# How to use

## Getting Started

jupyter notebookのポート番号を指定します．

```sh
$ export HOST_PORT=`expr 10000 + $UID`
```

Dockerのイメージを作成します．
これは基本的には一回だけやれば大丈夫です．

```sh
$ make build
```

Dockerのコンテナを動かします．
HOST_DIRECTORYには動かしたいコードの絶対パスを指定してください．
これでjupyter notebookが起動します．

```sh
$ make run HOST_DIRECTORY="<プロジェクトの絶対パス>"
```

jupyter notebookのトークンとホストのポートは以下のコマンドで確認できます．

```sh
$ make notebook-url
```

Docker内でPython等のコマンドを実行させたいときはexecでコンテナ内に入れます．
HOST_DIRECTORYの中身をここから書き換えたり実行できます．

```
$ make exec
```

使わなくなったらコンテナを停止or削除しましょう（作成したファイルは消えません）

```
$ make stop 
$ make container-clean
```

## コマンド集

### build

```
$ export HOST_PORT=`expr 10000 + $UID`
$ make build
```

### run

```
$ make run HOST_DIRECTORY = <your code directory absolute path> 
```

### exec

```
$ make exec
```

**Show jupyter notebook url**

```
$ make notebook-url
```
