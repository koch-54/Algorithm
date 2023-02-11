// 1以上9以下の数値だけでできる長さがNの文字列が与えられる。その文字列の任意の場所に+を入れてできる和の全パターンを求めその総和を求める。＋を入れない場合も入れる

# include <iostream>
# include <string>
using namespace std;

int main(){
    string S;
    cin >> S;
    int N = S.size();

    long long res = 0;          // long long型はint型の拡張 -> 64bitを扱える    
    for (int bit = 0; bit < (1 << (N - 1)); bit++){     
        long long tmp = 0;
        for (int i = 0; i < N-1; i++){
            tmp *= 10;
            tmp += S[i] - '0';      // 現在の桁を数値にする

            if (bit & (1<<i)) {
                res += tmp;
                tmp = 0;
            }
        }
    tmp *= 10;
    tmp += S.back() - '0';
    res += tmp;
    }
    cout << res << endl;

    
}