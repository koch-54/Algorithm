# 最初に10枚のコインがあって24回ゲームを行う。ゲームに勝ったらコインが+1負けるとコインが-1になる。このときゲームが終わってもコインがあるのは何通りか
@memo = {} # 連想配列の時は{}<-これ

def game(coin, depth)
    return @memo[[coin, depth]] if @memo.has_key?([coin, depth]) # すでにその時のkeyがあったら処理せず、値を返す。基本ない

    return 0 if coin == 0  # coinが0になった時点で終了
    return 1 if depth == 0 # depthが0、すべてゲームをすればカウント1

    # 勝ったとき負けたときで条件分岐をせず、二つのパターンを同時に再帰的に計算する
    win = game(coin + 1, depth - 1)
    lose = game(coin - 1, depth - 1)

    @memo[[coin, depth]] = win + lose # [coin, depth]がkey
end

puts game(10, 24)