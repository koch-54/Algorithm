# 横にｍ個、縦にｎ個格子点が並んでいる。このすべての点を一筆書きするときに何通りの書き方があるかを求める。ただし交差、斜め、直線以外の線を書いてはいけない。
W, H = 5, 4
@move = [[0, 1], [0, -1], [1, 0], [-1, 0]]

# 通った点かそうでないかを記録しておく
@map = Array.new(W * H, false)

def search(x, y, depth)
    return 0 if x < 0 || x >= W || y < 0 || y >= H || @map[x + y * W]   # すでに通った点か、枠の外に出た場合はカウントしない
    return 1 if depth == W * H
    cnt = 0
    @map[x + y * W] = true
    @move.each{|m|
        cnt += search(x + m[0], y + m[1], depth + 1)
    }
    @map[x + y * W] = false     # 潜ったら記録した値をもとに元に戻しておく
    return cnt
end

count = 0
(W * H).times{|i|
    count += search(i % W, i / W, 1)        # 引いた点の数とdepthは一致するので初期値は1
}

puts count / 2      # すでに数えた形を逆からたどった場合も存在するので2で割っとく
