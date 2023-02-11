// 再帰関数を使って部分和問題を解く
// N個の整数が与えられ、そのなかから和Wを作れるかを判定する。

# include <iostream>
# include <vector>
using namespace std;

bool func(int i, int w, const vector<int> &a){
    if (i == 0){
        if (w == 0) return true;
        else return false;
    }
    if (func(i-1, w, a)) return true;  // aからインデックスi-1を選ばない場合

    if (func(i-1,  w - a[i-1], a)) return true; // aからインデックスi-1を選ぶ場合

    // どこかがfalseで条件を満たさない場合はfalseを返す
    return false;
}

int main(){
    int N, W;
    cin >> N >> W;
    vector<int> a(N);
    for (int i = 0; i < N; i++) cin >> a[i];

    if (func(N, W, a)) cout << "Yes" << endl;
    else cout << "No" << endl;
}