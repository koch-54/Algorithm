# セルの結合を考える。4行4列のセルがあったときこれを結合してできるパターンは何通りか。また1*1のセルがないようにするときの結合のパターンは何通りか

W, H = 4, 4

# pos : 探索する位置
# cells : セルが使用済みかどうかを全セルについてtrue/falseで保持
# is1x1 : 1 * 1のセルがあるかどうか
# 返り値 : [結合できるパターン数, 1*1のセルがないパターン数]

def search(pos, cells, is1x1)
    if pos == W * H then    # 探索の終了
       if is1x1 then    # ある場合は普通のパターン数だけカウント
            return [1, 0]
       else             # 1*1のセルがないときは両方カウント
            return [1, 1]
       end
    end
    # 今の場所が探索済みのとき次の場所に移動する
    return search(pos + 1, cells, is1x1) if cells[pos]
    # 最後まで行ってなくて、未探索の場所の処理
    x, y = pos % W, pos / W
    result = [0, 0]
    (1..(H - y)).each{|dy|        # 垂直方向の大きさ
        (1..(W - x)).each{|dx|      # 水平方向の大きさ
            next_cells = cells.clone    
            settable = true         # 長方形をセットできるか
            dy.times{|h|
                dx.times{|w|
                    if next_cells[(x + w) + (y + h) * W] then
                        settable = false        # 値があった場合はセットできないのでfalseにする
                    else
                        next_cells[(x + w) + (y + h) * W] = true
                    end
                }
            }
            if settable then        # セルがまだ結合できるときは、処理の結果を代入して関数を呼び出し結果を足す
                res = search(pos + 1, next_cells, is1x1 || (dx == 1 && dy == 1))    # 第三引数の論理演算はdx,dyの両方が1のときtrueをかえす。つまり全体としてどちらかがtrue(一マスのがある)のとき値がtrueになる
                result[0] += res[0]
                result[1] += res[1]
            end
        }
    }
    return result
end

cells = Array.new(W * H, false)
puts search(0, cells, false)