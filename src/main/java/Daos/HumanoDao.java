package Daos;

import Beans.HumanoBean;

import java.sql.*;
import java.util.ArrayList;

public class HumanoDao extends BaseDao{
    public ArrayList<HumanoBean> listarHumano(){

        //String rol="Humano";
        ArrayList<HumanoBean> listaHumano = new ArrayList<>();
        String sql = " select idHumano, nombre, apellido, sexo, estado from humano";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {
            while (rs.next()) {
                HumanoBean p = new HumanoBean();
                p.setNumero_identi(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setApellido(rs.getString(3));
                p.setSexo(rs.getString(4));
                p.setEstado(rs.getString(5));
                listaHumano.add(p);
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return listaHumano;
    }
}
