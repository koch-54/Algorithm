# 運動会でn人n+1脚をすることになった。パワーバランスの都合上、女は隣り合ってはいけない。n=30のときの男女の並べ方は何通りあるか。
@boy, @girl = "B", "G"
N = 30

def add(seq)
    return 1 if seq.size == N #配列ではなく文字列の大きさ

    cnt = add(seq + @boy)
    cnt += add(seq + @girl) if seq[-1] == @boy
    return cnt
end

puts add(@boy) + add(@girl)