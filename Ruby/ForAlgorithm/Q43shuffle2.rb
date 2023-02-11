# Q43shuffleでは処理が遅くて求まらないのでもっと早くする
# Q43shuffleでは幅探索、こっちでやったのは幅探索の応用で双方向探索という

n = 5
fw = [(1..n*2).to_a]
bw = [(1..n*2).to_a.reverse]

depth = 1
while true do
    # 順方向から探索
    fw = fw.each_with_object([]) do |c, result|
        1.upto(n){|i| result << c[i, n] + c[0, i] + c[n+i..-1]}
    end
    break if (fw & bw).size > 0
    depth += 1

    #答えから探索
    bw = bw.each_with_object([]) do |c, result|
        1.upto(n){|i| result << c[n, i] + c[0, n] + c[i+n..-1]}
    end
    break if (fw & bw).size > 0
    depth += 1
end

puts depth