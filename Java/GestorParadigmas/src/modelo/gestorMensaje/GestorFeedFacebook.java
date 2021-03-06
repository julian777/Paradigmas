/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.gestorMensaje;

/**
 *
 * @author julian
 */
import com.google.gson.Gson;
import java.util.*;
import java.sql.*;
import java.sql.Date;
import modelo.baseDatos.*;
import java.sql.Connection;

public class GestorFeedFacebook {

    public GestorFeedFacebook(String nuevoServidor) {
        URL_Servidor = nuevoServidor;
        //localhost
    }

    //1.Hacer un proceso almacenado que devuelva (hora,cantidad_mensajes,tema)
    //con un histograma se puede hacer, horizontal las horas, vertical la cantidad
    //el color los temas
    //tupla: (Horas,cantidad,tema)
    public String datosGraficoUnoToJSON() {

        ArrayList<Object[]> aa = this.obtenerHora_Cant_tema_Post();

        String json = new Gson().toJson(aa);

        System.out.println(json);

        return json;

    }

    public ArrayList<Object[]> obtenerHora_Cant_tema_Post() {
        ArrayList<Object[]> graficoUno = new ArrayList<Object[]>();

        // Abre una conexión a la base de datos y carga la lista de usuarios.
        GestorBaseDatos bd = null;
        try {
            bd = GestorBaseDatos.obtenerInstancia(URL_Servidor);
            Connection cnx = bd.obtenerConexion(BASE_DATOS, LOGIN, PASSWORD);

            Statement stm = cnx.createStatement();
            ResultSet rs = stm.executeQuery("{call hora_cant_tema_Post()}");
            int maxCols = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Object[] registro = new Object[maxCols];
                for (int i = 0; i < maxCols; i++) {
                    registro[i] = rs.getObject(i + 1);
                }
                graficoUno.add(registro);
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            bd.cerrarConexion();
        }

        return graficoUno;
    }

  //2.Devuelve (cantidad,tema) osea, de los 5 temas dados devuelve cuantas veces se
    //mencionan, esto para poder hacer un grafico de pastel con todos los temas y
    //sus numeros
    public String datosGraficoDosToJSON() {

        ArrayList<Object[]> aa = this.proporcion_pastel_facebook();

        String json = new Gson().toJson(aa);

        System.out.println(json);

        return json;

    }

    public ArrayList<Object[]> proporcion_pastel_facebook() {
        ArrayList<Object[]> graficoDos = new ArrayList<Object[]>();

        // Abre una conexión a la base de datos y carga la lista de usuarios.
        GestorBaseDatos bd = null;
        try {
            bd = GestorBaseDatos.obtenerInstancia(URL_Servidor);
            Connection cnx = bd.obtenerConexion(BASE_DATOS, LOGIN, PASSWORD);

            Statement stm = cnx.createStatement();
            ResultSet rs = stm.executeQuery("{call proporcion_pastel_facebook()}");
            int maxCols = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Object[] registro = new Object[maxCols];
                for (int i = 0; i < maxCols; i++) {
                    registro[i] = rs.getObject(i + 1);
                }
                graficoDos.add(registro);
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            bd.cerrarConexion();
        }

        return graficoDos;
    }

        //3.Proceso almacenado
    //Devuelve (hora,cant_mensajes) se debe graficar en una grafica de barras
    //el primer parametro esta abreviado con el primer simbolo de la hora militar
    //de forma que 13 simboliza la 1:00 pm
    public String datosGraficoTresToJSON() {

        ArrayList<Object[]> aa = this.frecuencia_barras_facebook();

        String json = new Gson().toJson(aa);

        System.out.println(json);

        return json;

    }

    public ArrayList<Object[]> frecuencia_barras_facebook() {
        ArrayList<Object[]> graficoTres = new ArrayList<Object[]>();

        // Abre una conexión a la base de datos y carga la lista de usuarios.
        GestorBaseDatos bd = null;
        try {
            bd = GestorBaseDatos.obtenerInstancia(URL_Servidor);
            Connection cnx = bd.obtenerConexion(BASE_DATOS, LOGIN, PASSWORD);

            Statement stm = cnx.createStatement();
            ResultSet rs = stm.executeQuery("{call frecuencia_barras_facebook()}");
            int maxCols = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Object[] registro = new Object[maxCols];
                for (int i = 0; i < maxCols; i++) {
                    registro[i] = rs.getObject(i + 1);
                }
                graficoTres.add(registro);
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            bd.cerrarConexion();
        }

        return graficoTres;
    }

    //4.Proceso almacenado:
    //se devuelve (sin_Hastag,con_Hastag)
    //son dos cantidades, se dejo a la libre idear una comparacion en esta parte
    //lo que se planea es hacer una grafica que compare la cantidad de tweets con
    //hastag y los que no lo tienen
    public String datosGraficoCuatroToJSON() {

        ArrayList<Object[]> aa = this.Con_o_Sin_Hastag_facebook();

        String json = new Gson().toJson(aa);

        System.out.println(json);

        return json;

    }

    public ArrayList<Object[]> Con_o_Sin_Hastag_facebook() {
        ArrayList<Object[]> graficoCuatro = new ArrayList<Object[]>();

        // Abre una conexión a la base de datos y carga la lista de usuarios.
        GestorBaseDatos bd = null;
        try {
            bd = GestorBaseDatos.obtenerInstancia(URL_Servidor);
            Connection cnx = bd.obtenerConexion(BASE_DATOS, LOGIN, PASSWORD);

            Statement stm = cnx.createStatement();
            ResultSet rs = stm.executeQuery("{call Con_o_Sin_Hastag_facebook()}");
            int maxCols = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Object[] registro = new Object[maxCols];
                for (int i = 0; i < maxCols; i++) {
                    registro[i] = rs.getObject(i + 1);
                }
                graficoCuatro.add(registro);
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            bd.cerrarConexion();
        }

        return graficoCuatro;
    }

    //5.Proceso almacenado con usuarios con mas post o tweets
    //devuelve todos los usuarios y la cantidad de tweets en orden desc
    //devuelve (usuario,cantidad)
    //la idea es tomar los primeros 10 y graficarlos
    public String datosGraficoCincoToJSON() {

        ArrayList<Object[]> aa = this.Usuario_Cant_Post();

        String json = new Gson().toJson(aa);

        System.out.println(json);

        return json;

    }

    public ArrayList<Object[]> Usuario_Cant_Post() {
        ArrayList<Object[]> graficoCinco = new ArrayList<Object[]>();

        // Abre una conexión a la base de datos y carga la lista de usuarios.
        GestorBaseDatos bd = null;
        try {
            bd = GestorBaseDatos.obtenerInstancia(URL_Servidor);
            Connection cnx = bd.obtenerConexion(BASE_DATOS, LOGIN, PASSWORD);

            Statement stm = cnx.createStatement();
            ResultSet rs = stm.executeQuery("{call Usuario_Cant_Post()}");
            int maxCols = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Object[] registro = new Object[maxCols];
                for (int i = 0; i < maxCols; i++) {
                    registro[i] = rs.getObject(i + 1);
                }
                graficoCinco.add(registro);
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            bd.cerrarConexion();
        }

        return graficoCinco;
    }

    //6.Proceso almacenado que devuelve (Hora,cantidad_mensajes,medio)
    //la hora viene abreviada, 13 es 1:00pm, cantidad de mensajes indiferente del tema
    //generados en esa hora, y el medio, en este caso twitter
    public String datosGraficoSeisToJSON() {

        ArrayList<Object[]> aa = this.Densidad_Hora_Cant_Medio_Facebook();

        String json = new Gson().toJson(aa);

        System.out.println(json);

        return json;

    }

    public ArrayList<Object[]> Densidad_Hora_Cant_Medio_Facebook() {
        ArrayList<Object[]> graficoSeis = new ArrayList<Object[]>();

        // Abre una conexión a la base de datos y carga la lista de usuarios.
        GestorBaseDatos bd = null;
        try {
            bd = GestorBaseDatos.obtenerInstancia(URL_Servidor);
            Connection cnx = bd.obtenerConexion(BASE_DATOS, LOGIN, PASSWORD);

            Statement stm = cnx.createStatement();
            ResultSet rs = stm.executeQuery("{call Densidad_Hora_Cant_Medio_Facebook()}");
            int maxCols = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Object[] registro = new Object[maxCols];
                for (int i = 0; i < maxCols; i++) {
                    registro[i] = rs.getObject(i + 1);
                }
                graficoSeis.add(registro);
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            bd.cerrarConexion();
        }

        return graficoSeis;
    }

    //este metodo devuelve un registro con (Mensaje, cantidad_repeticiones)
    //esto para comparar en un grafico la cantidad de veces que se repite un hastag
    public String datosGraficoSieteToJSON() {

        ArrayList<Object[]> aa = this.Mensajes_con_Hastag_facebook();

        String json = new Gson().toJson(aa);

        System.out.println(json);

        return json;

    }

    public ArrayList<Object[]> Mensajes_con_Hastag_facebook() {
        ArrayList<Object[]> graficoSiete = new ArrayList<Object[]>();

        // Abre una conexión a la base de datos y carga la lista de usuarios.
        GestorBaseDatos bd = null;
        try {
            bd = GestorBaseDatos.obtenerInstancia(URL_Servidor);
            Connection cnx = bd.obtenerConexion(BASE_DATOS, LOGIN, PASSWORD);

            Statement stm = cnx.createStatement();
            ResultSet rs = stm.executeQuery("{call Mensajes_con_Hastag_facebook()}");
            int maxCols = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Object[] registro = new Object[maxCols];
                for (int i = 0; i < maxCols; i++) {
                    registro[i] = rs.getObject(i + 1);
                }
                graficoSiete.add(registro);
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            bd.cerrarConexion();
        }

        return graficoSiete;
    }

    public String datosGraficoOchoToJSONF() {

        ArrayList<Object[]> aa = this.PastelitoF();

        String json = new Gson().toJson(aa);

        System.out.println(json);

        return json;

    }

    public ArrayList<Object[]> PastelitoF() {
        ArrayList<Object[]> graficoCuatro = new ArrayList<Object[]>();

        // Abre una conexión a la base de datos y carga la lista de usuarios.
        GestorBaseDatos bd = null;
        try {
            bd = GestorBaseDatos.obtenerInstancia(URL_Servidor);
            Connection cnx = bd.obtenerConexion(BASE_DATOS, LOGIN, PASSWORD);

            Statement stm = cnx.createStatement();
            ResultSet rs = stm.executeQuery("{call pastelitoF()}");
            int maxCols = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Object[] registro = new Object[maxCols];
                for (int i = 0; i < maxCols; i++) {
                    registro[i] = rs.getObject(i + 1);
                }
                graficoCuatro.add(registro);
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            bd.cerrarConexion();
        }

        return graficoCuatro;
    }

    public String datosGraficoNueveToJSONF() {

        ArrayList<Object[]> aa = this.LugarCantF();

        String json = new Gson().toJson(aa);

        System.out.println(json);

        return json;

    }

    public ArrayList<Object[]> LugarCantF() {
        ArrayList<Object[]> graficoCuatro = new ArrayList<Object[]>();

        // Abre una conexión a la base de datos y carga la lista de usuarios.
        GestorBaseDatos bd = null;
        try {
            bd = GestorBaseDatos.obtenerInstancia(URL_Servidor);
            Connection cnx = bd.obtenerConexion(BASE_DATOS, LOGIN, PASSWORD);

            Statement stm = cnx.createStatement();
            ResultSet rs = stm.executeQuery("{call lugarCantidad()}");
            int maxCols = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Object[] registro = new Object[maxCols];
                for (int i = 0; i < maxCols; i++) {
                    registro[i] = rs.getObject(i + 1);
                }
                graficoCuatro.add(registro);
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            bd.cerrarConexion();
        }

        return graficoCuatro;
    }

    public String datosGraficoDiezToJSONF() {

        ArrayList<Object[]> aa = this.animoF();

        String json = new Gson().toJson(aa);

        System.out.println(json);

        return json;

    }

    public ArrayList<Object[]> animoF() {
        ArrayList<Object[]> graficoCuatro = new ArrayList<Object[]>();

        // Abre una conexión a la base de datos y carga la lista de usuarios.
        GestorBaseDatos bd = null;
        try {
            bd = GestorBaseDatos.obtenerInstancia(URL_Servidor);
            Connection cnx = bd.obtenerConexion(BASE_DATOS, LOGIN, PASSWORD);

            Statement stm = cnx.createStatement();
            ResultSet rs = stm.executeQuery("{call estado_animoF()}");
            int maxCols = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Object[] registro = new Object[maxCols];
                for (int i = 0; i < maxCols; i++) {
                    registro[i] = rs.getObject(i + 1);
                }
                graficoCuatro.add(registro);
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            bd.cerrarConexion();
        }

        return graficoCuatro;
    }
    
    
    private String URL_Servidor = "localhost";
    private static final String BASE_DATOS = "proyecto";

    private static final String LOGIN = "root";
    private static final String PASSWORD = "root";

}
