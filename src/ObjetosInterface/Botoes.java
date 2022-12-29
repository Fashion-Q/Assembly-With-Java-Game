package ObjetosInterface;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.KeyStroke;
import java.awt.Color;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Botoes implements ActionListener{
    private JButton[] b;
    private int action;

    //essa string é o nome da "action" quando clicado no botao
    //eu uso ela também para dar ouvidos ao teclado
    private String[] command = {"W","A","S","D","R","T","Y","U","I","O"};

    public void criarBotoes(JFrame m, String user)
    {
        b = new JButton[4];

        // \/ \/ \/ \/ \/  criando botao e adicionando evento por click & teclado \/ \/ \/ \/ \/ \\
        for(int i=0;i<b.length;i++)
        {
            b[i] = new JButton(new ImageIcon(user + "\\img\\botoes\\b.png"));
            b[i].setBounds(0,0,0,0);//33 33
            b[i].setFocusPainted(false);
            b[i].setActionCommand(command[i]);
            b[i].addActionListener(this);
            b[i].setBackground(Color.GREEN);
            //b[i].getBackground();
            //button.setBorderPainted(false);
            putActionKeyboard(b[i], command[i],(i+1));
            m.add(b[i]);
        }
        // /\ /\ /\ /\ /\  criando botao e adicionando evento por click & teclado  /\ /\ /\ /\ /\ \\
        this.action=0;
    }
    
    public void play()
    {
        for(int i=0,y=260;i<4;i++,y+=65)
        {
            size(i,33);
            loc(i, 162, y);
        }
    }

    public void endGame()
    {

    }

    private void putActionKeyboard(JButton b, String ac, int act)
    {
        b.registerKeyboardAction(
        new ActionListener() {
          public void actionPerformed(ActionEvent e) {
            action = act;
          }
        },
        KeyStroke.getKeyStroke(ac),
        JComponent.WHEN_IN_FOCUSED_WINDOW);
    }

    public int getX(int index)
    {
        return b[index].getX();
    }

    public int getY(int index)
    {
        return b[index].getY();
    }

    public void size(int index, int wh)
    {
        b[index].setSize(wh+2,wh);
    }

    public void loc(int index, int x, int y)
    {
        b[index].setLocation(x,y);
    }
    

    public void bDoClick(int index)
    {
        b[index].doClick();
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getActionCommand().equals("W"))
            action = 1;
        else if (e.getActionCommand().equals("A"))
            action = 2;
        else if (e.getActionCommand().equals("S"))
            action = 3;
        else if (e.getActionCommand().equals("D"))
            action = 4;
        else if(e.getActionCommand().equals("R"))
            action = 5;
        else if(e.getActionCommand().equals("T"))
            action = 6;
        else if(e.getActionCommand().equals("Y"))
            action = 7;
        else if(e.getActionCommand().equals("U"))
            action = 8;
        else if(e.getActionCommand().equals("I"))
            action = 9;
        else if(e.getActionCommand().equals("O"))
            action = 10;
        
    }
    //{"W","A","S","D","R","T","Y","U","I","O"};

    public int getAction()
    {
        return this.action;
    }

    public void setAction(int action)
    {
        this.action = action;
    }
}

