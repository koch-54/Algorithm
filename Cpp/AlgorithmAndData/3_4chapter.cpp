// ｎ個の整数が与えられる。この中から二つ選んで差をとる。このときその差の最大値を求める。速度はO(N)
# include <iostream>
# include <vector>
using namespace std;

int main(){
    int N;
    cin >> N;
    vector<int> a(N);
    for (int i = 0; i < N; i++) cin >> a[i];

    // 差の最大値は最大の数から最小の数を引いたときである
    int max_value = -1;
    int min_value = 1000000;
    for (int i = 0; i < N; i++){
        if (a[i] > max_value) max_value = a[i];
        if(a[i] < min_value) min_value = a[i];
    }

    int result = max_value - min_value;
    cout << result << endl;
}