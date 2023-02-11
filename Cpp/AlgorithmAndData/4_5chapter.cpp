// 十進法表記で値が、各桁の値が7,5,3のいずれかでありかつ、7,5,3がいずれも一度以上は登場する正の整数のうち、N以下の正の整数はいくつあるか
# include <iostream>
using namespace std;

// Nは入力される数字
// currentは現在の数字
// checkは7,5,3が出てきたかを二進数で判定する

void func(long long N, long long current, int check, long long &counter){
    // basecase
    if (current > N) return;
    if (check == 0b111) counter += 1;

    // 7を増やす場合
    func(N, current * 10 + 7, check | 0b001, counter);      // ビット和は各桁ずつ比較したときに1があると1を返す。このとき7を追加すると下1桁が1になる

    // 5を増やす
    func(N, current * 10 + 5, check | 0b010, counter);

    // 3を増やす
    func(N, current * 10 + 3, check | 0b100, counter);
}

int main(){
    int N;
    cin >> N;
    long long counter = 0;
    func(N, 0, 0, counter);
    cout << counter << endl;

}