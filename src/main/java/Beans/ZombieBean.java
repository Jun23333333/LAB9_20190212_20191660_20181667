package Beans;

public class ZombieBean {
    private String nombre;
    private String apellido;
    private String sexo;
    private int numero_identi;
    private int tiempo_infectado;
    private String variante;
    private int num_victima;
    private String tipo;

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

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getNumero_identi() {
        return numero_identi;
    }

    public void setNumero_identi(int numero_identi) {
        this.numero_identi = numero_identi;
    }

    public int getTiempo_infectado() {
        return tiempo_infectado;
    }

    public void setTiempo_infectado(int tiempo_infectado) {
        this.tiempo_infectado = tiempo_infectado;
    }

    public String getVariante() {
        return variante;
    }

    public void setVariante(String variante) {
        this.variante = variante;
    }

    public int getNum_victima() {
        return num_victima;
    }

    public void setNum_victima(int num_victima) {
        this.num_victima = num_victima;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
