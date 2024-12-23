# robosystem
[![test](https://github.com/STonami/robosystem/actions/workflows/test.yml/badge.svg)](https://github.com/STonami/robosystem/actions/workflows/test.yml)

2024年度ロボットシステム学

## 概要
### timetable
- 標準入力から「月、火、水、木、金」の内いづれかの曜日を読み込みその曜日の時間割を教えてくれます。

## コマンドの使用方法

### 1.リポジトリをクローンする
cloneコマンドを使用し、ホームディレクトリでクローンする
```bash
$ git clone https://github.com/STonami/robosystem.git
```

### 2.ディレクトリ移動
cdコマンドを使用し、robosystemディレクトリに移動
```
$ cd robosystem
```

### 3.コマンドの使用
下記のの実行例通りに実行する

### 実行例

```bash
$ ./timetable 月
月曜 1.なし 2.なし 3.なし 4.ロボット設計製作論3 5.ロボット設計製作論3 6.ロボット設計製作論3 7.ロボット設計製作論3 8.なし 9.なし 10.なし
```

```bash
$ echo 月 | ./timetable
月曜 1.なし 2.なし 3.なし 4.ロボット設計製作論3 5.ロボット設計製作論3 6.ロボット設計製作論3 7.ロボット設計製作論3 8.なし 9.なし 10.なし
```

## 動作環境

### 必要なソフトウェア
- Python
  - テスト済みバージョン：3.7~3.10
    
### テスト環境
- Ubuntu 22.04 LTS

## ライセンス
このソフトウェアパッケージは、3条項BSDライセンスの下, 再頒布および使用が許可されます。

©2024 Tonami Seki
