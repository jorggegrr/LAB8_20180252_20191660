package Daos;

import Beans.Tour;

import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;

import Beans.Canciones;
public class CancionesDao {
    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/lab6sw1?serverTimezone=America/Lima";
    private static String s = "si";
    private static String n = "no";

    public ArrayList<Canciones> obtenerListaCanciones(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ArrayList<Canciones> listaCanciones = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("select * from cancion ")) {

            while (rs.next()) {
                int idCancion = rs.getInt(1);
                String nombre_cancion = rs.getString(2);
                String banda = rs.getString(3);
                String estado = rs.getString(4);

                listaCanciones.add(new Canciones(idCancion,nombre_cancion,banda, estado));
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaCanciones;
    }

    public void añadirFavorito(String id, String estado) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE cancion set cancion_favorita = ? where idcancion = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(2, id);
            if (Objects.equals(estado, "no")) {
                pstmt.setString(1, s);
            }
            else {
                pstmt.setString(1, n);
            }
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
