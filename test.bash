#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Tonami Seki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が失敗しました"
    res=1
}

res=0

### 正常動作のテスト ###

# テスト1: 正常な引数入力 (月)
out=$(./timetable 月)
expected="月曜 1.なし 2.なし 3.なし 4.ロボット設計製作論3 5.ロボット設計製作論3 6.ロボット設計製作論3 7.ロボット設計製作論3 8.なし 9.なし 10.なし"
[ "$out" = "$expected" ] || ng "$LINENO"
[ "$?" = 0 ] || ng "$LINENO"

# テスト2: 標準入力からの正常な曜日入力 (火)
out=$(echo 火 | ./timetable)
expected="火曜 1.英語理解4a 2.英語理解4a 3.なし 4.なし 5.なし 6.未来ロボティクス総合セミナー 7.未来ロボティクス総合セミナー 8.なし 9.なし 10.なし"
[ "$out" = "$expected" ] || ng "$LINENO"
[ "$?" = 0 ] || ng "$LINENO"

# テスト3: 標準入力なしで使い方メッセージ
out=$(./timetable 2>&1)
expected="使い方: timetable [<曜日>] または echo <曜日> | timetable"
[ "$out" = "$expected" ] || ng "$LINENO"
[ "$?" = 0 ] || ng "$LINENO"

### エラー処理のテスト ###

# テスト4: 無効な曜日 (土)
out=$(./timetable 土 2> err.log)
[ "$?" = 1 ] || ng "$LINENO"
err=$(cat err.log)
expected="エラー: 有効な曜日を指定してください。月、火、水、木、金のいずれかを入力してください。"
[ "$err" = "$expected" ] || ng "$LINENO"

# テスト5: 無効な曜日 (日)
out=$(./timetable 日 2> err.log)
[ "$?" = 1 ] || ng "$LINENO"
err=$(cat err.log)
[ "$err" = "$expected" ] || ng "$LINENO"

# テスト6: 入力なしの標準入力エラー
out=$(echo "" | ./timetable 2> err.log)
[ "$?" = 1 ] || ng "$LINENO"
err=$(cat err.log)
expected="使い方: timetable [<曜日>] または echo <曜日> | timetable"
[ "$err" = "$expected" ] || ng "$LINENO"

# テスト7: 無効な文字列入力
out=$(echo あ | ./timetable 2> err.log)
[ "$?" = 1 ] || ng "$LINENO"
err=$(cat err.log)
expected="エラー: 有効な曜日を指定してください。月、火、水、木、金のいずれかを入力してください。"
[ "$err" = "$expected" ] || ng "$LINENO"

# テスト8: 複数引数のエラー
out=$(./timetable 月 火 2> err.log)
[ "$?" = 1 ] || ng "$LINENO"
err=$(cat err.log)
[ "$err" = "$expected" ] || ng "$LINENO"

### 結果出力 ###
[ "$res" = 0 ] && echo "すべてのテストを通過しました！"
exit "$res"
