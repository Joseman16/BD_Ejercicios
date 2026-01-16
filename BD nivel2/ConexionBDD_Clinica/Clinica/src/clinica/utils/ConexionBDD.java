/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clinica.utils;

import clinica.excepcion.JosException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBDD {

    public static Connection obtenerConexion() throws JosException {
        try {
            Class.forName("org.postgresql.Driver");

            String url = "jdbc:postgresql://localhost:5432/Database_E1";
            String user = "postgres";
            String pass = "0942677998";

            return DriverManager.getConnection(url, user, pass);

        } catch (ClassNotFoundException e) {
            throw new JosException("No se encontró el driver PostgreSQL");
        } catch (SQLException e) {
            throw new JosException("Error de conexión: " + e.getMessage());
        }
    }
}

