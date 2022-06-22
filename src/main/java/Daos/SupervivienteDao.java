package Daos;
import java.util.Random;
import Beans.HumanoBean;
import Beans.SupervivienteBean;

import java.sql.*;
import java.util.ArrayList;

public class SupervivienteDao extends BaseDao{
    public ArrayList<SupervivienteBean> listar(){

        ArrayList<SupervivienteBean> listaSuper = new ArrayList<>();
        String sql = "select h.idHumano, h.nombre, h.apellido, h.sexo, h.peso,h.fuerza, p.nombre,p.apellido,  truncate(sum(ob.masa),2) as pesocargado\n" +
                "from humano h\n" +
                "left join humano p on h.idPareja=p.idHumano\n" +
                "left join objetoporhumano oxh on h.idHumano= oxh.idHumano\n" +
                "left join objeto ob on oxh.idObjeto= ob.idObjeto\n" +
                "where h.estado ='superviviente'\n" +
                "group by h.idHumano; ";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql);) {
            while (resultSet.next()) {
                SupervivienteBean p = new SupervivienteBean();
                p.setNumero_identi(resultSet.getString(1));
                p.setNombre(resultSet.getString(2));
                p.setApellido(resultSet.getString(3));
                p.setSexo(resultSet.getString(4));
                p.setPeso(resultSet.getDouble(5));
                p.setFuerza(resultSet.getDouble(6));
                p.setParejaNombre(resultSet.getString(7));
                p.setParejaApellido(resultSet.getString(8));
                //falta agregar el peso cargado que se calcula con el inventario
                p.setCarga(resultSet.getDouble(9));
                listaSuper.add(p);
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return listaSuper;
    }

    public void crear(String nombre, String apellido, String sexo, double peso, double fuerza){

        long max=99999999999L;
        long min=10000000000L;

        long numeroaleatorioL = (long)(Math.random()*(max-min+1)+min);
        //Random random = new Random();
        //long numeroaleatorioL = random.nextLong(max - min+1) + min;
        String numero0 =String.valueOf(numeroaleatorioL);

        String sql="insert into humano (idHumano,nombre,apellido,estado,sexo,peso,fuerza)\n" +
                "values\n" +
                "(?, ?, ?,'superviviente', ?,?,?)";


        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,numero0);
            pstmt.setString(2,nombre);
            pstmt.setString(3,apellido);
            pstmt.setString(4,sexo);
            pstmt.setDouble(5,peso);
            pstmt.setDouble(6,fuerza);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }
    public SupervivienteBean obtenerSuperviviente(String numero_identi) {

        SupervivienteBean p = null;

        String sql = "select h.idHumano, h.nombre, h.apellido, h.sexo, h.peso,h.fuerza, p.nombre,p.apellido, h.idPareja,  truncate(sum(ob.masa),2)\n" +
                "from humano h\n" +
                "left join humano p on h.idPareja=p.idHumano\n" +
                "left join objetoporhumano oxh on h.idHumano= oxh.idHumano\n" +
                "left join objeto ob on oxh.idObjeto= ob.idObjeto\n" +
                "where h.estado ='superviviente' and h.idHumano = ?\n" +
                "group by h.idHumano " ;

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, numero_identi);

            try (ResultSet rs = pstmt.executeQuery();) {
                p = new SupervivienteBean();
                p.setNumero_identi(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setApellido(rs.getString(3));
                p.setSexo(rs.getString(4));
                p.setPeso(rs.getDouble(5));
                p.setFuerza(rs.getDouble(6));
                p.setParejaNombre(rs.getString(7));
                p.setParejaApellido(rs.getString(8));
                p.setIdPareja(rs.getString(9));
                p.setCarga(rs.getDouble(10));
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión obteneter super!");
            e.printStackTrace();
        }
        return p;
    }
    public void borrarSuperviviente(String numero_identi) {
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("DELETE FROM humano WHERE idHumano = ?");) {

            pstmt.setString(1, numero_identi);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    public void actualizarSuperviviente(SupervivienteBean superviviente) {
        String sql = "update humano set nombre = ?, peso=?, fuerza=?, idPareja= ?\n" +
                "where idhumano=?;";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1, superviviente.getNombre());
            pstmt.setDouble(2, superviviente.getPeso());
            pstmt.setDouble(3, superviviente.getFuerza());
            pstmt.setString(4, superviviente.getIdPareja());
            pstmt.setString(5, superviviente.getNumero_identi());
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Hubo un error en la conexión obteneter actualizar!");
            ex.printStackTrace();
        }
    }
}
