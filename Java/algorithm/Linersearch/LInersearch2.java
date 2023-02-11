// 指定さ入れた値の位置を調べる
package algorithm.Linersearch;

import java.util.Scanner;

public class LInersearch2 {
	 public static void main(String[] args) {
	        Scanner sc = new Scanner(System.in);
	        
	        int n = sc.nextInt();
	        int[] a = new int[n];    
	        
	        for(int i=0; i<n; i++){
	            a[i] = sc.nextInt();
	            
	        }
	        int k =sc.nextInt();
	        
	        int indexofK = 0;
	        
	        for(int i=0; i<n; i++){
	            if(a[i] == k){
	            indexofK = i + 1;
	            break;
	            }
	        }
	        
	        System.out.println(indexofK);
	    }
}
