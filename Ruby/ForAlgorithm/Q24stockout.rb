# 投げたボールを3*3のパネルにあてて、9枚のパネルをひっくり返すことを考える。このとき５番以外のカードは隣り合った２枚だけ同時にひっくり返すことができる。
# このとき９枚のパネルをひっくり返すのは何通りあるかを求める

# 打ち抜くパターンを記録したboardを定義する
# 同時に打ち抜く場合の全部
board = [[1, 2], [2, 3], [7, 8], [8, 9], [1, 4], [4, 7], [3, 6], [6, 9]]
# 一枚ずつ打ち抜く場合　
1.upto(9){|i|
    board.push([i])
}


@memo = {[] => 1}
def strike(board)
    # すでに探索済みの場合はその値を返す
    return @memo[board] if @memo.has_key?(board)
    cnt = 0
    board.each{|b|
        next_board = board.select{|i| (b & i).size == 0}    # &はビット積でビット数を返す。このときは共通のものがないということ。select{条件}は条件に合ったものを返す。bに打ち抜いたもの、next_boardに余りのパネル
        cnt += strike(next_board)
    }
    @memo[board] = cnt
end

puts strike(board)