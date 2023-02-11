# 横ｍマス、縦ｎマスの長方形があるこれを同じ大きさの2つの領域になるように分けるとき何通りの分割方法があるか。
# このとき同じ領域は縦、横でつながっていなければならず、同じ領域が切り分けられていたり、斜めにしかつながっていないものはダメ

# 最初に半分の大きさに分割して、それが連結しているものかを確認する
W, H = 5, 4

def check(color, del)
    color.delete(del)
    #移動
    left, right, up, down = del - 1, del + 1, del - W, del + W
    
    check(color, left) if (del % W > 0) && color.include?(left) # 今いるマスの位置が正でleftがあったら
    check(color, right) if (del % W != W - 1) && color.include?(right)  # 今いるのが一番右の端っこじゃなくて、rightがあったら
    check(color, up) if (del / W > 0) && color.include?(up)     
    check(color, down) if (del / W != H - 1) && color.include?(down)
end

map = (0..W*H-1).to_a
count = 0
map.combination(W * H / 2){|blue|
    if blue.include?(0) then
        white = map - blue
        check(blue, blue[0])
        check(white, white[0]) if blue.size == 0
        count += 1 if white.size == 0
    end
}

puts count