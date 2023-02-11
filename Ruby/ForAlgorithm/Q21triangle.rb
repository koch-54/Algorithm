# 1と0の排他的論理和によってできた三角形を考える。一番上とすべての行の両端は1になる。そのとき、2014番目に出てくる0の行番号を求める
count = 0
line = 1
row = [1]

while count < 2014 do
    next_row = [1]
    (row.size - 1).times{|i|
        cell = row[i] ^ row[i + 1]  # ^ は排他的論理和を求める
        next_row.push(cell)
        count += 1 if cell == 0
    }
    next_row.push(1)  # 最初と最後は１確定だから始めと終わりに１を入れておく
    line += 1
    row = next_row    
end

puts line