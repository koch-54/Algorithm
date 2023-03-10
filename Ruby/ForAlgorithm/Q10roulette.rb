# カジノのルーレットのヨーロッパスタイル、アメリカンスタイルを考える。
# nが2~36の中で連続するn個の数の和が最大になる場合を求め、このときヨーロピアンスタイルの和がアメリカンスタイルの和よりも小さくなる場合はいくつあるかを求める

european = [0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 
            36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9,
            22, 18, 29, 7, 28, 12, 35, 3, 26]

american = [0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15,
            3, 24, 36, 13, 1, 00, 27, 10, 25, 29, 12, 8, 19,
            31, 18, 6, 21, 33, 16, 4, 23, 35, 14, 2]

def sum_max(roulette, n)
    ans = 0
    roulette.size.times{|i|
        tmp = 0
        #roulette.sizeをはみ出ない場合
        if i + n <= roulette.size then #i+nは始まる位置からの選んだ個数
            tmp = roulette[i, n].inject(:+)              
       else
        #roulette.sizeをはみ出る場合
        tmp = roulette[0, (i+n)%roulette.size].inject(:+) #はみ出た場合ははみ出た分だけ最初から数えなおす
        tmp += roulette[i..-1].inject(:+) #i番目から最後までの和を求める
       end
        ans = [ans, tmp].max
    }
    ans
end

cnt = 0
(2..36).each{|i|
 cnt += 1 if sum_max(european, i) < sum_max(american, i)
}

puts cnt