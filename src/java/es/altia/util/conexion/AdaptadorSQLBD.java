package es.altia.util.conexion;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Stub implementation of AdaptadorSQLBD for compilation compatibility
 */
public class AdaptadorSQLBD {
    
    public Connection getConnection() throws SQLException, BDException {
        throw new UnsupportedOperationException("Stub implementation - not functional");
    }
    
    public void devolverConexion(Connection conn) throws BDException {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                throw new BDException(e);
            }
        }
    }
    
    public void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                // Log error
            }
        }
    }
}