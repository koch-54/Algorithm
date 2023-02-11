# include <iostream>
# include <vector>
using namespace std;
const int INF = 1000000;

int main(){
    int N;
    cin >> N;
    vector<int> array(N);
    for (int i = 0; i < N; i++){
        cin >> array[i];
    }

    int min_value = INF;
    for(int i = 0; i < N; i++){
        if(array[i] < min_value){
            min_value = array[i];
        }
    }

    cout << min_value << endl;
}
