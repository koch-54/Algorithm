#長さがnの棒があり、m人でそれぞれ半分ずつ切る。一人1本しか切ることしかできず、長さが1の棒になった時の切った最小回数を求める
#再帰的にとく
def cutbar(m, n, current)
    if current >= n
        0
    elsif current <= m
        1 + cutbar(m, n, current*2)
    else 
        1 + cutbar(m, n, current + m)        
    end
end

puts cutbar(3, 20, 1)
puts cutbar(5, 100, 1)