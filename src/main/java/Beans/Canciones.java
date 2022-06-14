package Beans;

public class Canciones {
    private int idCancion;
    private String nombre_cancion;
    private String banda;

    public Canciones(int idCancion, String nombre_cancion, String banda) {
        this.idCancion = idCancion;
        this.nombre_cancion = nombre_cancion;
        this.banda = banda;
    }

    public Canciones() {

    }

    public int getIdCancion() {
        return idCancion;
    }

    public void setIdCancion(int idCancion) {
        this.idCancion = idCancion;
    }

    public String getNombre_cancion() {
        return nombre_cancion;
    }

    public void setNombre_cancion(String nombre_cancion) {
        this.nombre_cancion = nombre_cancion;
    }

    public String getBanda() {
        return banda;
    }

    public void setBanda(String banda) {
        this.banda = banda;
    }
}
