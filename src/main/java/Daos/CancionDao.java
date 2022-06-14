package Daos;

import Beans.Cancion;
import Beans.Canciones;

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
            ResultSet rs = stmt.executeQuery("SELECT c.idcancion, c.nombre_cancion, c.banda FROM lab6sw1.cancion c\n" +
                    "INNER JOIN reproduccion r ON r.cancion_idcancion = c.idcancion\n" +
                    "GROUP BY c.idcancion\n" +
                    "HAVING count(r.idreproduccion)>2 ORDER BY COUNT(*) DESC" );

            while (rs.next()){
                int idCancion = rs.getInt(1);
                String nombre_cancion = rs.getString(2);
                String banda = rs.getString(3);

                listaCanciones.add(new Cancion(idCancion,nombre_cancion,banda));
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return listaCanciones;
    }

}
