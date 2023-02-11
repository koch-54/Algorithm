#受難のファサードという魔方陣を以下の条件のもと考える。条件：足し合わせるのは縦横斜めに限らない。足す個数は4つとは限らない。
#数字を足し合わせたとき、和が同じになる組み合わせが一番多くなるときその和はいくつになるか。
#indexで和を求めて、その和(index)の値が組み合わせの数
mazic_area = [1, 14, 14, 4, 11, 7, 6, 9, 8, 10, 10, 5, 13, 2, 3, 15]

sum_all = mazic_area.inject(:+)
# p sum_all
sum = Array.new(sum_all + 1){0}    #合計値のサイズでリストをつくり、0で正規化
# p sum

sum[0] = 1 #何も足さないとき１とする
# p sum
mazic_area.each{|n|
    (sum_all - n).downto(0).each{|i| #downto(n)nの値まで減っていく。このときsum_all-nから0まで。sum_all-nはn以外の和
        sum[i + n] += sum[i] #nがあるときの組み合わせは、nがないときの組み合わせを再利用してあるときと足して求める
        # p sum
        }
    }

# p sum
puts sum.find_index(sum.max)
