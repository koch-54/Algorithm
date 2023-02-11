#100枚のカードを裏側から順番に表向きにしていく。1番目の人は2枚目から2の倍数番号を、2番目の人は3枚目から3の倍数番号ずつひっくり返していく。最終的に裏向きのカード（初期状態と同じ）の番号をこたえる
N = 100
cards = Array.new(N, false) #100個のfalse配列

(2..N).each{|i|
    j = i -1
while (j < cards.size) do
    cards[j] = !cards[j] #!でfalseをtrue、trueをfalseにする
    j += i
end      
}

N.times{|i|
    puts i + 1 if !cards[i] #裏向きなのはfalseだからtrueにしている
}