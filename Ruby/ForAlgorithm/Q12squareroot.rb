#平方根を少数で表したときに、０～９の数字を先に使った数字はどれかを調べる
#整数部分を含むとき
i = 1
while i += 1
    str = ('%10.10f'%Math.sqrt(i)).sub('.', '')[0..9] #%10.10fは10この数字を取り出して、小数点以下を10桁にする。subは置き換えこの場合は小数点をなくしている。[0..9]は頭0からの文字数。文字列だから単位は文字数
    # p str
    break if str.split('').uniq.length == 10    #uniqは重複をなくす。重複をなくして最大桁数なら0~9のすべての数字を使っている    
end
puts i
#小数部分だけのとき
i = 1
while i += 1
    str = ('%10.10f'%Math.sqrt(i)).split('.')[1] #[1]は配列の[整数部分, 小数部分]のうち小数部分だけを選んでくるの意味。配列が対象だから、単位が配列になっている
    break if str.split('').uniq.length == 10
end
puts  i

