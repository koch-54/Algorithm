#1~Nまでの合成数から7個の数を選んだ時、友達を最大で６段階たどって選んだすべての合成数を選べるようになる最小のNを求める。選んだ合成数は同じ約数を持っているときに友達とみなされる
#7個の合成数のうち、6回たどるので、約数を持つペアは二人で一つだから、a*b, b*c, c*d, d*e, e*f, f*g, g*hとそれぞれ積で表せる。このとき、a~hは互いに素になる
#たどる回数は同じ文字が懸け橋になっているところなのでこの時6回になる。
#このときに最初と最後を二乗にしてコンパクトにしてa*a, a*b, b*c, c*d, d*e, e*f, f*f 考える
#隣り合っているものどうしをかければいいので、素数 a, b, c, d, e, f の6つの順列を考えればよい
require 'prime'

primes = Prime.take(6) #primeは素数全体。take(n)はn個だけ値をとって配列にする
min = primes[-1] * primes[-1] #最大の平方をもとめる 暫定f*f
min_friend = []

primes.permutation{|prime| #6個の素数の順列を作る
    friends = prime.each_cons(2).map{|x, y| x * y} #cons(n)n個のペアをリストの左から順番にみる
    friends += [prime[0], prime[-1]].map{|x| x * x} # a*a, f*f
    if min > friends.max then
        min = friends.max #暫定最小値を今の配列の最大値に更新する
        min_friend = friends
    end
}

puts min #求める最小のN　f*f
p min_friend #その時の素数の積の組->合成数