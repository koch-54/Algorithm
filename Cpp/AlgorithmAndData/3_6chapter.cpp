// 2つの正の整数Ｋ，Ｎが与えられる。0 <= X,Y,Z <= K の整数のうち X + Y + Z = N を満たすものが何通りあるかを求める
// 速度はO(N^2)

# include <iostream>
# include <vector>
using namespace std;

int main(){
    int K, N;
    cin >> K >> N;

    for (int x = 0; x <= K; x++){
        for (int y = 0; y <= K; y++){
            int z = N - (x + y);
            if (z > K) continue;
            else{cout << x << "," << y << "," << z << "," << endl;}
        }
    }
}