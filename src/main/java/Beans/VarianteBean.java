package Beans;

public class VarianteBean {
    private int id;
    private String nombre;
    private VirusBean virus;
    private int comun;

    public int getComun() {
        return comun;
    }

    public void setComun(int comun) {
        this.comun = comun;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public VirusBean getVirus() {
        return virus;
    }

    public void setVirus(VirusBean virus) {
        this.virus = virus;
    }
}
