package Beans;

public class Canciones {
    private int idCancion;
    private String nombre_cancion;
    private String banda;
    private String estado;
    public Canciones(int idCancion, String nombre_cancion, String banda, String estado) {
        this.idCancion = idCancion;
        this.nombre_cancion = nombre_cancion;
        this.banda = banda;
        this.estado = estado;

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

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
