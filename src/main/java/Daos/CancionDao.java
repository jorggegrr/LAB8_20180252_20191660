package Daos;

import Beans.Cancion;

import java.sql.*;
import java.util.ArrayList;

public class CancionDao {
    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/lab6sw1?serverTimezone=America/Lima";

    public ArrayList<Cancion> listarCanciones_recomen() {
        ArrayList<Cancion> listaCanciones = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(url,user,pass);
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT c.idcancion, c.nombre_cancion, c.banda\n" +
                    "from cancion c\n" +
                    "RIGHT JOIN reproduccion r on c.idcancion = r.cancion_idcancion\n" +
                    "GROUP BY c.idcancion\n" +
                    "HAVING COUNT(*)>2 ORDER BY COUNT(*) DESC" );

            while (rs.next()){
                Cancion cancion = new Cancion();
                cancion.setIdCancion(rs.getInt(1));
                cancion.setNombre_cancion(rs.getString(2));
                cancion.setBanda(rs.getString(3));
                listaCanciones.add(cancion);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return listaCanciones;
    }
}
