Epoch (Movable Type Plugin)
==========================================

&lt;MTCurrentEpoch&gt;
現在時刻をEpochTimeで表示する。

&lt;MTTime2Epoch time="20101220100401"&gt;
2010年12月20日10時4分1秒をEpochTimeで表示する。

time: YYYYmmddHHMMSSの形で対象時間を指定する。

&lt;MTDffer from="20101220100401" to="current"&gt;
2010年12月20日10時4分1秒から現在までの経過秒数を表示する。

&lt;MTDffer from="20101220100401" to="20110115081521"&gt;
2010年12月20日10時4分1秒から2011年1月15日8時15分21秒までの経過秒数を表示する。

from: YYYYmmddHHMMSSの形で計算する基準の時間を指定する。（必須・currentを指定した場合は現在の時間)

to: YYYYmmddHHMMSSの形で経過を計算する時間をを指定する。（必須・currentを指定した場合は現在の時間)

output: 整形して出力する。（指定無しの場合は秒数で出力・minutesまたはminを指定した場合は分[少数以下切り捨て]で出力・hourを指定した場合は時間[少数以下切り捨て]で出力・dayを指定した場合は日[少数以下切り捨て]で出力）
