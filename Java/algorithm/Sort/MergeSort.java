package algorithm.Sort;

import java.util.Scanner;

public class MergeSort {
	static final int INF = 1000000001; //番兵
    static int count = 0;

    static void merge(int[] a, int left, int mid, int right) {
        int nl = mid - left;
        int nr = right - mid;

        int[] l = new int[nl + 1];
        int[] r = new int[nr + 1];
        // それぞれの部分を新しい配列 l, r にコピー
        for (int i = 0; i < nl; i++) {
            l[i] = a[left + i];
        }
        for (int i = 0; i < nr; i++) {
            r[i] = a[mid + i];
        }
        // 番兵を追加
        l[nl] = INF;
        r[nr] = INF;
        // lIndex, rIndex を 0 に初期化
        int lIndex = 0;
        int rIndex = 0;
        for (int i = left; i < right; i++) {
            // l と r の先頭要素のうち l の先頭要素が小さいなら
            if (l[lIndex] < r[rIndex]) {
                // l の先頭要素を元の配列に格納
                a[i] = l[lIndex];
                // l の先頭を 1 つ進める
                lIndex++;
            } else {
                // r の先頭要素を元の配列に格納
                a[i] = r[rIndex];
                // r の先頭を 1 つ進める
                rIndex++;
                count++;
            }
        }
    }

    static void mergeSort(int[] a, int left, int right) {
        // もし、left が right-1 以上なら終了
        if(left >= right-1){
            return;
        }
        // mid に (left+right)/2 を代入
        int mid = (left + right) / 2;
        // mergeSort(a, left, mid) と mergeSort(a, mid, right) を呼び出す
        mergeSort(a, left, mid);
        mergeSort(a, mid, right);
        // merge(a, left, mid, right) を呼び出す
        merge(a, left, mid, right);
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt();

        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }

        mergeSort(a, 0, n);

        for (int i = 0; i < n; i++) {
            if (i > 0) {
                System.out.print(" ");
            }
            System.out.print(a[i]);
        }
        System.out.println();

        System.out.println(count);
    }
}
