// particalsum2のメモ化して解く

# include <iostream>
# include <vector>
using namespace std;

vector<vector<int>> memo;

int func(int n, int w, vector<int> &a){
    // basecace
    if (n == 0){
        if (w == 0) return true;
        else return false;
    } 

    if (memo[n][w] != -1) return memo[n][w];
    // indexがn-1を選んだ時
    if (func(n-1, w - a[n-1], a)) return memo[n][w] = 1;
    //　選ばないとき
    if(func(n-1, w, a)) return memo[n][w] = 1;

    return memo[n][w] = 0;
}

int main(){
    int N, W;
    cin >> N >> W;
    vector<int> a(N);
    for(int i = 0; i < N; i++) cin >> a[i];

    memo.assign(N + 1, vector<int>(W + 1 , -1));
    if (func(N, W, a)) cout << "Yes" << endl;
    else cout << "No" << endl;
}
