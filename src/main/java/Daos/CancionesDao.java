package Daos;

import Beans.Tour;

import java.sql.*;
import java.util.ArrayList;
import Beans.Canciones;
public class CancionesDao {
    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/lab6sw1?serverTimezone=America/Lima";


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

                listaCanciones.add(new Canciones(idCancion,nombre_cancion,banda));
            }

        } catch (SQLException e) {
            System.out.println("No se pudo realizar la busqueda");
        }
        return listaCanciones;
    }

    public void Favorito(Canciones canciones) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/hr";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE jobs SET job_title = ?, min_salary = ?, max_salary = ? where job_id = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            //pstmt.setString(1, job.getJobTitle());
            //pstmt.setInt(2, job.getMinSalary());
            //pstmt.setInt(3, job.getMaxSalary());
            //pstmt.setString(4, job.getJobId());
            //pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
