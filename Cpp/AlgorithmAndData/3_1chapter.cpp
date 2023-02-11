// ｎ個の整数から整数値ｖとなるものを探したときにその時のindexを返す。複数個ある場合はその最大値を返す

# include <iostream>
# include <vector>
using namespace std;

int main(){
    int N, V;
    cin >> N >> V;
    vector<int> a(N);
    for(int i = 0; i < N; i++) cin >> a[i];

    int found_id = -1;
    for(int i = 0; i < N; i++){
        if (a[i] == V) found_id = i;
    }
    cout << found_id << endl;
}