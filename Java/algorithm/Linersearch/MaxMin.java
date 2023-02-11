package algorithm.Linersearch;
import java.util.Scanner;

public class MaxMin {
	public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
    
        int n = sc.nextInt();
        int[] a = new int[n];
        for(int i=0; i<n; i++){
            a[i] = sc.nextInt();
        }
        
        int maximum = -1000000000;
        int minimum = 1000000000;
        
        for(int value : a){
            maximum = Math.max(maximum, value); //Math.max(), Math.min()は()内の値のうち大きいほう、小さいほうを選ぶ
            minimum = Math.min(minimum, value);
        }
        
        System.out.println(maximum + " " + minimum);
    }
}


