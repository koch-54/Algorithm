// 動的計画法　編集距離 
// 2つの文字列S,Tが与えられる。Sを以下の方法を繰り返して文字列Tにする。その時の操作の最小回数を求める
// 方法
// 1: S中の文字を一つ選んで任意の文字に変更する
// 2: S中の文字を一つ選んで削除する
// 3: Sの好きな箇所に好きな文字を1文字挿入する

#include <iostream>
#include <vector>
#include <string>
using namespace std;

template<class T> void chmin(T&a, T b){
    if (a > b){
        a = b;
    }
}

const int INF = 1 << 29;        // 非常に大きい値で初期値を定義

int main(){
    string S, T;
    cin >> S >> T;

    // DPテーブル(結果の遷移をいれる)を定義
    vector<vector<int>> dp(S.size() + 1, vector<int>(T.size() + 1, INF));

    dp[0][0] = 0;

    for(int i = 0; i <= S.size(); i++){
        for(int j = 0; j <= T.size(); j++){
            // 1の操作 変更
            if (i > 0 && j > 0){
                // 前のやつが同じ場合変更しないから、値を変えずに入れる
                if (S[i-1] == T[i-1]){
                    chmin(dp[i][j], dp[i-1][j-1]);
                }
                // 前のやつが違うとき変更を加えるので操作回数が1増える
                else{
                    chmin(dp[i][j], dp[i-1][j-1] + 1);
                }
            }

            // 2の操作　削除　SにあってTにないものを消すのでSだけを見て行く。この時に操作が1増える
            if (i > 0) chmin(dp[i][j], dp[i-1][j] + 1);

            // 3の操作　挿入　TにあってSにないものをSに挿入するということは、これは削除の時の逆バージョンであるので、Tだけを見て行って違うものを消す。
            if (j > 0) chmin(dp[i][j], dp[i][j-1] + 1);
        }
    }
     cout << dp[S.size()][T.size()] << endl;       
}