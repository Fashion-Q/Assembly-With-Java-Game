import ObjetosInterface.Label;

public class Imagens extends Label{
    int saveX;
    int saveY;

    int horizontal[]={30,190,333,490,636};
    int vertical[]={17,142,275,395,526};
    int indexX,indexY;
    int cont=0;

    public Imagens(String user)
    {
        criarLabel(user, 2);
        sW = new int[2];
        sH = new int[2];
        sW[0]=80;
        sH[0]=80;

        sW[1]=749;
        sH[1]=632;
    }

    public void playInicio()
    {
        saveX=30;
        saveY=17;
        indexX = 0;
        indexY = 0;
        loc(0, saveX, saveY);
        setSize(0);

        loc(1, 0, 0);
        setSize(1);
    }

    public void fixIt()
    {
        loc(1, 0, 0);
        loc(0, saveX, saveY);
    }

    String moveRobo(boolean boo, int casas)
    {
        do
        {
            if(boo)
            {
                if(getY(0) == vertical[0] && getX(0) < horizontal[4])
                {
                    indexX++;
                    makeMove(1,0,horizontal[indexX],getX(0),1);
                }
                else if(getY(0) == vertical[4] && getX(0) > horizontal[0])
                {
                    indexX--;
                    makeMove(-1, 0, horizontal[indexX],getX(0),-1);
                }
                else if(getX(0) == horizontal[4] && getY(0) < vertical[4])
                {
                    indexY++;
                    makeMove(0, 1, vertical[indexY],getY(0),1);
                }
                else if(getX(0) == horizontal[0] && getY(0) > vertical[0])
                {
                    indexY--;
                    makeMove(0, -1, vertical[indexY],getY(0),-1);
                    if(getX(0)==horizontal[0]&&getY(0)==vertical[0])
                    {
                        saveX = getX(0);
                        saveY = getY(0);
                        return "win";
                    }
                }
            }
            else
            {
                if(getY(0) == vertical[0] && getX(0) > horizontal[0])
                {
                    indexX--;
                    makeMove(-1,0,horizontal[indexX],getX(0),-1);
                }
                else if(getY(0) == vertical[4] && getX(0) < horizontal[4])
                {
                    indexX++;
                    makeMove(1, 0, horizontal[indexX],getX(0),1);
                }
                else if(getX(0) == horizontal[4] && getY(0) > vertical[0])
                {
                    indexY--;
                    makeMove(0, -1, vertical[indexY],getY(0),-1);
                }
                else if(getX(0) == horizontal[0] && getY(0) < vertical[4]&&(getY(0)!=vertical[0]))
                {
                    indexY++;
                    makeMove(0, 1, vertical[indexY],getY(0),1);
                    if(getX(0)==horizontal[0]&&getY(0)==vertical[0])
                        return "voce perdeu";
                }
                else
                {
                    break;
                }
            }
            saveX = getX(0);
            saveY = getY(0);
            sleep(400);
            casas--;
            cont++;
        }while (casas>0);
        return "Tem jogo";
    }

    public void makeMove(int controlX, int controlY,int cont, int i,int controlCont)
    {
        for(;i!=cont;i+=controlCont)
        {
            loc(0, getX(0)+controlX, getY(0)+controlY);
            sleep(2);
        }
    }
    
    public void sleep(int sleep)
    {
        try {
            Thread.sleep(sleep);
        } catch (Exception e) {
        }
    }

}
