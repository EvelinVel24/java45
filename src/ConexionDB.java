import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe"; // Cambia la URL a tu base de datos
    private static final String USER = "tu_usuario";                        // Cambia el usuario
    private static final String PASSWORD = "tu_contraseña";                 // Cambia la contraseña

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("No se pudo cargar el driver JDBC", e);
        }
    }
}
