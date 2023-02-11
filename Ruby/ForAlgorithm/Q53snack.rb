# 5種類の味のお菓子が6個ずつあるとき、どのお菓子も中身と包み紙が違くなるのは何通りあるかを調べる。
# このとき同じ包み紙は同じ味でも区別するが、中身が同じ味のものは区別しない。つまり、リンゴの包み紙1にイチゴ味1とリンゴの包み紙2にイチゴ味2は区別するが、リンゴの包み紙1にイチゴ味1とリンゴの包み紙1にイチゴ味2は区別しない

N, M = 5, 6
@memo = {}

# candyはサイズが種類の数で要素がお菓子の残りの数   colorでインデックス番号を決めることで種類を決める
def search(candy, color)
    return 1 if candy == [0] * N        # 全種のお菓子を包んだ　[0] * Nは[0, 0, 0, 0, 0]
    return @memo[candy + [color]] if @memo.has_key?(candy + [color])

    cnt = 0
    candy.size.times{|i|
        if i != (color % candy.size) then       # (color % candy.size)は定数で余りを調べることで5種類なら0~4までを求めている。不一致なものを調べる
            if candy[i] > 0 then            # まだ残ってた時
                candy[i] -= 1
                cnt += search(candy, color + 1)
                candy[i] += 1
            end
        end
    }
    @memo[candy + [color]] = cnt    # keyにはcandyの配列とcolor(整数だが、配列とまとめておくために配列にして足している)をvalueにはそのときのcntをメモっとく
end

puts search([M] * N, 0)    # 関数の処理をすべて終わらせたときの引数で@memoの値を出力する