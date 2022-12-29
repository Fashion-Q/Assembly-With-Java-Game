import ObjetosInterface.Botoes;

public class Play {
    Imagens img;
    Botoes b;
    Text t;

    public Play(Imagens img, Botoes b, Text t)
    {
        this.img=img;
        this.b=b;
        this.t=t;
    }

    public void playInicio()
    {
        sleep(100);
        img.playInicio();
        b.play();
        for(int i=0;i<t.l.length-1;i++)
        {
            t.loc(i, b.getX(i)+60, b.getY(i)+5);
        }t.loc(4, 243, 163);
        play();
    }

    public void play()
    {
        b.setAction(0);
        do
        {
            t.setBoo(false);
            while(!t.isBoo())
            {
                sleep(800);
                t.getAssemblyBoo();
            }
            
            t.getAssemblyAnswer(true);
            img.fixIt();
            b.setAction(0);

            while(b.getAction()==0)
                sleep(20);

            if(b.getAction() == t.getResposta())
            {
                if(img.moveRobo(true,t.getCasas()).equals("win"))
                {
                    t.winLose("Voce venceu!!!");
                    b.setAction(-1);
                    break;
                }
            }
            else
            {
                if(img.moveRobo(false,t.getCasas()).equals("lose"))
                {
                    t.winLose("Voce perdeu!!!");
                }
            }

            t.getAssemblyAnswer(false);
            img.fixIt();
            t.writeAssemblyBoo();
            sleep(20);
        }while(b.getAction()!=-1);
    }

    public void sleep(int sleep)
    {
        try {
            Thread.sleep(sleep);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
