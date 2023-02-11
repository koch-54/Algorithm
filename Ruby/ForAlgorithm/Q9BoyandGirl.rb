#男女がそれぞれランダムに入場してくる場合を考える。その時にどこで区切っても男女の人数が同じにならないような場合は何通りか
boy, girl = 20, 10
boy, girl = boy + 1, girl + 1  # インデックスの値を人数にそろえるためにそれぞれに1を足しておく
ary = Array.new(boy * girl, 0) #考え方は横軸が男、縦軸が女の二次元で考えるが作る配列は一次元
# p ary
ary[0] = 1
girl.times{|g|
    boy.times{|b|
        if (b != g) && (boy - b != girl - g) then # 部屋に入った場合と残った場合の男女の人数が同じくなってはいけない
            ary[b + boy * g] += ary[b - 1 + boy * g] if b > 0 # 男が入った場合
            ary[b + boy * g] += ary[b + boy * (g - 1)] if g > 0  # 女が入った場合
            # puts "g:#{g}b:#{b}"
            # p ary
        end
        }
    }
# p ary
puts ary[-2] + ary[-boy - 1]
    