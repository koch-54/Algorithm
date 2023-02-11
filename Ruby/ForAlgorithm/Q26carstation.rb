# 10*10のマスの中に車が止まっている。左上にある車が右下に移動するためには最短でなんて必要か。
# マスには車が止まっているが、１マスだけ空白があり、１マスずつ車を動かす

# 右下から、左上にある状態にする。求める答えと逆の手順で行う
W, H = 10, 10
parking = Array.new(W + 2){Array.new(H + 2){1}} # 1で正規化した２次元配列, +2は端っこを決めるため。端に番兵を置くための場所
# 2次元配列の周囲を番兵９の枠で囲む
(W + 2).times{|w|
    parking[w][0] = parking[w][H + 1] = 9       # すべての配列の行の端に番兵９を追加
}
(H + 2).times{|h|
    parking[0][h] = parking[W + 1][h] = 9       # 配列の列の端っこを番兵９を追加
}      

# ゴールの状態は左上に目的のものがある状態でゴールの形を教えておく
@goal = Marshal.load(Marshal.dump(parking))      # 多次元配列のすべての要素をコピーする
@goal[1][1] = 2

# 開始位置は右下に目的のものがある
start = Marshal.load(Marshal.dump(parking))
start[W][H] = 2

def search(prev, depth)
    target = []     # targetには関数で調べたときのprevからの次の状態を記録しておく
    prev.each{|parking, w, h|
        [[-1, 0], [1, 0], [0, -1], [0, -1]].each{|dw, dh|
            nw, nh = w + dw, h + dh
            if(parking[nw][nh] != 9) then
                temp = Marshal.load(Marshal.dump(parking))  # tempには暫定の現在状況を入れる
                temp[w][h], temp[nw][nh] = temp[nw][nh], temp[w][h] # 2(車の位置)が変わっていくので、2が入っているマス([w][h])は新しいマスに移動させ何も入っていないます([nw][nh])は前のマスにいれ、交換する
                if !@log.has_key?([temp, nw, nh]) then
                    target.push([temp, nw, nh])
                    @log[[temp, nw, nh]] = depth + 1
                end
            end
        }
    }
    return if target.include?([@goal, W, H])    # target(次の状態)が目的のものになったらreturnする
    search(target, depth + 1) if target.size > 0
end

@log = {}
@log[[start, W, H - 1]] = 0
@log[[start, W - 1, H]] = 0

search([[start, W, H - 1], [start, W - 1, H]], 0)   # -1をしているのは数え始めるマスは1手のうちに入らない
# p @log[[@goal, W, H]]
puts @log[[@goal, W, H]]