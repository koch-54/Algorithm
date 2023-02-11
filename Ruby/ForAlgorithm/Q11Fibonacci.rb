# n番目のフィボナッチ数を求めろ

#n番目のフィボナッチ数
def fib(n)
    if (n == 0 || n == 1) then
        return 1
    else
        return fib(n - 2) + fib(n - 1)
    end
end

# (1..50).each{|i|
    # puts fib(i)
# }

#再帰関数を使わない方法　各桁の数の和とその項の数が割り切れる数を選ぶ
a = b = 1
count = 0
while(count < 11) do
    c = a + b
    sum = 0
    c.to_s.split(//).each {|e| #.split(//)一文字ずつ切り分けるの意味
        sum += e.to_i
    }
    if (c % sum == 0) then #割り切りれたら出力
        puts c
        count += 1
    end
    a, b = b, c
end


