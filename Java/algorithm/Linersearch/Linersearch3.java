// 与えられた配列の中にいちばんはじめの偶数が何番目にあるのかを調べる
package algorithm.Linersearch;
import java.util.Scanner;

public class Linersearch3 {
	public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
    
    int n = sc.nextInt();
    int[] a = new int[n];
    
    for(int i=0; i<n; i++){
        a[i]  = sc.nextInt();
    }
    
    int indexofEven = 0;
    
    for(int i=0; i<n; i++){
        if(a[i] % 2 == 0){
            indexofEven = i + 1;
            break;
        }
    }
    
    System.out.println(indexofEven);
    }

}
