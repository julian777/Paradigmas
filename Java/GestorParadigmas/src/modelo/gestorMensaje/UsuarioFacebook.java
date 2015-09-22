/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.gestorMensaje;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author julian
 */
public class UsuarioFacebook {
    public UsuarioFacebook(String usuario, String mensaje, Timestamp hora,
            String lugar, boolean hastag, String medio, String tema, String estado) {
        this.usuario = usuario;
        this.mensaje = mensaje;
        this.hora = hora;
        this.lugar = lugar;
        this.hastag = hastag;
        this.medio = medio;
        this.tema = tema;
        this.estado = estado;

    }

    public UsuarioFacebook() {
        this("undefined", "undefined", new Timestamp(Calendar.getInstance().getTime().getTime()),
                "undefined", false, "undefined", "undefined", "undefined");
    }
//recibe array de string con los datos, extrae e instancia el objeto con lo q le pasé
    public static UsuarioFacebook fromArray(ArrayList<String> datos) {

        String usuario = datos.get(0);
        String mensaje = datos.get(1);
        Timestamp hora = Timestamp.valueOf(datos.get(2));
        String lugar = datos.get(3);
        boolean hastag = Boolean.parseBoolean(datos.get(4));
        String medio = datos.get(5);
        String tema = datos.get(6);
        String estado = datos.get(7);

        return new UsuarioFacebook(usuario, mensaje, hora, lugar, hastag, medio, tema, estado);
    }

    //el gestor lo consulta para insertar datos en la base
    public ArrayList<Object> toArray() {
        ArrayList r = new ArrayList();
        r.add(getUsuario());
        r.add(getMensaje());
        r.add(getHora());
        r.add(getLugar());
        r.add(isHastag());
        r.add(getMedio());
        r.add(getTema());
        r.add(getEstado());
        return r;
    }

    @Override
    public String toString() {
        return super.toString();
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getMedio() {
        return medio;
    }

    public void setMedio(String medio) {
        this.medio = medio;
    }

    public String getTema() {
        return tema;
    }

    public void setTema(String tema) {
        this.tema = tema;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Timestamp getHora() {
        return hora;
    }

    public void setHora(Timestamp hora) {
        this.hora = hora;
    }

    public boolean isHastag() {
        return hastag;
    }

    public void setHastag(boolean hastag) {
        this.hastag = hastag;
    }

    private String usuario;
    private String mensaje;
    private String lugar;
    private String medio;
    private String tema;
    private String estado;
    private Timestamp hora;
    private boolean hastag;
}
