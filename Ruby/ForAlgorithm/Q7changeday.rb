# 1964年10/10～2020年07/24の日付の中から2進数の逆にしても同じになる日付を選ぶ

require 'date'

term = Date.parse('19641010')..Date.parse('20200724')#parseは文字列を解析して配列を作る

term_list = term.map{|d|d.strftime('%Y%m%d').to_i}#mapは条件に合った値を返す

puts term_list.select{|d| d == d.to_s(2).reverse.to_i(2)} #数値として同じだから、2進数10進数の統合が成り立つ