// N日間の休みがある。そのうちある日の幸福度が三種類ずつ与えられる。一日一つの幸福度を選ぶとすると最大値はいくらになるか。連続して同じ種類の幸福度が選べないとするとする
#include <iostream>
#include <vector>
using namespace std;
template<class T> void chmax(T& a, T b) {if (a < b) a = b;}
template<class T> void chmin(T& a, T b) {if (a > b) a = b;}

int main() {
    int N;      // 何日分か
    cin >> N;
    vector<vector<long long>> a(N, vector<long long>(3));
    // iは日付　jは幸福の種類
    for(int i = 0; i < N; i++) {
        for (int j = 0; j < 3; j++) {
            cin >> a[i][j];
        }
    }
    
    vector<vector<long long>> dp(N+1, vector<long long>(3, 0));     // dpは何日目の何から始めた場合の最大値を記録しておく。各日で3通りの始まり方があるので要素は3

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < 3; j++) {
            for (int k = 0; k < 3; k++) {
                if (j == k) continue;
                chmax(dp[i + 1][k], dp[i][j] + a[i][k]);
            }
        }
    }

    long long res = 0;
    for (int i = 0; i < N; i++) chmax(res, dp[N][i]);
    cout << res << endl;
}