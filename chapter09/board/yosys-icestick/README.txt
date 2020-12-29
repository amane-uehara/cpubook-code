# 9章: YosysとiCEstick Evaluation Kitの場合

## 1. FPGAボードの購入

* iCEstick Evaluation Kit
  https://www.latticesemi.com/icestick

を入手してください。

## 2. ツールのインストール

コンソールから下記のコマンドを実行して、合成に必要なツールをインストールしてください。

```
$ git clone https://github.com/YosysHQ/icestorm.git icestorm
$ cd icestorm
$ make -j4
$ sudo make install

$ git clone https://github.com/YosysHQ/nextpnr nextpnr
$ cd nextpnr
$ cmake -DARCH=ice40 -DCMAKE_INSTALL_PREFIX=/usr/local .
$ make -j4
$ sudo make install

$ git clone https://github.com/YosysHQ/yosys.git yosys
$ cd yosys
$ make -j4
$ sudo make install
```

ツールのインストール方法について詳しくは以下のページを参照してください。

* Project IceStorm
  http://www.clifford.at/icestorm/

## 3. 論理合成と配置配線

本ディレクトリで下記のコマンドを実行して論理合成と配置配線をしてください。

```
$ cd cpubook-code/chapter09/board/yosys-icestick
$ make
```

## 4. コンフィグレーションと実行

iCEstick Evaluation Kitを開発環境のUSBポートに接続してください。

本ディレクトリで下記のコマンドを実行してをコンフィグレーションを行なってください。

```
$ cd cpubook-code/chapter09/board/yosys-icestick
$ make prog
```

iCEstick Evaluation Kit上のLEDがゆっくり点滅するはずです。
