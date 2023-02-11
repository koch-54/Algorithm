#穴が6個、右と左にある靴にひもを通す。このときひもとひもの交点が最も多くなるとき何個になるか
#一番上からはじめ、左右交互にひもを通す
# 順列の配列を使うことでループ処理で全パターンを調べるようにする
N = 6

max_cnt = 0
(1..N-1).to_a.permutation(N-1){|l|          #左側の順番 右も左もN-1になるのは初めの一か所が固定されているから
    (1..N-1).to_a.permutation(N-1){|r|      #右側の順番
        path = []
        left = 0
        right = r[0]        #左からまず初めに入れる右の穴を調べる
        (N-1).times{|i|
            path.push([left, right])        #左->右と一回ずついれた穴を記録する
            left = l[i]         #つぎに右->左に通す穴を調べる
            path.push([left, right])
            right = r[i + 1]        #右の穴に通す次の穴を調べる            
        }
        path.push([left, 0])
            
        # ひもを通した後に交点の数を調べる
        cnt = 0
        (N * 2 - 1).times{|i|       # N * 2 - 1 はpathはleftに穴を通したときとrightに穴を通したときを交互に入れるからpathはN*2になる。インデックスは0から
            (i + 1).upto(N * 2 - 2){|j|
                cnt += 1 if (path[i][0] - path[j][0]) * (path[i][1] - path[j][1]) < 0 #交差する条件を調べる。[0, 1] [1, 0]のように右左の数値が逆転していると、交差するから、差分の積で負になるかを調べる
            }
        }
        max_cnt = [max_cnt, cnt].max
    }
}

puts max_cnt