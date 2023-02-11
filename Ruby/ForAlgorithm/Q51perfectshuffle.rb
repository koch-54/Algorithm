# 2n枚のカードがあってそれを先頭からn枚ずつに分け、それぞれの山から一枚ずつ交互になるよう混ぜる。(123,456 -> 142,536 -> ... -> 123,456)それを繰り返すと並びが最初に戻る。
# この時nが1以上100以下のなかで2(n-1)回で元に戻るのはいくつか調べる。

def shuffle(cards)
    left = cards.take(cards.size / 2)
    right = cards.drop(cards.size / 2)
    result = []
    left.size.times{|i|
        result.push(left[i])
        result.push(right[i])
    }
    result
end

count = 0
# 何回でも元に戻るが2(n-1)回目でも元に戻ったものの数
(1..100).each{|n|
    init = (1..(2*n)).to_a
    cards = init.clone
    (2 * (n - 1)).times{|i|
        cards = shuffle(cards)
    }
    count += 1 if cards == init
}

puts count

count = 0
# 2(n-1)回目で初めて元に戻るものの数
(1..100).each{|n|
    init = (1..(2*n)).to_a
    cards = init.clone
    i = 0
    while true do
        cards = shuffle(cards)
        i += 1
        break if cards == init        
    end
    count += 1 if i == 2 * (n - 1)
}

puts count