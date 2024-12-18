#!/bin/bash
# SPDX-FileCopyrightText: 2024 Tonami Seki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "NG: ${1}行目でテスト失敗"
    res=1
}

res=0

out=$(./timetable 月)
[ "${out}" = "月曜 1.なし 2.なし 3.なし 4.ロボット設計製作論3 5.ロボット設計製作論3 6.ロボット設計製作論3 7.ロボット設計製作論3 8.なし 9.なし 10.なし" ] || ng "$LINENO"

out=$(./timetable 土 2>&1)
[ "${out}" = "エラー: 有効な曜日を指定してください。月、火、水、木、金のいずれかを入力してください。" ] || ng "$LINENO"

out=$(echo 火 | ./timetable)
[ "${out}" = "火曜 1.英語理解4a 2.英語理解4a 3.なし 4.なし 5.なし 6.未来ロボティクス総合セミナー 7.未来ロボティクス総合セミナー 8.なし 9.なし 10.なし" ] || ng "$LINENO"

out=$(echo -e "水\n金" | ./timetable)
[ "${out}" = "水曜 1.数値解析学1 2.数値解析学1 3.センサ工学 4.センサ工学 5.なし 6.なし 7.なし 8.なし 9.なし 10.なし
金曜 1.なし 2.信号処理論 3.信号処理論 4.なし 5.遊びと社会 6.遊びと社会 7.英語表現3a 8.英語表現3a 9.なし 10.なし" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo "OK"
exit $res

