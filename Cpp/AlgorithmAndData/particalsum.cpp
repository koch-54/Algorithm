// ｎ個の正の整数と正の整数ｗが与えられるので、数列からいくつか足して総和をｗとできるかを判定する
// 部分和問題に対するビットを用いて全数探索する
# include <iostream>
# include <vector>
using namespace std;

int main(){
    int N, W;
    cin >> N >> W;
    vector<int> a(N);
    for(int i = 0; i < N; i++) cin >> a[i];

    // bit演算を使って全数探索
    bool exist = false;
    for(int bit = 0; bit < (1 << N); bit++){ // 配列をbitで表す。[] = 0000, [a] = 0001, [b] = 0010, [a, b] = 0011, [c] = 0100, [a, b, c] = 0111
        int sum = 0;
        for(int i = 0; i < N; i++){     // bitには配列の全パターンが表現される。
            if (bit & (1 << i)){        // iとビット積をとることでどこの桁に値があるかを調べる -> 選んできたインデックス番号
                sum += a[i];
            }
        }

        if (sum == W){
         exist = true;
         break;
         }
    }
    if (exist) cout << "Yes" << endl;
    else cout << "No" << endl;
}