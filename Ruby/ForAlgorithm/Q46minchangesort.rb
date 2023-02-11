# 1 ~ 7の数字のすべての順列において2つの数字だけを入れ替える操作だけで小さいほうから並べた形にするのに最小の交換回数の合計を求める。
# 並べ替えが完了した状態から逆方向に計算してみる 

N = 7
checked = {(1..N).to_a => 0}  # 調べた数列を格納しておく
check = [(1..N).to_a]
depth = 0

while check.size > 0 do
    next_check = []
    (0..(N-1)).to_a.combination(2){|i, j|
        check.each{|c|
            d = c.clone
            d[i], d[j] = d[j], d[i]
            if !checked.has_key?(d) then
                checked[d] = depth + 1
                next_check << d
            end
        }
    }
    check = next_check
    depth += 1
end

puts checked.values.inject(:+)