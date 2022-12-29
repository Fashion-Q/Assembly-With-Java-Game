import javax.swing.JFrame;

import ObjetosInterface.Botoes;

public class Interface extends JFrame{
    private static Interface m;
    private CriarObjetos o = new CriarObjetos();
    private Imagens img;
    private Botoes b;
    private Text t;

    public Interface(){
        setTitle("Interface para suporte ao Assembly");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(762,671);
        setResizable(false);
        setLocation(280,32);
        setVisible(true);
    }

    public static void main(String[] args) throws Exception {
        m = new Interface();
        m.o.criarObjetos(m);
        m.t = m.o.getText();
        m.img = m.o.getImgCentral();
        m.b = m.o.getBotoes();
        Play play = new Play(m.img,m.b,m.t);
        
        play.playInicio();

        //locThings();
    }

    public static void locThings()
    {
        int x=m.img.saveX,y=m.img.saveY,xx=1,yy=1;
        boolean b = true;//157
        m.o.b.setAction(-1);
        while(m.o.b.getAction()!=-2)
        {
            if(m.o.b.getAction()==1)//W
            {
                y-=yy;
                System.out.println("W");
                m.img.loc(0, x, y);
                m.o.b.setAction(-1);
            }
            else if(m.o.b.getAction()==2)//A
            {
                x-=xx;
                System.out.println("A");
                m.img.loc(0, x, y);
                m.o.b.setAction(-1);
            }
            else if(m.o.b.getAction()==3)//S
            {
                y+=yy;
                System.out.println("S");
                m.img.loc(0, x, y);
                m.o.b.setAction(-1);
            }
            else if(m.o.b.getAction()==4)//D
            {
                x+=xx;
                System.out.println("D");
                m.img.loc(0, x, y);
                m.o.b.setAction(-1);
            }
            else if(m.o.b.getAction()==5)//R
            {
                if(xx==1)
                    xx=20;
                else
                    xx=1;
                if(yy==1)
                    yy=20;
                else
                    yy=1;
                    m.img.loc(0, x, y);
                m.o.b.setAction(-1);
                System.out.println("R");
                System.out.println(m.img.getX(0));
                System.out.println(m.img.getY(0));
            }
            else if(m.o.b.getAction()==6)//T
            {
                m.o.b.setAction(-1);
                System.out.println("T");
                b=!b;
            }
            else if(m.o.b.getAction()==7)//Y
            {
                m.o.b.setAction(-1);
                System.out.println("Y");
            }
            else if(m.o.b.getAction()==8)//U
            {
                m.o.b.setAction(-1);
                System.out.println("U");
            }
            else if(m.o.b.getAction()==9)//I
            {
                m.o.b.setAction(-1);
                System.out.println("I");
            }
            else if(m.o.b.getAction()==10)//O
            {
                m.o.b.setAction(-1);
                System.out.println("O");
            }
            sleep(5);
        }
    }

    public static void sleep(int sleep)
    {
        try {
            Thread.sleep(sleep);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}