#10000以下の偶数nで、最初と数字が奇数の時、nに3をかけて1を足す。ｎが偶数の時、2で割るを繰り返したときｎが最初の数に戻るものを探す
def is_loop(n)
    check = n * 3 + 1
    while check != 1 do
        check = check.even? ? check / 2 : check * 3 + 1 #.even?で偶数かを判定する。条件 ? true : flase
        return true if check == n
    end
    return false
end

puts 2.step(10000, 2).count{|i|
    is_loop(i)
}