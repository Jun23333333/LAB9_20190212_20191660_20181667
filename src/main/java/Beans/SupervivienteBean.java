package Beans;

public class SupervivienteBean extends HumanoBean{
    private double peso;
    private double fuerza;
    private String parejaNombre;
    private String parejaApellido;
    private String idPareja;
    private double carga;

    public String getIdPareja() {
        return idPareja;
    }

    public void setIdPareja(String idPareja) {
        this.idPareja = idPareja;
    }

    public String getParejaNombre() {
        return parejaNombre;
    }

    public void setParejaNombre(String parejaNombre) {
        this.parejaNombre = parejaNombre;
    }
    public String getParejaApellido() {
        return parejaApellido;
    }
    public void setParejaApellido(String parejaApellido) {
        this.parejaApellido = parejaApellido;
    }
    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getFuerza() {
        return fuerza;
    }

    public void setFuerza(double fuerza) {
        this.fuerza = fuerza;
    }

    public double getCarga() {
        return carga;
    }

    public void setCarga(double carga) {
        this.carga = carga;
    }

}
