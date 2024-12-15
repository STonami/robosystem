#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Tonami Seki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0

### timetableのテスト ###

### テスト1: 引数による通常の曜日入力 ###
out=$(./timetable 月)
expected="月曜 1.なし 2.なし 3.なし 4.ロボット設計製作論3 5.ロボット設計製作論3 6.ロボット設計製作論3 7.ロボット設計製作論3 8.なし 9.なし 10.なし"
[ "$out" = "$expected" ] || ng "$LINENO"

### テスト2: 標準入力による通常の曜日入力 ###
out=$(echo 火 | ./timetable)
expected="火曜 1.英語理解4a 2.英語理解4a 3.なし 4.なし 5.なし 6.未来ロボティクス総合セミナー 7.未来ロボティクス総合セミナー 8.なし 9.なし 10.なし"
[ "$out" = "$expected" ] || ng "$LINENO"

### テスト3: 入力なしで使い方を表示 ###
out=$(./timetable 2>&1)
expected="使い方: ./timetable [<曜日>] または echo <曜日> | ./timetable"
[ "$out" = "$expected" ] || ng "$LINENO"

### テスト4: 無効な曜日 (土) のエラー表示 ###
out=$(./timetable 土 2>&1)
expected="エラー: 有効な曜日を指定してください。月、火、水、木、金のいずれかを入力してください。"
[ "$out" = "$expected" ] || ng "$LINENO"

### テスト5: 無効な曜日 (日) のエラー表示 ###
out=$(./timetable 日 2>&1)
expected="エラー: 有効な曜日を指定してください。月、火、水、木、金のいずれかを入力してください。"
[ "$out" = "$expected" ] || ng "$LINENO"

### テスト6: 無効な文字入力 ###
out=$(echo あ | ./timetable 2>&1)
expected="エラー: 有効な曜日を指定してください。月、火、水、木、金のいずれかを入力してください。"
[ "$out" = "$expected" ] || ng "$LINENO"

### テスト7: 標準入力なしで使い方を表示 ###
out=$(echo "" | ./timetable 2>&1)
expected="使い方: ./timetable [<曜日>] または echo <曜日> | ./timetable"
[ "$out" = "$expected" ] || ng "$LINENO"

### テスト8: 無効な引数のエラー (複数の引数) ###
out=$(./timetable 月 火 2>&1)
expected="エラー: 有効な曜日を指定してください。月、火、水、木、金のいずれかを入力してください。"
[ "$out" = "$expected" ] || ng "$LINENO"

[ "$res" = 0 ] && echo "すべてのテストを通過しました！"
exit "$res"

