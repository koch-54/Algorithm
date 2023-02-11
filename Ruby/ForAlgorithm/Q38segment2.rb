# Q38segmentのファイルの問題の別解
# より処理速度を早く

bit = [0b1111110, 0b0110000, 0b1101101, 0b1111001, 0b0110011,
    0b1011011, 0b1011111, 0b1110000, 0b1111111, 0b1111011]

# 排他的論理和の結果を先に算出
flip = Array.new(10)
(0..9).each{|i|
    flip[i] = Array.new(10)
    (0..9).each{|j|
        flip[i][j] = (bit[i]^bit[j]).to_s(2).count("1")    
    }    
}

min = 63
(0..9).to_a.permutation.each{|seq|
    sum = 0
    (seq.size - 1).times{|j|
        sum += flip[seq[j]][seq[j + 1]]
        break if sum >= min    
    }
    min = sum if sum < min    
}

puts min