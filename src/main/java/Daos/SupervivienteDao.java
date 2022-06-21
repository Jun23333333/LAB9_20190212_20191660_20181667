package Daos;

import Beans.SupervivienteBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SupervivienteDao extends BaseDao{
    public ArrayList<SupervivienteBean> listar(){

        ArrayList<SupervivienteBean> listaSuper = new ArrayList<>();
        String sql = "select h.idHumano, h.nombre, h.apellido, h.sexo, h.peso,h.fuerza, concat(p.nombre,\" \",p.apellido) as pareja,  truncate(sum(ob.masa),2) as pesocargado\n" +
                "from humano h\n" +
                "left join humano p on h.idPareja=p.idHumano\n" +
                "left join objetoporhumano oxh on h.idHumano= oxh.idHumano\n" +
                "left join objeto ob on oxh.idObjeto= ob.idObjeto\n" +
                "where h.estado ='superviviente'\n" +
                "group by h.idHumano; ";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    SupervivienteBean p = new SupervivienteBean();
                    p.setNumero_identi(resultSet.getInt(1));
                    p.setNombre(resultSet.getString(3));
                    p.setApellido(resultSet.getString(2));
                    p.setSexo(resultSet.getString(4));
                    p.setPeso(resultSet.getDouble(5));
                    p.setFuerza(resultSet.getDouble(6));
                    p.setPareja(resultSet.getString(7));
                    //falta agregar el peso cargado que se calcula con el inventario
                    p.setCarga(resultSet.getDouble(8));
                    listaSuper.add(p);
                }
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return listar();
    }

    public void crear(String nombre, String apellido, int numero, double peso, double fuerza, int id_pareja){
        String sql="blanblabla values (?,?,?,?,?,?,?,?,?,?,?)";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,nombre);
            pstmt.setString(2,apellido);
            pstmt.setInt(3,numero);
            pstmt.setDouble(4,peso);
            pstmt.setDouble(5,fuerza);
            pstmt.setInt(6,id_pareja);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }
}
