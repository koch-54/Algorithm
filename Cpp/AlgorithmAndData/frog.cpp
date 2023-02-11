// frog問題を動的計画法で解く
// frog問題とはN本の長さが違う丸太があり、かえるは隣の丸太か、一個飛ばした場所の丸太に移動できる。このとき今いる場所と移った場所の丸太の長さの差をコストとする。
//　このときかえるがn-1本まで跳んだときのコストの総和が最小になるときの値を求める。

// コストは丸太の長さを配列に入れて、それから選んだ差分で求める。k番目の丸太への行き方はそれぞれに通りあるのでその最小値を記録していく

# include <iostream>
# include <vector>
using namespace std;

const long long INF = 1LL << 60;   // LLはlong longの略で型は同じにする必要がある。2^60

int main(){
    int N;
    cin >> N;
    vector<long long> h(N);
    for (int i = 0; i < N; i++) cin >> h[i];        // かえるが跳ぶ丸太

    vector<long long> dp(N, INF);
    dp[0] = 0;

    for (int i = 0; i < N; i++){
        if (i == 1){
            dp[i] = h[i];
        } else {
            dp[i] = min(dp[i-1] + abs(h[i] - h[i-1]), dp[i-2] + abs(h[i] - h[i-2]));
        }
    }

    cout << dp[N-1] << endl;
}