// N個の整数が与えられる。このなかからいくつかとってきて和をとって1以上W以下になる整数はいくつあるかを求める
// ちょうどWになるものとの違いはW以下でjになるものすべてを選ぶという点。つまり、jになるか、W以下足していく点
#include <iostream>
#include <vector>
using namespace std;

int main() {
    int N, W;
    cin >> N >> W;
    vector<int> a(N);
    for (int i = 0; i < N; i++) cin >> a[i];

    vector<vector<bool>> dp(N+1, vector<bool>(W+1, false));
    dp[0][0] = true;

    // dpを作る
    for (int i = 0; i < N; i++) {
        for (int j = 0; j <= W; j++) {
            if (!dp[i][j]) continue;        // falseということはあるi個ではW以下にならないということ
            dp[i + 1][j] = true;    // 次の予約をする
            if (j + a[i] <= W) dp[i + 1][j + a[i]] = true;  // Wを超えない範囲で予約をする
        }
    }

    int count = 0;
    for (int j = 0; j <= W; j++) {
        if (dp[N][j]) count += 1;
    }
    cout << count << endl;
}