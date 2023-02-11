#ケーキをn個に切り分けるときにイチゴが1～n個乗っているようにする。ケーキの切り方はすべて違う。また隣り合うイチゴの数の和が平方数になってなければならない。その時の最小のnを求める。

#nは目標のケーキの数(最後のイチゴの数)
#preはlog[-1]のケーキ
#logは切り分けたケーキの上に乗っかているイチゴの数の配列
#squareは平方数の配列

def check(n, pre, log, square) 
    if n == log.size then #切り分ける数が切り分けた後と同じにならなければならない
        if square.include?(1 + pre) then #ケーキは円形になっているから、一番最後のイチゴは一番最初の位置ごとの和をとる必要がある。一番最初は1だからpre+1になる
            puts n
            p log
            return true
        end
    else((1..n).to_a - log).each{|i| #配列 - 配列はその要素が差分される。このときlogにある要素が差分されている
        if square.include?(pre + i) then
        return true if check(n, i, log + [i], square)
        end
    }
    end
    false
end

n = 2 #n>1だからn=2は初期値
while true do
    #平方数を求める
    square = (2..Math.sqrt(n * 2).floor).map{|i| i**2} #平方数になる->平方数は2乗の平方根になる->平方根までを二乗して配列にする->平方数の配列になる .floorは小数を切り捨て    
    break if check(n, 1, [1], square) #関数の戻り値がtrueだったらループを抜ける
    n += 1
end
