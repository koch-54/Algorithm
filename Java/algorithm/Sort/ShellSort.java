//shellsortは間隔hをあけて、挿入ソートする。hは数を小さくしていく

/*入力値
10
7 6 10 2 5 4 8 3 9 1
2
4 1
*/
package algorithm.Sort;

import java.util.Scanner;

public class ShellSort {
	static void insertionSort(int[] a, int n, int h) {
        int numOfMove = 0; //動かした回数をカウントするためのもの
        // i が h から n - 1 までのループを書く
        for (int i = h; i < n; i++) {
            // A_i を x に保存する
                int x = a[i];
            // 変数 j を用意する
                int j = i - h;
            // j が 0 以上で、A_j が x より大きい間
            while (j >= 0 && a[j] > x) {
                // A_j を h だけ右にずらす
                a[j + h] = a[j];
                // j を h だけ減らす
                j -= h;
                numOfMove++;
            }

            // A_{j + h} に x を代入する
            a[j + h] = x;
        }

        System.out.println(numOfMove);
    }

    static void shellSort(int[] a, int n, int[] h, int k) {
    for (int i = 0; i < k; i++) {
        // 間隔 h の挿入ソートを呼び出す
        insertionSort(a, n, h[i]);
    }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt();

        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }

        int k = sc.nextInt();

        int[] h = new int[k];
        for (int i = 0; i < k; i++) {
            h[i] = sc.nextInt();
        }

        shellSort(a, n, h, k);
    }

}
