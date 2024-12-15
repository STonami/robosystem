#!/bin/bash

# テスト対象のスクリプト
SCRIPT="./timetable.py"

# テスト1: 引数による実行
echo "テスト1: 引数による実行"
OUTPUT=$(python3 $SCRIPT 月)
EXPECTED="月曜 1.なし 2.なし 3.なし 4.ロボット設計製作論3 5.ロボット設計製作論3 6.ロボット設計製作論3 7.ロボット設計製作論3 8.なし 9.なし 10.なし"
if [[ "$OUTPUT" == "$EXPECTED" ]]; then
  echo "PASS"
else
  echo "FAIL: 引数による実行"
  echo "  出力: $OUTPUT"
  echo "  期待: $EXPECTED"
  exit 1
fi

# テスト2: 標準入力による実行
echo "テスト2: 標準入力による実行"
OUTPUT=$(echo "火" | python3 $SCRIPT)
EXPECTED="火曜 1.英語理解4a 2.英語理解4a 3.なし 4.なし 5.なし 6.未来ロボティクス総合セミナー 7.未来ロボティクス総合セミナー 8.なし 9.なし 10.なし"
if [[ "$OUTPUT" == "$EXPECTED" ]]; then
  echo "PASS"
else
  echo "FAIL: 標準入力による実行"
  echo "  出力: $OUTPUT"
  echo "  期待: $EXPECTED"
  exit 1
fi

# テスト3: 入力なしの場合
echo "テスト3: 入力なしの場合"
OUTPUT=$(python3 $SCRIPT 2>&1)
EXPECTED="使い方: timetable.py [<曜日>] または echo <曜日> | timetable.py"
if [[ "$OUTPUT" == "$EXPECTED" ]]; then
  echo "PASS"
else
  echo "FAIL: 入力なしの場合"
  echo "  出力: $OUTPUT"
  echo "  期待: $EXPECTED"
  exit 1
fi

# テスト4: 無効な曜日
echo "テスト4: 無効な曜日"
OUTPUT=$(python3 $SCRIPT 土 2>&1)
EXPECTED="エラー: 有効な曜日を指定してください。月、火、水、木、金のいずれかを入力してください。"
if [[ "$OUTPUT" == "$EXPECTED" ]]; then
  echo "PASS"
else
  echo "FAIL: 無効な曜日"
  echo "  出力: $OUTPUT"
  echo "  期待: $EXPECTED"
  exit 1
fi

echo "すべてのテストを通過しました！"

