// ｎ個の整数が与えられる。ｎ個の整数がすべて偶数ならば2で割った値に置き換えることを操作が行えなくなるまでするとき何回の操作が必要か。

# include <iostream>
# include <vector>
using namespace std;

int times(int N){
    int exp = 0;
    while(N % 2 == 0) N /= 2, exp++;
    return exp;
}

int main(){
    int N;
    cin >> N;
    vector<int> a(N);
    for(int i = 0; i < N; i++) cin >> a[i];

    int min_times = 10000;
    for(int i = 0; i < N; i++){
        if(times(a[i]) < min_times){
            min_times = times(a[i]);
        }
    }
    cout << min_times << endl;

}