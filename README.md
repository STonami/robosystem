# robosys2024
[![test](https://github.com/STonami/robosys2024/actions/workflows/test.yml/badge.svg)](https://github.com/STonami/robosys2024/actions/workflows/test.yml)

2024年度ロボットシステム学

## コマンドの概要

### 1⃣plus
- 標準入力から読み込んだ数値を足し合わせる

### 例

```bash
$ seq 7 > nums
$ ./plus < nums
28
```

```bash
$ seq 7 | ./plus
28
```

### 2⃣Omikuji
- 実行すると大吉、中吉、小吉、吉、凶、大凶の内から一つがランダムに表示される

### 例

```bash
$ ./Omikuji
中吉　#大吉、中吉、小吉、吉、凶、大凶の内から一つがランダムに表示される
```

## コマンドの使用方法

### 1.インストール
cloneコマンドを使用し、ホームディレクトリでクローンする
```
$ git clone https://github.com/STonami/robosystem.giti
```

### 2.ディレクトリ移動
cdコマンドを使用し、robosystemディレクトリに移動
```
$ cd robosystem
```

### 3.コマンドの使用
上記までの指示通りに実行する

## 動作環境

### 必要なソフトウェア
- Python
  - テスト済みバージョン：3.7~3.10
    
### テスト環境
- Ubuntu 24.04 LTS

## ライセンス
このソフトウェアパッケージは、3条項BSDライセンスの下, 再頒布および使用が許可されます。

©2024 Tonami Seki
