# 3つの容量の違うグラスがありそのうち一つだけ水が満たされている。ほかの測定器具を使わずに水を移す操作だけで水の量を決まった値にする
# グラスがA, B, CあってAに水が満たされている。このときAの水を半分にする。
# Aの容量を10以上100以下の偶数の時Aの水を半分にできるA,B,Cの組を答える。このとき、B,Cは互いに素で、B + C = A, B > Cとする

def search(abc, depth, max_abc, log)
    return false if log.has_key?(abc)
    return true if abc[0] == max_abc[0] / 2
    log[abc] = depth
    [0, 1, 2].permutation(2).each{|i, j|       # iが移す元のボトル、jが移す先のボトル
        if (abc[i] > 0) || (max_abc[j] - abc[j] > 0) then
            move = [abc[i], max_abc[j] - abc[j]].min    # 動かす量は小さい量の増減だから
            next_abc = abc.clone
            next_abc[i] -= move
            next_abc[j] += move
            return true if search(next_abc, depth + 1, max_abc, log)
        end
    }
    false
end

cnt = 0
10.step(100, 2).each{|a|
    (1..(a/2 - 1)).each{|c|     # B + C = Aからaが一番大きくて、さらにB > Cの条件から最大でもb,cはa/2だがb,cは等しくならない。
        b = a - c
        if b.gcd(c) == 1 then       # gcb()は最大公約数を返す。互いに素なので1になる。ここで条件を絞る
            cnt += 1 if search([a, 0, 0], 0, [a, b, c], {})
        end
    }
}

puts cnt