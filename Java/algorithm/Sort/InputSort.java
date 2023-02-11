package algorithm.Sort;

import java.util.Scanner;

public class InputSort {	
	static void print(int[] a, int n) {
		for (int i = 0; i < n; i++) {
			if (i > 0)
				System.out.print(" ");
			System.out.print(a[i]);
		}
		System.out.println();
	}

	static void insertionSort(int[] a, int n) {
		for (int i = 1; i < n; i++) {
		    //xに配列の要素を入れる
		    int x = a[i];
		    // 一つ手前のインデックス番号をjにいれる
		    int j = i - 1;
		  //  後ろの要素数のほうが大きかった場合入れ替える
		    while(j >= 0 && a[j] > x){
		        a[j + 1] = a[j];
		        j--;
		    }
		    
		    a[j + 1] = x;

			print(a, n);
		}
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		int n = sc.nextInt();

		int[] a = new int[n];
		for (int i = 0; i < n; i++) {
			a[i] = sc.nextInt();
		}

		insertionSort(a, n);
	}
}
