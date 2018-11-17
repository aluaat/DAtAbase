package lab5;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;


public class test1 {
    public static void main(String[] args) {
        // write your code here
        Map<String, String> m = new HashMap<String, String>();
        int best = 100;


        try {
            FileReader in_file = new FileReader("C:/Users/user/OOP/lab5/scores.txt");
            FileWriter out_file = new FileWriter("C:/Users/user/OOP/lab5/grades.txt");

            BufferedReader br = new BufferedReader(in_file);
            BufferedWriter bw = new BufferedWriter(out_file);

            String line = "";
            for(int i = 0; i < 3; i++){
                line = br.readLine();
                String[] strings = line.split(" ");
                m.put((strings[0] + " " + strings[1]), strings[2]);
            }
            br.close();

            Set< Map.Entry< String,String> > st = m.entrySet();
            for (Map.Entry< String,String> me:st){
                String res = "";
                res+= me.getKey();

                if(Integer.parseInt(me.getValue()) >= best - 10){
                    res += " A";
                }else if(Integer.parseInt(me.getValue()) >= best - 20){
                    res += " B";
                }else if(Integer.parseInt(me.getValue()) >= best - 30){
                    res += " C";
                }else if(Integer.parseInt(me.getValue()) >= best - 40){
                    res += " D";
                }else{
                    res += " E";
                }

                bw.write(res + "\n");
            }
            bw.close();



        }catch (FileNotFoundException e) {
            e.printStackTrace();
        }catch (IOException e) {
            e.printStackTrace();
        }

    }
}
