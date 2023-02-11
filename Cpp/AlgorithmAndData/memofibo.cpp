// メモ化をしてフィボナッチ数列を求める

# include <iostream>
# include <vector>
using namespace std;

vector<long long> memo;

long long fibo(int N){
    if (N == 0) return 0;
    else if (N == 1) return 1;
    // memoの中身をチェックする
    if (memo[N] != -1) return memo[N];

    // 計算結果をメモしておく
    return memo[N] = fibo(N-1) + fibo(N-2);
}

int main(){
    memo.assign(50, -1);   // memoの配列をサイズ50の‐1で初期化
    fibo(49);
    for (int N = 2; N < 50; N++){
        cout << N << " 項目: " << memo[N] << endl;
    }
}