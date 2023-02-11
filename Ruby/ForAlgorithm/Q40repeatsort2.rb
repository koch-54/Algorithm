# Q40repeatsortと同じ問題の別解
# permutationを使わない方法

N = 9
@max = 0
@same_max = Hash.new

def solve(cards, init, depth)
    if cards[0] == 1 then
        if @max < depth then
            @max = depth
            @same_max.clear
        end
        @same_max[init] = cards if @max == depth
    else
        solve(cards[0..cards[0] - 1].reverse + cards[cards[0]..N], init, depth + 1)
    end
end

def pattern(used, unused, index)
    if unused.empty? then
        solve(used, used, 0)
    else
        unused.select{|i| index + 1 != i}.each{|i|
            pattern(used + [i], unused - [i], index + 1)
        }
    end
end

pattern([], (1..N).to_a, 0)
puts @max
puts @same_max

