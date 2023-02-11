package algorithm.Sort;

import java.util.Scanner;

public class QuickSort {
	static int count = 0;

    static void quickSort(int[] a, int left, int right) {
        // もし left が right-1 以上なら終了
        if(left >= right - 1){
            return;
        }
        
        int pivot = a[right - 1]; //pivotには一番右を選ぶ

        // curIndex を left で初期化
        int curIndex = left;
        for (int i = left; i < right - 1; i++) {
            // もし a[i] が pivot より小さいなら
            if (a[i] < pivot) {
                // a[curIndex] と a[i] を交換
                int cp = a[curIndex];
                a[curIndex] = a[i];
                a[i] = cp;
                // curIndex を 1 だけ増やす
                curIndex++;
                count++;
            }
        }

        // ピボットと a[curIndex] を交換
        a[right - 1] = a[curIndex]; //curIndexの場所は一番先頭に置く
        a[curIndex] = pivot; //１個下にpivotの値を置く

        // quickSort(a, left, curIndex) を呼び出す
        quickSort(a, left, curIndex);
        // quickSort(a, curIndex+1, right) を呼び出す
        quickSort(a, curIndex + 1, right);
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt();

        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }

        quickSort(a, 0, n);

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
