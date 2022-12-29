import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

import ObjetosInterface.Label;

public class Text extends Label{
    private Scanner scan;
    private String user;
    private int resposta;
    private int casas;
    private boolean boo;
    private String c;
    int teste;

    private File file;
    private FileWriter writer;

    public Text(String user)
    {
        this.user=user;
        resposta=0;
        casas=0;
        boo=false;
        c = "f";
        labelText();
    }

    public void writeAssemblyBoo()
    {
        try {
            writer = new FileWriter(user+"//textBoolean.txt");
            writer.write("f");
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void getAssemblyBoo()
    {
        file = new File(user+"//textBoolean.txt");
        try {
            scan = new Scanner(file);
        } catch (Exception e) {
        }
        c = scan.next();
        teste = c.charAt(0);
        if(teste == 118)
            boo = true;
        scan.close();
    }

    public void getAssemblyAnswer(boolean boo)
    {
        if(boo)
        {
            file = new File(user+"\\textos.txt");
            try {
                scan = new Scanner(file);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
            for(int i=0;i<l.length;i++)
            {
                l[i].setText(scan.nextLine());
                sleep(500);
            }
            resposta = scan.nextInt();
            resposta = (resposta < 1 || resposta > 4)?1:resposta;
            casas = 1;

            scan.close();
        }
        else
        {
            for(int i=0;i<l.length;i++)
            {
                l[i].setText("Esperando resposta do Mips");
                sleep(500);
            }
        }
    }

    public void winLose(String winLose)
    {
        for(int i=0;i<l.length;i++)
        {
            l[i].setText(winLose);
            sleep(2);
        }
    }

    public void sleep(int sleep)
    {
        try {
            Thread.sleep(sleep);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public int getResposta() {
        return resposta;
    }

    public void setResposta(int resposta) {
        this.resposta = resposta;
    }

    public int getCasas() {
        return casas;
    }

    public void setCasas(int casas) {
        this.casas = casas;
    }

    public boolean isBoo() {
        return boo;
    }

    public void setBoo(boolean boo) {
        this.boo = boo;
    }

}
