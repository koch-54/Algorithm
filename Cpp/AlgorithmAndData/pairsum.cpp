// 2つのN個の数列が与えられ。この二つの数列から一つずつとってきて足すとき値がＫ以上になるものの中で最小のものを求める
// N = 3, K = 10, a = (8,5,4), b = (4,1,9) 3 10 8 5 4 4 1 9
# include <iostream>
# include <vector>
using namespace std;
const int INF = 100000;

int main(){
    // 必要な入力値と入力値から配列を定義
    int N, K;
    cin >> N >> K;
    vector<int> a(N), b(N);
    for(int i = 0; i < N; i++) cin >> a[i];
    for(int i = 0; i < N; i++) cin >> b[i];

    // 線形探索をする
    int min_value = INF;
    for(int i = 0; i < N; i++){
        for(int j = 0; j < N; j++){
            if (a[i] + b[j] < K) continue;

            if (a[i] + b[j] < min_value) min_value = a[i] + b[j];
        }
    }
    cout << min_value << endl;
}