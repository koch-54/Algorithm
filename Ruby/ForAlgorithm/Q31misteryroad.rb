# 正方形の中を左上の角から右下の角で往復するときの道順は何通りか。今回は6*6で1度通った道は2回通れない

square = 6
@count = 0
# 3次元配列　横,縦の二次元配列に、[x方向, y方向]の一次元配列をいれる
@is_used = Array.new(square + 1){Array.new(square + 1){Array.new(2){false}}}


def route(x, y, is_first_time, square)
    # is_first_timeで行きか帰りかをみる
    if ((x == square) && (y == square))
        if (is_first_time)
            route(0, 0, false, square) #行きの片道だったら帰りの分を調べるためにもう一回調べる
        else
            @count += 1
       end
    end
    if(x < square)
        if(!@is_used[x][y][0])
            @is_used[x][y][0] = true    #　同じ道は通れないから判定を変えておく
            route(x + 1, y, is_first_time, square) 
            @is_used[x][y][0] = false #次のパターンを見るために値をリセットする。再帰的に関数を呼び出しているので、ここで変えた判定をリセットしても問題ない
        end
    end
    if(y < square)
        if(!@is_used[x][y][1])
            @is_used[x][y][1] = true
            route(x, y + 1, is_first_time, square)
            @is_used[x][y][1] = false
        end
    end
end

route(0, 0, true, square)
puts @count