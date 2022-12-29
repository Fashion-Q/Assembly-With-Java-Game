package ObjetosInterface;
import javax.swing.ImageIcon;
import javax.swing.JLabel;

public class Label{
    public JLabel[] l;
    public int[] sW;
    public int[] sH;

    public void labelText()
    {
        l = new JLabel[5];
        for(int i=0;i<l.length;i++)
        {
            l[i] = new JLabel("Esperando resposta do Mips");
            l[i].setBounds(0,0,400,25);
        }
    }

    public void criarLabel(String user, int qnt)
    {
        l = new JLabel[qnt];

        for(int i=0;i<qnt;i++)
        {
            l[i] = new JLabel(new ImageIcon(user+"\\img\\imgCentral\\"+(i+1)+".png"));
            l[i].setBounds(0,0,0,0);
        }
    }

    public int getY(int index)
    {
        return l[index].getY();
    }

    public int getX(int index)
    {
        return l[index].getX();
    }

    public void setSize(int index)
    {
        l[index].setSize(sW[index],sH[index]);
    }

    public void loc(int index, int x, int y)
    {
        l[index].setLocation(x,y);
    }

    public JLabel getLabel(int index)
    {
        return l[index];
    }

    public int getLength()
    {
        return l.length;
    }

}
