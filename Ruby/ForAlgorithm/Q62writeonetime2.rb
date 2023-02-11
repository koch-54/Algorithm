# Q62writeonetimeと同じ問題の別解

W, H = 5, 4
@move = [[0, 1], [0, -1], [1, 0], [-1, 0]]
@log = {}

def search(x, y, depth)
    return 0 if x < 0 || x >= W || y < 0 || y >= H
    return 0 if @log.has_key?(x + y * W)    # 同じ場所は通らない、交差しない
    return 1 if depth  ==  W * H
    if depth == W * H / 2 then
        remain = (0..(W * H - 1)).to_a - @log.keys  # 配列同士の差分、まだ残っている点をremianに入れる
        check(remain, remain[0])
        return 0 if remain.size > 0
    end
    cnt = 0
    @log[x + y * W] = depth
    @move.each{|m|
        cnt += search(x + m[0], y + m[1], depth + 1)
    }
    @log.delete(x + y * W)
    return cnt
end

# 残り半分の点を続きから一筆書きができるかどうかだけをcheckで調べている
def check(remain, del)
    remain.delete(del)
    left, right, up, down = del - 1, del + 1, del - W, del + W
    check(remain, left) if (del % W > 0) && remain.include?(left)
    check(remain, right) if (del % W != W - 1) && remain.include?(right)
    check(remain, up) if (del / W > 0) && remain.include?(up)
    check(remain, down) if (del / W != H - 1) && remain.include?(down)
end

count = 0
(W * H).times{|i|
    count += search(i % W, i / W, 1)
}

puts count / 2