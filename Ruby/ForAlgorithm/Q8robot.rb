# お掃除ロボットが(0, 0)からN回動くことを考える。ロボットは前後左右に一マスずつ。このときロボットの動きかたは何通りかるか調べる

N = 12

def move(log)
    return 1 if log.size == N + 1 # 初期位置(0, 0)は入れない

    cnt = 0
    [[0, 1],[0, -1], [1, 0], [-1, 0]].each{|d|
    next_pos = [[log[-1][0] + d[0], log[-1][1] + d[1]]] #x座標y座標をそれぞれ足している
    
    if !log.include?(next_pos) then #logにnext_posが含まれていなかったら
        cnt += move(log + next_pos)  #logの二次元配列に新しく配列を追加
    end
}
    cnt
end

puts move([[0, 0]])