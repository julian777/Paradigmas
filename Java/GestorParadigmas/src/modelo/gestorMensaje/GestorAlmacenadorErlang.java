/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.gestorMensaje;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.ArrayList;
import modelo.baseDatos.GestorBaseDatos;

/**
 *
 * @author julian
 */
//recibe tuplas y las inserta
public class GestorAlmacenadorErlang {

    public GestorAlmacenadorErlang(String nuevoServidor) {
        URL_Servidor = nuevoServidor;
        //localhost
    }

    //un registraFacebook, otro registraTwitter
    public boolean registrarUsuarioTwitter(UsuarioTwitter nuevoUsuario) {
        boolean exito = false;
        int registrosActualizados = 0;
        GestorBaseDatos bd = null;
        try {
            bd = GestorBaseDatos.obtenerInstancia(URL_Servidor);
            Connection cnx
                    = bd.obtenerConexion(BASE_DATOS, LOGIN, PASSWORD);

            PreparedStatement stm = cnx.prepareStatement(CMD_INCLUIR_TWEET);
            stm.clearParameters();

            ArrayList<Object> campos = nuevoUsuario.toArray();

            stm.setString(1, campos.get(0).toString());     // usuario : String
            stm.setString(2, campos.get(1).toString());     // mensaje : String
            stm.setTimestamp(3, (Timestamp) campos.get(2));   // hora : Timestamp horaIngreso
            stm.setString(4, campos.get(3).toString());     // lugar : String
            stm.setBoolean(5, (Boolean) campos.get(4));      // hastag : boolean
            stm.setString(6, campos.get(5).toString());     // medio : String
            stm.setString(7, campos.get(6).toString());  // tema: String
            stm.setString(8, campos.get(7).toString());          // estado: String  

            registrosActualizados = stm.executeUpdate();
            exito = registrosActualizados == 1;
            stm.close();

        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            bd.cerrarConexion();
        }
        return exito;
    }

    public boolean registrarUsuarioFacebook(UsuarioFacebook nuevoUsuario) {
        boolean exito = false;
        int registrosActualizados = 0;
        GestorBaseDatos bd = null;
        try {
            bd = GestorBaseDatos.obtenerInstancia(URL_Servidor);
            Connection cnx
                    = bd.obtenerConexion(BASE_DATOS, LOGIN, PASSWORD);

            PreparedStatement stm = cnx.prepareStatement(CMD_INCLUIR_POST);
            stm.clearParameters();

            ArrayList<Object> campos = nuevoUsuario.toArray();

            stm.setString(1, campos.get(0).toString());     // usuario : String
            stm.setString(2, campos.get(1).toString());     // mensaje : String
            stm.setTimestamp(3, (Timestamp) campos.get(2));   // hora : Timestamp horaIngreso
            stm.setString(4, campos.get(3).toString());     // lugar : String
            stm.setBoolean(5, (Boolean) campos.get(4));      // hastag : boolean
            stm.setString(6, campos.get(5).toString());     // medio : String
            stm.setString(7, campos.get(6).toString());  // tema: String
            stm.setString(8, campos.get(7).toString());          // estado: String  

            registrosActualizados = stm.executeUpdate();
            exito = registrosActualizados == 1;
            stm.close();

        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            bd.cerrarConexion();
        }
        return exito;
    }

    private static final String CMD_INCLUIR_TWEET
            = "INSERT into Twitter "
            + "(usuario, mensaje, hora, lugar, hastag, medio, tema, estado) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?) ";

    private static final String CMD_INCLUIR_POST
            = "INSERT into Facebook "
            + "(usuario, mensaje, hora, lugar, hastag, medio, tema, estado) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?) ";

    private String URL_Servidor = "localhost";
    private static final String BASE_DATOS = "proyecto";
    private static final String LOGIN = "root";
    private static final String PASSWORD = "root";

}
