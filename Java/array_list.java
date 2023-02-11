package Practice;

import java.util.ArrayList;

public class array_list {
	public static void main(String[] args) {
        ArrayList<String> team = new ArrayList<String>();

        team.add("勇者");
        team.add("魔法使い"); //array_listに要素を追加
        
        for (String member : team) {
            System.out.println(member);
        }
        
        System.out.println(team.get(1)); //getは指定したインデックスの値を返す
        System.out.println(team.size()); //arraylistの要素数
        
        System.out.println("---------");
        
        team.set(1, "忍者"); //array_listの要素を更新
        
        for (String member : team) {
            System.out.println(member);
        }
        
        System.out.println("---------");
        
        team.remove(1); //array_listの要素を削除
        
        for (String member : team) {
            System.out.println(member);
        }
        }
}
