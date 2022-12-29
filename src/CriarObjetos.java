
import javax.swing.JFrame;
import ObjetosInterface.Botoes;

class CriarObjetos{
    private String user = System.getProperty("user.dir");
    private Imagens img;
    Botoes b;
    Text t;


    public void criarObjetos(JFrame m)
    {
        t = new Text(user);
        for(int i=0;i<t.l.length;i++)
            m.add(t.l[i]);

        b = new Botoes();
        b.criarBotoes(m,user);
        img = new Imagens(user);
        for(int i=0;i<img.l.length;i++)
            m.add(img.getLabel(i));
        /*t.play();
        img.play();
        b.play();*/
    }

    public Text getText()
    {
        return t;
    }

    public Botoes getBotoes()
    {
        return b;
    }

    public Imagens getImgCentral()
    {
        return img;
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