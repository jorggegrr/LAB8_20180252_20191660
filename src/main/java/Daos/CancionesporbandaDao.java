package Daos;
import Beans.Canciones;

import java.sql.*;
import java.util.ArrayList;

public class CancionesporbandaDao {
    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/lab6sw1?serverTimezone=America/Lima";


    public ArrayList<Canciones> mostrarbanda(String banda){
        ArrayList<Canciones> cancionesporbanda = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String sql = "select idcancion, nombre_cancion, banda from cancion where banda =? ";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, banda);
            try (ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    Canciones cancionesporb = new Canciones();
                    cancionesporb.setIdCancion(rs.getInt(1));
                    cancionesporb.setNombre_cancion(rs.getString(2));
                    cancionesporb.setBanda(rs.getString(3));
                    cancionesporbanda.add(cancionesporb);

                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cancionesporbanda;
    }
}
