# Q55sorobanの問題の別解    メモ化をすることで高速にする

N = 10
# 元の数(ビット列)に加算した場合に移動する量を返す
def move(bit, add)
    base = 0
    N.times{|i|
        base += i + 1 if (bit & (1 << i)) > 0       # baseにはすでに足し終えた数字が入っているからbitとのビット積をとって0より大きくなればすでに足しているというのでbaseにiを足す
    }

    # 10の位の5の玉の位置を確認
    a0, remainder0 = (base + add).divmod(50)
    b0, base_remainder0 = base.divmod(50)

    # 10の位の1の玉を確認
    a1, remainder1 = remainder0.divmod(10)
    b1, base_remainder1 = base_remainder0.divmod(10)

    # 1の位の玉の位置を確認
    a2, remainder2 = remainder1.divmod(5)
    b2, base_remainder2 = base_remainder1.divmod(5)

    (a0 - b0).abs + (a1 - b1).abs + (a2 - b2).abs + (remainder2 - base_remainder2).abs
end

@memo = Hash.new(0)
@memo[(1 << N) - 1] = 0

# 10まで足したときの動かした玉の数が最小になる時を求める
def search(bit)
    return @memo[bit] if @memo.has_key?(bit)
    min = 100000
    N.times{|i|
        if bit & (1 << i) == 0 then             # ビット積が0になるということはまだその数字を足してないということ
            min = [min, move(bit, i + 1) + search(bit | (1 << i))].min
        end
    }
    @memo[bit] = min
end

puts search(0)