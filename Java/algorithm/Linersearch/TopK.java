//与えられた配列のうち、K（三番目に与えられた値）番目に大きい数字を調べる

package algorithm.Linersearch;
import java.util.Scanner;

public class TopK {
	 public static void main(String[] args) {
	        Scanner sc = new Scanner(System.in);
	        
	        int n = sc.nextInt();
	        int[] a = new int[n];
	        
	        for(int i=0; i<n; i++){
	            a[i] = sc.nextInt();
	        }
	        
	        int k = sc.nextInt(); //番目のあたい
	        
	        int maximum = 1000000001;
	        
	        for(int i=0; i<k; i++){ 
	            int nextMaximum = -10000001;
	            
	            for(int value : a){
	                if(value < maximum){ //配列の中の最大値よりも1小さい値を調べる。それをK回調べてK番目に大きい値を求める
	                    nextMaximum = Math.max(nextMaximum, value);
	                }
	            }
	            maximum = nextMaximum;
	        }
	        
	        System.out.println(maximum);
	    
	    }

}
