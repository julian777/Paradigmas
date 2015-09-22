package modelo.baseDatos;

import java.sql.*;

public class GestorBaseDatos {

    // <editor-fold defaultstate="collapsed" desc="constructores">
    
    protected GestorBaseDatos(String servidor)
            throws ClassNotFoundException,
            IllegalAccessException,
            InstantiationException {
        URL_servidor = (servidor != null) ? servidor : SERVIDOR_POR_DEFECTO;
        Class.forName(MANEJADOR_DB).newInstance();
    }

    protected GestorBaseDatos()
            throws ClassNotFoundException,
            IllegalAccessException,
            InstantiationException {
        this(SERVIDOR_POR_DEFECTO);
    }
    
    // </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="métodos">

    public static GestorBaseDatos obtenerInstancia(String servidor)
            throws ClassNotFoundException,
            IllegalAccessException,
            InstantiationException {
        if (instancia == null) {
            instancia = new GestorBaseDatos(servidor);
        }
        return instancia;
    }

    public Connection obtenerConexion(String baseDatos,
            String usuario, String claveAcceso)
            throws SQLException {
        cerrarConexion();
        String URL_conexion =
                String.format("%s//%s/%s", PROTOCOLO, URL_servidor, baseDatos);

        cnx = DriverManager.getConnection(URL_conexion, usuario, claveAcceso);
        return cnx;
    }

    public void cerrarConexion() {
        if (cnx != null) {
            try {
                cnx.close();
            } catch (SQLException e) {
                e.printStackTrace(System.err);
            }
        }
    }

    @Override
    public String toString() {
        StringBuilder r = new StringBuilder();
        r.append("Servidor de base de datos en: ");
        r.append(URL_servidor);
        return r.toString();
    }
    
    // </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="atributos">
    
    private static GestorBaseDatos instancia = null;
    private String URL_servidor = null;
    private Connection cnx = null;
    // Parámetros para la conexión a un servidor de base de datos MySQL.
    private static final String MANEJADOR_DB = "com.mysql.jdbc.Driver";
    private static final String PROTOCOLO = "jdbc:mysql:";
    private static final String SERVIDOR_POR_DEFECTO = "localhost";
    
    // </editor-fold>
}
