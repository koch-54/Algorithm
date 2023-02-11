// ナップサック問題
// 商品の重さweightと価値valueがそれぞれＮ個与えられる。このとき重さWを超えないように作ることができる価値の最大値を求める

#include <iostream>
#include <vector>
using namespace std;

template<class T> void chmax(T& a, T b){
    if (a < b){
        a = b;
    }
}

int main(){
    int N; long long W;
    cin >> N >> W;
    vector<long long> weight(N), value(N);
    for (int i = 0; i < N; i++) cin >> weight[i] >> value[i];

    vector<vector<long long>> dp(N + 1, vector<long long>(W + 1, 0));     // 選んだ個数を順番にみて、それに合わせてWに近いものを調べるために、こう2次元配列を定義する

    for (int i = 0; i < N; i++){
        for(int w = 0; w <= W; w++){
            // i番目の品物を選ぶ場合
            if (w - weight[i] >= 0){
                chmax(dp[i + 1][w], dp[i][w - weight[i]] + value[i]);
            }
            // i番目の品物を選ばないとき
            chmax(dp[i + 1][w], dp[i][w]);
        }
    }

    cout << dp[N][W] << endl;
}