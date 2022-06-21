package Beans;

public class ZombieBean {
    private String nombre;
    private String apellido;
    private String sexo;
    private String numero_identi;
    private int tiempo_infectado;
    private VarianteBean variante;
    private int num_victima;
    private String tipo;
    private int cantidad;
    private float promedio;

    public float getPromedio() {
        return promedio;
    }

    public void setPromedio(float promedio) {
        this.promedio = promedio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
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

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getNumero_identi() {
        return numero_identi;
    }

    public void setNumero_identi(String numero_identi) {
        this.numero_identi = numero_identi;
    }

    public int getTiempo_infectado() {
        return tiempo_infectado;
    }

    public void setTiempo_infectado(int tiempo_infectado) {
        this.tiempo_infectado = tiempo_infectado;
    }

    public VarianteBean getVariante() {
        return variante;
    }

    public void setVariante(VarianteBean variante) {
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
