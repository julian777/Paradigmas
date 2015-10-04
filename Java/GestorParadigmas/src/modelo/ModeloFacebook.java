/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import modelo.gestorMensaje.GestorFeedFacebook;

/**
 *
 * @author julian
 */
public class ModeloFacebook {

    private ModeloFacebook(String servidor) {
        gUsuarios = new GestorFeedFacebook(servidor);
    }

    public static ModeloFacebook crearInstancia(String servidor) {
        mod = new ModeloFacebook(servidor);
        return mod;
    }

    public static ModeloFacebook getInstancia() {
        return mod;
    }

    public GestorFeedFacebook getgUsuarios() {
        return gUsuarios;
    }

    public void setgUsuarios(GestorFeedFacebook gUsuarios) {
        this.gUsuarios = gUsuarios;
    }

    private static ModeloFacebook mod = null;
    private GestorFeedFacebook gUsuarios;

}
