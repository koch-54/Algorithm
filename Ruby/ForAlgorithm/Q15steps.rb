#Aさんが下からBさんが上から階段を上る（下りる）時、同じ階段に止まるのはなん通りか。stepは一度に上り（降り)できる数
N= 10       #階段の数0から10段
step = 4    #一度に移動できる階段の最大数

def move(a, b, step)
    return 0 if a > b
    return 1 if a == b
    cnt = 0
    (1..step).each{|da|
        (1..step).each{|db|
            cnt += move(a + da, b - db, step)
            }
        }
    cnt
end

puts move(0, N, step)
