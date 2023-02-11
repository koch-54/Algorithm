# 任意の正の整数nについて、nの倍数のうち0,7だけで構成される数字のうち最小のものを求めその数字が回文数になるものが何通りあるかを調べる
# n : 1~50
# 0と7だけで構成される数字だから、二進数を7倍して、その数字からnと割り切れるものを探す
n = (1..50).select{|i| (i % 2 > 0 || (i % 5 > 0))} # 2の倍数、5の倍数は、一の位が2,5になるので除外
answer = Array.new
k = 1
while(n.size > 0) do
    x = k.to_s(2).to_i * 7
    if x.to_s.include?('0') then
        n.each{|i|
            if x % i == 0 then
                answer << i if x.to_s == x.to_s.reverse # 配列に代入
                n.delete(i)  # 倍数の最小値から選ぶので、この条件を満たした段階でdeleteする
            end
        }
    end
    k += 1
end
puts answer.sort