// リストと数字が１つずつ与えられるので、リストの中にいくつその数字があるかを数える
package algorithm.Linersearch;

import java.util.Scanner;


public class Linersearch1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        int n = sc.nextInt();
        int[] a = new int[n];
        for (int i=0; i<n; i++){
            a[i] = sc.nextInt();
        }
        int k = sc.nextInt();
        
        int numofK = 0;
        
        for(int value : a){
            if(value == k){
                numofK++;
            }
        }
    System.out.println(numofK);
    }
}
