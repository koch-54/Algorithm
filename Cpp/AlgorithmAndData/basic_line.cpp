// 基本的な線形探索の問題
// N個の整数と整数値ｖが与えられる。ｖと等しくなるものを探せ

#include <iostream>       // 標準入力、標準出力に関するライブラリ
#include <vector>         // 可変長のリストを扱える
using namespace std;      // 名前空間　標準でstd この場合すべて同じ空間　名前空間{}で区切られた場所は同じ関数名でも別に扱われる。名前空間内から呼び出すには A(定義した名前)::f()

int main() {
    int N, v;
    cin >> N >> v;
    vector<int> array(N);
    for (int i = 0; i < N; i++) cin >> array[i];

    bool exist = false;     // あった場合の合図
    for (int i = 0; i < N; i++) {
        if (array[i] == v){
            exist = true;
        }
    }

    if (exist) cout << "Yes" << endl;
    else cout << "No" << endl;
}