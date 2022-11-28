/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package facturacion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JLabel;
import javax.swing.JPanel;

/**
 *
 * @author equipo farma
 */
public class Conexion {

    private static final String SERVIDOR = "localhost";
    private static final String PUERTO = "1433";
    private static final String NOMBREBD = "GFARMADB";
    private static final String USUARIO = "sa";
    private static final String PW = "123";
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    public Connection obtenerConexion() {
        try {
            String connectionUrl = "jdbc:sqlserver://" + SERVIDOR + ":" + PUERTO
                    + "; Databasename= " + NOMBREBD + "; user = " + USUARIO + "; password= "
                    + PW + ";";
            Class.forName(DRIVER);
            return (DriverManager.getConnection(connectionUrl));
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return null;
    }
    
    public void close(Connection conn) {
        try {
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

   
}
