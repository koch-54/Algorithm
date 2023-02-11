package algorithm.Sort;

import java.util.Scanner;

public class SelectSort {	
	static void print(int[] a, int n) {
		for (int i = 0; i < n; i++) {
			if (i > 0)
				System.out.print(" ");
			System.out.print(a[i]);
		}
		System.out.println();
	}

	static void selectionSort(int[] a, int n) {
		for (int i = 0; i < n - 1; i++) {
			int Index_minNumber = i;
			
			for (int j = i + 1; j < n; j++){
			    if(a[j] < a[Index_minNumber]){
			    	Index_minNumber = j;
			    }
			}
			
			int min = a[Index_minNumber];
			a[Index_minNumber] = a[i];
			a[i] = min;
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

		selectionSort(a, n);
	}
}
