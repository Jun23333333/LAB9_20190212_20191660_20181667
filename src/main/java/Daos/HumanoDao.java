package Daos;

import Beans.HumanoBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class HumanoDao extends BaseDao{
    public ArrayList<HumanoBean> listaHumano(){

        //String rol="Humano";
        ArrayList<HumanoBean> listaHumano = new ArrayList<>();
        String sql = " select idHumano, nombre, apellido, sexo, estado from humano";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    HumanoBean p = new HumanoBean();
                    p.setNumero_identi(resultSet.getInt(1));
                    p.setNombre(resultSet.getString(2));
                    p.setApellido(resultSet.getString(3));
                    p.setSexo(resultSet.getString(4));
                    p.setEstado(resultSet.getString(5));
                    listaHumano.add(p);
                }
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return listaHumano;
    }
}
