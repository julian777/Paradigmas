/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.Serializable;
import modelo.gestorMensaje.GestorFeedTwitter;

/**
 *
 * @author julian
 */
public class ModeloTwitter implements Serializable {

    private ModeloTwitter(String servidor) {
        gUsuarios = new GestorFeedTwitter(servidor);
    }

    public static ModeloTwitter crearInstancia(String servidor) {
        mod = new ModeloTwitter(servidor);
        return mod;
    }

    public static ModeloTwitter getInstancia() {
        return mod;
    }

    public GestorFeedTwitter getgUsuarios() {
        return gUsuarios;
    }

    public void setgUsuarios(GestorFeedTwitter gUsuarios) {
        this.gUsuarios = gUsuarios;
    }

    protected static ModeloTwitter mod = null;
    private static String URL_servidor="localhost";
    private GestorFeedTwitter gUsuarios;
}
