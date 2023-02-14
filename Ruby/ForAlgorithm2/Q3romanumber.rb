# 1 I, 5 V, 10 X, 50 L, 100 C, 500 D, 1000 M という通りに数字を文字に置き換えてこの組み合わせで数字を作る
# 12個並べたときローマ数字として認識できる数が何通りあるかを求める
# 大きい数の後ろに小さ数を置いたときは足し算、逆のときは引き算をする。XI = 11, IX = 9とする。同じ記号を4つ以上連続で並べてはいけない。このときにローマ数字として認識する

# このときに表される最大値は3999である
# 条件から差分が必要になる数字は4, 9である

N = 12

# 変換するための関数を定義
def conv(n, i, v, x)        # 各位の一桁をすべて表現するのにn(位の数),i(位の尻を数えるもの),v(4を表現するのに使う5の数),x(9を表現するのに使う10の数)
    result = ''
    if n == 9 then
        result += i + x
    elsif n == 4 then
        result += i + v
    else
        result += v * (n / 5)
        result += i * (n % 5)
    end
    result
end

def roman(n)
    m, n = n.divmod(1000)
    c, n = n.divmod(100)
    x, n = n.divmod(10)
    result = 'M' * m
    result += conv(c, 'C', 'D', 'M')
    result += conv(x, 'X', 'L', 'C')
    result += conv(n, 'I', 'V', 'X')        # 最後の余りは1の位
    result
end

cnt = Hash.new(0)
1.upto(3999){|n|
    cnt[roman(n).size] += 1
}
puts cnt[N]
