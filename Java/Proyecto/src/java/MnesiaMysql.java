
import Modelo.ModeloErlang;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.gestorMensaje.ErlConnection;
import modelo.gestorMensaje.GestorAlmacenadorErlang;
import modelo.gestorMensaje.UsuarioTwitter;

/**
 *
 * @author julian
 */
@WebServlet(urlPatterns = {"/MnesiaMysql"})
public class MnesiaMysql extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             
            ErlConnection conectar = new ErlConnection("enode", "erlang");
            
            

            Timestamp hora = new Timestamp(Calendar.getInstance().getTime().getTime());

            int z = 2;
            int limite = 2;

            String matriz[][] = new String[z][8];

            int capacidad = z * 10;

            String[] mnesia = new String[capacidad];
            mnesia = conectar.getObjeto().split(",");

            for (int j = 0; j < z; j++) {
                for (int k = 0; k < 8; k++) {

                    matriz[j][k] = mnesia[limite];
                    limite++;

                }
                limite++;
            }

            ModeloErlang almacena = ModeloErlang.crearInstancia(null);

            GestorAlmacenadorErlang gae = almacena.getgUsuarios();

            UsuarioTwitter usr = new UsuarioTwitter();

            String usuario = "";
            String mensaje = "";
            String lugar = "";
            String medio = "";
            String tema = "";
            String estado = "";
            for (int i = 0; i < z; i++) {

                for (int u = 0; u < 8; u++) {

                    usuario = matriz[i][0];
                    mensaje = matriz[i][1];
                    lugar = matriz[i][3];
                    medio = matriz[i][5];
                    tema = matriz[i][6];
                    estado = matriz[i][7];

                }

                usr.setUsuario(usuario);
                usr.setMensaje(mensaje);
                usr.setHora(hora);
                usr.setLugar(lugar);
                usr.setHastag(true);
                usr.setMedio(medio);
                usr.setTema(tema);
                usr.setEstado(estado);
                gae.registrarUsuarioTwitter(usr);
            }
            
           
            
            
            
            conectar.disconnect();

            request.getRequestDispatcher("pages/index.jsp").forward(request, response);

        } finally {
            out.close();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
