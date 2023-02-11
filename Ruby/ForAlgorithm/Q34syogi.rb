# 盤面に飛車と角がある。その二つの駒の利き（動けるマス）のすべてを数えろ。その代わり、駒は重ならず、進行方向に駒があった場合はその先のマスは数えない

# 盤面を生成
@board = Array.new(11).map!{Array.new(11)}
(0..10).each{|i|
    (0..10).each{|j|
            @board[i][j] = (i == 0) || (i == 10) || (j == 0) || (j == 10) #端をtrueにしておけないようにする
        }
    }

count = 0
def search(x, y, dx, dy)
    return if @board[x][y]
    @check[x * 10 + y] = 1 #keyがxy(xが十の位、yが一の位)の整数になりわかりやすくなる
    search(x + dx, y + dy, dx, dy)
end

(1..9).each{|hy|
    (1..9).each{|hx|
        (1..9).each{|ky|
            (1..9).each{|kx|
                if (hx != kx) || (hy != ky) then #飛車と角の場所は重ならない条件
                    @check = Hash.new()     #Arrayで配列を作るようなもので、Hash()は連想配列を作る
                    @board[hx][hy] = @board[kx][ky] = true
                    [[-1, 0], [1, 0], [0, -1], [0, 1]].each{|hd|    #飛車の動く場所を一つずつ調べる
                        search(hx+hd[0], hy+hd[1], hd[0], hd[1])
                        }
                    [[-1, -1], [-1, 1], [1, -1], [1, 1]].each{|kd|  #角の動く場所を一つずつ調べる
                        search(kx+kd[0], ky+kd[1], kd[0], kd[1])
                        }
                    @board[hx][hy] = @board[kx][ky] = false  #元に戻す
                    count += @check.size #求めるマスの数は、checkの連想配列のサイズと同じ
                end
                }
            }
        }
    }
puts count