// N個の正の整数のうちいくつか選んで整数Wにすることができるかを判定するアルゴリズムを設計せよ

#include <iostream>
#include <vector>
using namespace std;

int main() {
    int N, W;
    cin >> N >> W;
    vector<int> a(N);
    for (int i = 0; i < N; i++) cin >> a[i];

    vector<vector<bool>> dp(N + 1, vector<bool>(W + 1, false));  // dp[選んだ個数][出来る和]
    dp[0][0] = true;        // 0個選んで来たら、和0を作るのに見てきた場所をtrueにする。この時最初の[0][0]だけになる

    for (int i = 0; i < N; i++) {
        for (int j = 0; j <= W; j++) {
            // a[i]から選んでこないとき
            if (dp[i][j]) dp[i + 1][j] = true;  // trueのとき次の予約をする

            // a[i]を選ぶとき
            if (j >= a[i] && dp[i][j - a[i]]) dp[i + 1][j] = true;      // jは作る和を順番に見ていったときの値が入っている。Wを超えちゃいけないから差分を使って予約する
        }
    }

    if (dp[N][W]) cout << "Yes" << endl;
    else cout << "No" << endl;
}   