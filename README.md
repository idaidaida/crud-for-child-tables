# 概要
複数の小テーブルを持つ親テーブルがあるときに、親テーブルと小テーブルを同時に操作するサンプルコードを書いた。

# 前提
## テーブル構成
### 学校テーブル(親テーブル)
- 学校名(string)

### 生徒テーブル(小テーブル)
- 氏名(string)
- 所属学校(外部キー)
