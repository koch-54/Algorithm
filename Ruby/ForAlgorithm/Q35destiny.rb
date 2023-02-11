# N*Nの正方形の形をした道を考えたとき、(0, 0)から男性が(N, N)から女性が道を歩き、それぞれが入れ替わるようにする。このとき、男性と女性がすべての通りで道を歩くとき何回運命の出会いをするのかを考える。
# 運命の出会いの条件は、男性と女性がx, yどちらかの座標が2回同じになったときか、ばったり重なったときである。このときにその道順でい通りとなる 

N = 6
@cnt = 0
def search(man_x, man_y, woman_x, woman_y, meet)
    if (man_x <= N) && (man_y <= N) && (woman_x >= 0) && (woman_y >= 0) then
        @cnt += 1 if (man_x == N) && (man_y == N) && (meet >= 2)
        meet += 1 if (man_x == woman_x)
        meet += 1 if (man_y == woman_y)
        search(man_x + 1, man_y, woman_x - 1, woman_y, meet)
        search(man_x, man_y + 1, woman_x - 1, woman_y, meet)
        search(man_x + 1, man_y, woman_x, woman_y - 1, meet)
        search(man_x, man_y + 1, woman_x, woman_y - 1, meet)
    end
end

search(0, 0, N, N, 0)
puts @cnt