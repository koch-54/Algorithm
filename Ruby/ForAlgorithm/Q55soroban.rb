# そろばんを使って1~10までの和を求めるとき、もっとも玉を動かす数が少なくなるような和の順番を求める
# そろばんは5の玉と1の玉がある。今回は和が55なので、十の位の5の玉が動く量、十の位の1の玉が動く量、一の位の5の玉が動く量、一の位の1の玉が動く量を考えればいいい

def move(base, add)
    # 十の位の5の玉
    a0, remainder1 = (base + add).divmod(50)       # 十の位の5の玉を動かす数は50で割ったときの商, 余りは残った数  足した数を含めた総和から動かした十の位の5の玉の数の総和と残りの数  
    b0, base_remainder1 = base.divmod(50)           # 足す前の数からの商と余りということは、すでに動かしてある玉の数と残りの総和    
    # 十の位の1の玉
    a1, remainder2 = remainder1.divmod(10)
    b1, base_remainder2 = base_remainder1.divmod(10)

    a2, remainder3 = remainder2.divmod(5)     # 商(a2)が1の位の5の玉の総数、余り(a3)が1の位の1の玉の総数
    b2, base_remainder3 = base_remainder2.divmod(5)

    # 動かした玉の数
    (a0 - b0).abs + (a1 - b1).abs + (a2 - b2).abs + (remainder3 - base_remainder3).abs      # (総和から動かした玉の数 - すでに動かしている玉の数)を50, 10, 5, 1の玉でそれぞれやる
end

def count(list)
    cnt = total = 0
    list.each{|i|
        cnt += move(total, i)
        total += i
    }
    cnt
end

min = 10000
(1..10).to_a.permutation(10){|i|
    min = [count(i), min].min
}
puts min

