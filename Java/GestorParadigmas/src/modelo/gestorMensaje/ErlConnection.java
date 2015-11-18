/*
 Instrucciones: ir a la terminal y pegar el siguiente comando
 erl -sname enode -setcookie  erlang
 luego ejecutar el main de este ErlConnection.java
 */
package modelo.gestorMensaje;

import Modelo.ModeloErlang;
import com.ericsson.otp.erlang.OtpConnection;
import com.ericsson.otp.erlang.OtpErlangList;
import com.ericsson.otp.erlang.OtpErlangObject;
import com.ericsson.otp.erlang.OtpPeer;
import com.ericsson.otp.erlang.OtpSelf;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

/**
 *
 * @author julian
 */
public class ErlConnection {

    private static OtpConnection conn;
    public OtpErlangObject received;
    private final String peer;
    private final String cookie;
    private String objeto = "";
    private String objetoF = "";
    private String count;

    public static void main(String[] args) {
        new ErlConnection("enode", "erlang");

    }

    final String user = System.getProperty("user.name");

    public ErlConnection(String _peer, String _cookie) {
        peer = _peer;
        cookie = _cookie;

        connect();
        mnesiaMysqlTweet();
        disconnect();
        connect2();
        mnesiaMysqlFacebook();
        disconnect();
    }

    private void mnesiaMysqlFacebook() {
        Timestamp hora2 = new Timestamp(Calendar.getInstance().getTime().getTime());
        int z;

        z = Integer.parseInt(count.trim());
        int limite = 1;

        String matriz[][] = new String[z][8];

        int capacidad = z * 10;

        String[] mnesia = new String[capacidad];
        mnesia = objetoF.split(",");

        for (int j = 0; j < z; j++) {
            for (int k = 0; k < 8; k++) {

                matriz[j][k] = mnesia[limite];
                limite++;

            }
            //limite++;
        }

        ModeloErlang almacena = ModeloErlang.crearInstancia(null);

        GestorAlmacenadorErlang gae = almacena.getgUsuarios();

        UsuarioFacebook usr = new UsuarioFacebook();

        String usuario = "";
        String mensaje = "";
        String time = "";
        String lugar = "";
        String ht = "";
        String medio = "";
        String tema = "";
        String estado = "";
        for (int i = 0; i < z; i++) {

            for (int u = 0; u < 8; u++) {

                usuario = matriz[i][0];
                mensaje = matriz[i][1];
                time = matriz[i][2];
                lugar = matriz[i][3];
                ht = matriz[i][1];
                medio = matriz[i][5];
                tema = matriz[i][6];
                estado = matriz[i][7];

            }
            Timestamp timestamp = new Timestamp(Calendar.getInstance().getTime().getTime());
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ssZ");
                Date parsedDate = dateFormat.parse((time.trim()).substring(1, 25));
                timestamp = new java.sql.Timestamp(parsedDate.getTime());
            } catch (Exception e) {//this generic but you can control another types of exception
                System.err.println(e.getMessage());
            }
            Random r = new  Random();
            usr.setUsuario(usuario);
            usr.setMensaje(mensaje);
            usr.setHora(timestamp);
            usr.setLugar(lugar);
            usr.setHastag(true);
            usr.setMedio(medio);
            usr.setTema(tema);
            usr.setEstado((r.nextBoolean())? "+" : "-");
            gae.registrarUsuarioFacebook(usr);
        }

    }

    private void mnesiaMysqlTweet() {
        Timestamp hora = new Timestamp(Calendar.getInstance().getTime().getTime());

        int z;

        z = Integer.parseInt(count.trim());
        int limite = 1;

        String matriz[][] = new String[z][8];

        int capacidad = z * 10;

        String[] mnesia = new String[capacidad];
        mnesia = objeto.split(",");

        for (int j = 0; j < z; j++) {
            for (int k = 0; k < 8; k++) {

                matriz[j][k] = mnesia[limite];
                limite++;

            }
            //limite++;
        }

        ModeloErlang almacena = ModeloErlang.crearInstancia(null);

        GestorAlmacenadorErlang gae = almacena.getgUsuarios();

        UsuarioTwitter usr = new UsuarioTwitter();

        String usuario = "";
        String mensaje = "";
        String time = "";
        String lugar = "";
        String ht = "";
        String medio = "";
        String tema = "";
        String estado = "";
        for (int i = 0; i < z; i++) {

            for (int u = 0; u < 8; u++) {

                usuario = matriz[i][0];
                mensaje = matriz[i][1];
                time = matriz[i][2];
                lugar = matriz[i][3];
                ht = matriz[i][1];
                medio = matriz[i][5];
                tema = matriz[i][6];
                estado = matriz[i][7];

            }
            Timestamp timestamp = new Timestamp(Calendar.getInstance().getTime().getTime());
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("E MMM dd HH:mm:ss Z yyyy",Locale.ENGLISH);
                System.out.println(dateFormat.format(timestamp));
                Date parsedDate = dateFormat.parse((time.trim()).substring(1, 31));
                timestamp = new java.sql.Timestamp(parsedDate.getTime());
            } catch (Exception e) {//this generic but you can control another types of exception
                System.err.println(e.getMessage());
            }
            Random r = new  Random();
            usr.setUsuario(usuario);
            usr.setMensaje(mensaje);
            usr.setHora(timestamp);
            usr.setLugar(lugar);
            usr.setHastag(true);
            usr.setMedio(medio);
            usr.setTema(tema);
            usr.setEstado((r.nextBoolean())? "+" : "-");
            gae.registrarUsuarioTwitter(usr);
        }

    }

    private void connect() {
        System.out.print("Please wait, connecting to " + peer + "....\n");

        String javaClient = "java";
        try {
            OtpSelf self = new OtpSelf(javaClient, cookie.trim());
            OtpPeer other = new OtpPeer(peer.trim());

            conn = self.connect(other);
//los siguiente son metodos que intentan apartir de la coneccion
// utilizar sendRPC para enviar el nombre modulo,nombre funcion,argumentos
// conn.sendRPC("spooky_sequence", "sequence", new OtpErlangList("5"));
// le mando el numero solo, sin parentesis para mandar un parametro

            conn.sendRPC("parseador", "select_all_tweet", new OtpErlangList(""));

            objeto = conn.receiveRPC().toString();

//            conn.sendRPC("parseador", "select_all_facebook", new OtpErlangList(""));
//
//            objetoF = conn.receiveRPC().toString();
            conn.sendRPC("parseador", "select_count_tweet", new OtpErlangList(""));

            String aux = conn.receiveRPC().toString();

            String[] contador = new String[2];
            contador = aux.split(",");
            String l = contador[1];
            String f = l.replace('}', '\0');
            count = (String) f.toString();

            System.out.println("Connection Established with " + peer + "\n");
        } catch (Exception exp) {
            System.out.println("connection error is :" + exp.toString());
            exp.printStackTrace();
        }

    }

    private void connect2() {
        System.out.print("Please wait, connecting to " + peer + "....\n");

        String javaClient = "java";
        try {
            OtpSelf self = new OtpSelf(javaClient, cookie.trim());
            OtpPeer other = new OtpPeer(peer.trim());

            conn = self.connect(other);
//los siguiente son metodos que intentan apartir de la coneccion
// utilizar sendRPC para enviar el nombre modulo,nombre funcion,argumentos
// conn.sendRPC("spooky_sequence", "sequence", new OtpErlangList("5"));
// le mando el numero solo, sin parentesis para mandar un parametro

//            conn.sendRPC("parseador", "select_all_twitter", new OtpErlangList(""));
//
//            objeto = conn.receiveRPC().toString();
            conn.sendRPC("parseador", "select_all_face", new OtpErlangList(""));

            objetoF = conn.receiveRPC().toString();

            conn.sendRPC("parseador", "select_count_face", new OtpErlangList(""));

            String aux = conn.receiveRPC().toString();

            String[] contador = new String[2];
            contador = aux.split(",");
            String l = contador[1];
            String f = l.replace('}', '\0');
            count = (String) f.toString();

            System.out.println("Connection Established with " + peer + "\n");
        } catch (Exception exp) {
            System.out.println("connection error is :" + exp.toString());
            exp.printStackTrace();
        }

    }

    public String getCount() {
        return count;
    }

    public void disconnect() {
        System.out.println("Disconnecting....");
        if (conn != null) {
            conn.close();
        }
        System.out.println("Successfuly Disconnected");
    }

    public static OtpConnection getConn() {
        return conn;
    }

    public static void setConn(OtpConnection conn) {
        ErlConnection.conn = conn;
    }

    public OtpErlangObject getReceived() {
        return received;
    }

    public void setReceived(OtpErlangObject received) {
        this.received = received;
    }

    public String getObjeto() {
        return objeto;
    }

    public void setObjeto(String objeto) {
        this.objeto = objeto;
    }

}
