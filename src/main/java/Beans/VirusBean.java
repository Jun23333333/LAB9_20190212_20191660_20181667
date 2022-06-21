package Beans;

public class VirusBean {
    private int id;
    private String virus;
    private int caso;
    private VarianteBean variante;
    private String activo;

    public VarianteBean getVariante() {
        return variante;
    }

    public void setVariante(VarianteBean variante) {
        this.variante = variante;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVirus() {
        return virus;
    }

    public void setVirus(String virus) {
        this.virus = virus;
    }

    public int getCaso() {
        return caso;
    }

    public void setCaso(int caso) {
        this.caso = caso;
    }
}
