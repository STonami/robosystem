#!/bin/bash
# SPDX-FileCopyrightText: 2024 Tonami Seki
# SPDX-License-Identifier: BSD-3-Clause

# エラーメッセージ関数
ng () {
    echo "NG: ${1}行目でテスト失敗"
    res=1
}

# 初期化
res=0

# テストケース 1: 引数指定 (月)
out=$(./timetable 月)
expected="月曜 1.なし 2.なし 3.なし 4.ロボット設計製作論3 5.ロボット設計製作論3 6.ロボット設計製作論3 7.ロボット設計製作論3 8.なし 9.なし 10.なし"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# テストケース 2: 無効な曜日 (土)
out=$(./timetable 土 2>&1)
expected="エラー: 有効な曜日を指定してください。月、火、水、木、金のいずれかを入力してください。"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# テストケース 3: 標準入力から曜日を渡す (火)
out=$(echo 火 | ./timetable)
expected="火曜 1.英語理解4a 2.英語理解4a 3.なし 4.なし 5.なし 6.未来ロボティクス総合セミナー 7.未来ロボティクス総合セミナー 8.なし 9.なし 10.なし"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# テストケース 4: 複数行の標準入力 (水, 金)
out=$(echo -e "水\n金" | ./timetable)
expected="水曜 1.数値解析学1 2.数値解析学1 3.センサ工学 4.センサ工学 5.なし 6.なし 7.なし 8.なし 9.なし 10.なし
金曜 1.なし 2.信号処理論 3.信号処理論 4.なし 5.遊びと社会 6.遊びと社会 7.英語表現3a 8.英語表現3a 9.なし 10.なし"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# テストケース 5: 引数も標準入力もない場合
out=$(./timetable 2>&1)
expected="使い方: ./timetable <曜日> または echo <曜日> | ./timetable"
[ "${out}" = "${expected}" ] || ng "$LINENO"

# 成功メッセージ
[ "${res}" = 0 ] && echo "OK"

# 終了コード
exit $res

