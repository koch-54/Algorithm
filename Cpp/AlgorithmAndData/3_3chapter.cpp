// ｎ個の相異なる整数値が与えられる。このうち2番目に小さい値を求める。速度はO(N)

# include <iostream>
# include <vector>
using namespace std;

int main(){
    int N;
    cin >> N;
    vector<int> a(N);
    for (int i = 0; i < N; i++) cin >> a[i];

    int min_value = 10000;
    for (int i = 0; i < N; i++){
        if (a[i] < min_value) min_value = a[i];
    }

    int min_ans = 1000000;
    int found_id = -1;
    for (int i = 0; i < N; i++){
        if (a[i] - min_value == 0) continue;     //差分を求めたとき最小で０になるのでそれを除外しとく
        if (a[i] - min_value < min_ans){        // 2番目に小さい数字ということは最小の数字との差分をしたとき最小になる
            min_ans = a[i] - min_value;
            found_id = i;
        } 
    }
    cout << a[found_id] << endl;        // 全体でO(2N)なので結果はO(N)
}