package algorithm.Sort;

import java.util.Scanner;

public class BubbleSort {
	static void print(int[] a, int n) {
		for (int i = 0; i < n; i++) {
			if (i > 0)
				System.out.print(" ");
			System.out.print(a[i]);
		}
		System.out.println();
	}

	static void bubbleSort(int[] a, int n) {
		for (int i = 0; i < n - 1; i++) {
		    for(int j = n - 1; j  > i; j--){
		        if(a[j-1] > a[j]){
		            int cp = a[j];
		            a[j] = a[j-1];
		            a[j-1] = cp;
		        }
		    }
		    
			
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

		bubbleSort(a, n);
	}
}
