// 再帰関数とメモ化でforg問題を解く

#include <iostream>
#include <vector>
using namespace std;

template<class T> void chmin(T& a, T b){
    if (a > b){
        a = b;
    }
}

const long long INF = 1LL << 60;

int N;
vector<long long> h;
vector<long long> dp;

long long rec(int i){
    if (dp[i] < INF) return dp[i];      // すでに更新されていた場合その値を返す

    if (i == 0) return 0;       // iが0のとき初期値を返す

    long long res = INF;
    
    chmin(res, rec(i-1) + abs(h[i] - h[i-1]));

    if (i > 1) chmin(res, rec(i-2) + abs(h[i] - h[i-2]));

    return dp[i] = res;
}

int main(){
    cin >> N;
    h.resize(N);
    for (int i = 0; i < N; i++) cin >> h[i];

    dp.assign(N, INF);

    cout << rec(N-1) << endl;
}