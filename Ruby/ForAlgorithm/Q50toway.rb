# 一辺が1センチの正方形のマスで区切られたa * bの長方形がある。これが左上Aから右下Bに行く。この時A～Bの行き方として最長のものを考える。しかし縦か横の同じ直線上は最大２回までしか行けない
# 縦が5、横が6の時を求める

W, H = 6, 5
USABLE = 2
@max = 0
@horizon = Array.new(H + 1, 0)        # 水平方向に進んだ回数を保持
@vertical = Array.new(W + 1, 0)        # 垂直方向に進んだ回数を保持

def search(x, y)
    if (x == W) && (y == H) then
        @max = [@horizon.inject(:+) + @vertical.inject(:+), @max].max
        return
    end
    if @horizon[y] < USABLE then        # 水平方向に移動可能な時。水平方向一直線上はy座標が目印になる
        if x > 0 then       # 左に動かす条件 左に動かすときは必ずx座標が0より大きくなっていないとはみ出してしまうから
            @horizon[y] += 1
            search(x - 1, y) 
            @horizon[y] -= 1        # 深さ優先探索だから潜った後は変えた分だけ戻しておく。またAに戻ったときにまっさらな状態で使えるようにするため
        end
        if x < W then           # 右に動かすときの条件
            @horizon[y] += 1
            search(x + 1, y)
            @horizon[y] -= 1
        end
    end
    if @vertical[x] < USABLE then       # y方向に動かすときの条件, 垂直方向の直線上の目印はx座標
        if y > 0 then           # 上に動かせるときの条件
            @vertical[x] += 1
            search(x, y - 1)
            @vertical[x] -= 1
        end
        if y < H then       # 下に動かせるときの条件
            @vertical[x] += 1
            search(x, y + 1)
            @vertical[x] -= 1
        end
    end
end

search(0, 0)
puts @max