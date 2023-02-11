# グー、チョキ、パーを使った多数決を考える。このとき手の形が一番多いものを勝ちとする。100人のでこの多数決じゃんけんをしたとき一発で勝負がつく人数の組み合わせは何通りあるか

N = 100

cnt = 0

0.upto(N){|rock|
    0.upto(N - rock){|scissors|
        paper = N - rock - scissors
        all = [rock, scissors, paper]
        cnt += 1 if all.count(all.max) == 1
    }
}

puts cnt