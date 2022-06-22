package Beans;

public class SupervivienteBean {
    private String numero_identi;
    private String nombre;
    private String apellido;
    private String estado;
    private double peso;
    private double fuerza;
    private String parejaNombre;
    private String parejaApellido;
    private double carga;
    private String sexo;

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

    public String getNumero_identi() {
        return numero_identi;
    }

    public void setNumero_identi(String numero_identi) {
        this.numero_identi = numero_identi;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
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

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
