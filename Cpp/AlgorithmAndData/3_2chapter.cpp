// ｎ個の整数のうち整数値ｖが何個含まれるかを判断する。速度はO(N)

# include <iostream>
# include <vector>
using namespace std;

int main(){
    int N, V;
    cin >> N >> V;
    vector<int> a(N);
    for (int i = 0; i < N; i++) cin >> a[i];

    int count = 0;
    for (int i = 0; i < N; i++){
        if (a[i] == V) count += 1;      // 0~(N-1)までのroopが一回だからO(N)
    }

    cout << count << endl;
}