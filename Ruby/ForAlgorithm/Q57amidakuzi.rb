# 縦線が７本、横線が10本になるようにあみだくじを考えたとき下の数字の並びは何通りあるかを調べる。上の数字は1, 2, 3, 4, 5, 6, 7

# あみだくじの横線を決めるとき直線の好転の数で求める方法

# 縦線と横線
v, h = 7, 10
total = 0
(0..(v-1)).to_a.permutation.each{|goal|
    cnt = 0
    v.times{|i|
        cnt += goal.take_while{|j| j != i}.count{|k| k > i}     # 交点の数を求める。交点は線を引いたものよりも前にあるものとできるのでtake_whileを使って線をひく(下に同じ数字がでてくる)まで要素を持ってきてcountでその中からまだ線を引いていないもの(iより大きいもの)を数える
    }
    total += 1 if cnt == h
}

puts total

# 別解　処理を高速にする
# hのインデックスを横線の数、その要素をパターン数

@v, @h = 7, 10      # 目標

# 再帰的に横線を作る
def make_bars(v, h)
    new_h = Array.new(h.size + v - 1, 0)    # 前の配列hに新しくできる部分を結合するみたいな感じ
    v.times{|i|
        h.each_with_index{|cnt, j|
            new_h[i + j] += cnt     
        }
    }
    if v == @v + 1 then     # v == 7のときまで数えるから8になった時点で終わり
        puts h[@h]          # 目標の本数のときのパターン数を出す
    else
        make_bars(v + 1, new_h)
    end
end

make_bars(1, [1])   # 初期値　縦線1本、横線が0のときを1パターン