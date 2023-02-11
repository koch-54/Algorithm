# 1つだけの数字と四則演算だけで1234を作る。このとき最も少ない個数でできる数字と式をこたえろ
# このとき四則演算の優位順位を変える()を使ってはならない

op = ['+', '-', '*', '/', '']

found = false
len = 1
while !found do
    op.repeated_permutation(len){|o|        # repeated_permutation(len)はlenの数だけ重複順列を生成する
        (1..9).to_a.each{|i|
            expr = o.inject(i.to_s){|l, n| l + n + i.to_s}  # o.inject(初期値){|l(初期値),n(oの配列の要素)| l + n + i.to_s}
            if eval(expr) == 1234 then
                puts expr
                found =true
            end
        }    
    }
    len += 1
end

# 重複順列を生成する場合
@found2 = false
@op2 = ['+', '-', '*', '/', '']
def check(n, expr, num)
    if n == 0 then
        if eval(expr) == 1234 then
            puts expr
            @found2 = true
        end
    else
        @op2.each{|i|
            check(n - 1, "#{expr}#{i}#{num}", num)  # exprにつけるのは一つずつだから、lenだけ見るにはlenが0になるまで再帰的に探索すればいい
        }
    end
end

len = 1
while !@found2 do
    (1..9).to_a.each{|num|
        check(len, num, num)
    }
    len += 1
end