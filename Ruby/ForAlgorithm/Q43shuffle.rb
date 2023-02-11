# 2n枚のカードがあり、そこからn枚を塊として取り出してもう一方のn枚のカードの上に乗せるときカードの並び順が最初の状態の逆になるには何回かかるかを調べる
# n = 5の時,必要な最小回数を求める

n = 5

cards = [(1..n*2).to_a]
answer = (1..n*2).to_a.reverse

depth = 1
while true do
    cards = cards.each_with_object([]) do |c, result|       # cはcardsの配列または値を見立てたもの。resultは処理の結果を入れるためのeach_with_object([])の()で定義した配列
        1.upto(n){|i| result << c[i, n] + c[0, i] + c[i + n..-1]}  # c[a, b]は配列c(cards)のインデックスaからb個。
    end
    break if cards.include?(answer)
    depth += 1
end

puts depth