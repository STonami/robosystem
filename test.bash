#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Tonami Seki
# SPDX-License-Identifier: BSD-3-Clause

### timetableプログラムのテストスクリプト ###

# テスト失敗時の処理
ng() {
    echo "${1}行目が失敗しました"
    res=1
}

res=0

# 出力を正規化する関数（空白を削除）
normalize_output() {
    echo "$1" | tr -d '[:space:]'
}

### テスト1: 引数による曜日入力のテスト ###
out=$(./timetable 月)
expected="月曜 1.なし 2.なし 3.なし 4.ロボット設計製作論3 5.ロボット設計 製作論3 6.ロボット設計製作論3 7.ロボット設計製作論3 8.なし 9.なし 10.なし"
[ "$(normalize_output "$out")" = "$(normalize_output "$expected")" ] || ng "$LINENO"

### テスト2: 標準入力による曜日入力のテスト ###
out=$(echo 火 | ./timetable)
expected="火曜 1.英語理解4a 2.英語理解4a 3.なし 4.なし 5.なし 6.未来ロボ ティクス総合セミナー 7.未来ロボティクス総合セミナー 8.なし 9.なし 10.なし"
[ "$(normalize_output "$out")" = "$(normalize_output "$expected")" ] || ng "$LINENO"

### テスト3: 不正な曜日を入力した場合のエラー処理のテスト ###
out=$(./timetable 土 2>&1)
expected="エラー: 有効な曜日を指定してください。月、火、水、木、金のいず れかを入力してください。"
[ "$(normalize_output "$out")" = "$(normalize_output "$expected")" ] || ng "$LINENO"

### テスト4: 引数も標準入力もない場合のエラー処理のテスト ###
out=$(./timetable 2>&1)
expected="使い方: ./timetable <曜日> または echo <曜日> | ./timetable"
[ "$(normalize_output "$out")" = "$(normalize_output "$expected")" ] || ng "$LINENO"

### テスト5: 標準入力が複数行の場合のテスト ###
out=$(echo -e "水\n金" | ./timetable)
expected=$'水曜 1.数値解析学1 2.数値解析学1 3.センサ工学 4.センサ工学 5. なし 6.なし 7.なし 8.なし 9.なし 10.なし\n金曜 1.なし 2.信号処理論 3.信号処理論 4.なし 5.遊びと社会 6.遊びと社会 7.英語表現3a 8.英語表現3a 9.なし 10.なし'
[ "$(normalize_output "$out")" = "$(normalize_output "$expected")" ] || ng "$LINENO"

### テストの結果を出力 ###
if [ "$res" -eq 0 ]; then
    echo "すべてのテストを通過しました！"
else
    echo "テストに失敗しました。"
fi

exit "$res"
