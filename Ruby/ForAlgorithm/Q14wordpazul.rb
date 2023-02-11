#国名でしりとりをして、最も長く続けられた場合何回になるかを求める
@country = ["Brazil", "Croatia", "Mexico", "Cameroon", "Spain", "Netherlands", "Chile", "Australia", "Colombia", "Greece",
            "Cote d'lvoire", "Japan", "Uruguay", "Costa Rica", "England", "Italy", "Swizerlnad", "Ecuador", "France",
            "Honduras", "Argentina", "Bosnia and Herzegovina", "Iran", "Nigeria", "Germany", "Portugal", "Ghana", "USA",
            "Belgium", "Algeria", "Russia", "Korea Republic"]

@is_used = Array.new(@country.size, false)

def search(prev, depth)
    is_last = true
    # p prev
    @country.each_with_index{|c, i| #each_with_indexは値とインデックス番号を配列として取り出す [c, i]
        if c[0] == prev[-1].upcase then #rubyはString型でも[]を使える。String[数字]なっているときは文字数番号を表す。c[0]は文字列cの０番目の文字(最初の文字)１文字、prev[-1]は文字列prevの後ろから一番目(一番後ろの文字)の文字１文字
            if !@is_used[i] then
                is_last = false
                @is_used[i] = true
                search(c, depth + 1)
                @is_used[i] = false
            end
        end
    }
    @max_depth = [@max_depth, depth].max if is_last
end
@max_depth = 0
@country.each_with_index{|c, i|
        @is_used[i] = true
        search(c, i)
        @is_used[i] = false
        @max_depth -= (i-1) #max_depthには深さが入っているから、インデックスが２からだったら２からカウントするから、i-1をする
        # p c[0]
    }
    puts @max_depth

