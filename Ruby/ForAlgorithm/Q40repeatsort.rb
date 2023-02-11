# N枚のカードがあって、そのカードに1~Nまでの数字が一つずつ書かれている。そのカードを横に並べたとき先頭の数字の枚数だけ選んで逆順にする。この操作を繰り返すとき
# カードが動かせなくなるまでに最大で何回かかるかを求める。

# ランダムに並べられた状態からsortしていくとき
N = 9
@max = 0
@same_max = Hash.new # same_maxは最大回数がかぶってしまったときに、初期状態と最後の状態を記録する連想配列

def solve(cards, init, depth) # initは初期状態
    if cards[0] == 1 then  # 先頭が1になった時点で動かせなくなる
        if @max < depth then
            @max = depth
            @same_max.clear
        end
        @same_max[init] = cards if @max == depth
    else
        solve(cards[0..cards[0] - 1].reverse + cards[cards[0]..N], init, depth + 1)
    end
end

(1..N).to_a.permutation.each{|i|
    solve(i, i, 0)    
}

puts @max
puts @same_max

