#10進数、2進数、8進数で表したときすべてで回文になる10以上で最小の数字を見つける
num = 11;
while true do
    if  num.to_s == num.to_s.reverse &&
        num.to_s(2) == num.to_s(2).reverse && 
        num.to_s(8) == num.to_s(8).reverse then
        puts num;
        return;
    else
        num += 2;
    end
end