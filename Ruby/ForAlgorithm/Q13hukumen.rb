#覆面算、数字を文字に置き換える。この時に一つの文字には一つの数字しか入らず、違う文字には違う数字が入っている
# 覆面算でread + write + talk = skill を計算した時にこの式が成り立つのは何通りか。その時の式も表示する
count = 0
(0..9).to_a.permutation do |r, e, a, d, w, i, t, l, k, s| #to_aで配列にする。permutationで順列を求める。.to_a.permutationは配列の順列を求めて順番にループする。.permutation.to_aは順列を配列にする
    next if r == 0 or w == 0 or t == 0 or s == 0 #nextは条件にあったら、次の繰り返し処理をする
    read = r * 1000 + e * 100 + a * 10  + d
    write = w * 10000 + r * 1000 + i * 100 + t * 10 + e
    talk = t * 1000 + a * 100 + l * 10 + k
    skill = s * 10000 + k * 1000 + i * 100 + l * 10 + l
    if read + write + talk == skill then
        count += 1
        puts "#{read} + #{write} + #{talk} = #{skill}"
    end
end

puts count