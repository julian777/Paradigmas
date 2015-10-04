/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import modelo.gestorMensaje.GestorAlmacenadorErlang;

/**
 *
 * @author julian
 */
public class ModeloErlang {

    private ModeloErlang(String servidor) {
        gUsuarios = new GestorAlmacenadorErlang(servidor);
    }

    public static ModeloErlang crearInstancia(String servidor) {
        mod = new ModeloErlang(servidor);
        return mod;
    }

    public static ModeloErlang getInstancia() {
        return mod;
    }

    public GestorAlmacenadorErlang getgUsuarios() {
        return gUsuarios;
    }

    public void setgUsuarios(GestorAlmacenadorErlang gUsuarios) {
        this.gUsuarios = gUsuarios;
    }

    private static ModeloErlang mod = null;
    private GestorAlmacenadorErlang gUsuarios;

}
