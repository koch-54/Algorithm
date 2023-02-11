# n進数をグレイコードに変換して、その変換した数字を再びn進数とみてグレイコードに変換する。この操作を繰り返したとき最初のn進数の数字に戻るのに何回かかるか。
# n = 16のとき、808080から始めて808080に戻る回数とabcdefから始めてabcdefに戻るまでの回数を求める

# グレイコードはそれを求めたい2進数とその2進数を1ビット右にシフトして先頭に0をつけたものとの排他的論理和をとったもの
# n進数からグレイコードを求めるにあたってn進数の排他的論理和をとる必要がある。n進数の排他的論理和は2つの数の差をそれぞれnで割ったあまり(a - b) mod nで表される

N = 16
def graycode(value)
    # n進数を各桁の配列に分解する
    digits = []
    while value > 0 do
        digits << value % N     # 1の位から入っていく
        value /= N             # 桁数を減らしていく
    end

    # 各桁をグレイコードに変換する
    (digits.size - 1).times{|i|
        digits[i] = (digits[i] - digits[i + 1]) % N     # 前後の桁同士の排他的論理和(1ビット右にシフトするから)
    }

    # 配列を数値にする
    digits.each_with_index.map{|d, i|  d * (N**i)}.inject(:+)  # 小さい桁から入っていて、インデックス番号がちょうどNの指数になっている
end

def search(value)
    check = graycode(value)
    cnt = 1
    while check != value do     # 探索を続ける条件
        check = graycode(check)
        cnt += 1
    end
    cnt
end

puts search(0x808080)
puts search(0xabcdef)