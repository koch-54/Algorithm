// トリボナッチ数列を求める。0, 0, 1, 1, 2, 4, ・・・のように前三項を足したものが次の項値になる

# include <iostream>
# include <vector>
using namespace std;

vector<long long> memo;

long long tribo(int N){
    if (N == 0 || N == 1) return 0;
    else if (N == 2) return 1;

    if (memo[N] != -1) return memo[N];

    return memo[N] = tribo(N-1) + tribo(N-2) + tribo(N-3);
}

int main() {
    int N;
    cin >> N;

    memo.assign(N, -1);
    tribo(N-1);
    for (int i = 0; i < N; i++){
        cout << memo[i] << endl;
    }
}