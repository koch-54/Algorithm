#お金を入れたときの両替を想定する。入れたお札に対して小銭に両替した時、出てくる小銭の組み合わせはなん通りか。枚数限度は15枚
#1000円札を入れた時を考える

@cnt = 0 #インスタンス変数：関数をまたいでつかえる
def change(target, coins, usable)
    coin = coins.shift
    if coins.size == 0 then
        @cnt += 1 if target / coin <= usable
    else
        (0..target/coin).each{|i|
            change(target-coin*i, coins.clone, usable-i)
        }
    end
end

change(1000, [500, 100, 50, 10], 15)
puts @cnt