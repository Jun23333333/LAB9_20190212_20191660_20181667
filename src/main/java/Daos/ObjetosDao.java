package Daos;

import Beans.ObjetoBean;

import java.sql.*;
import java.util.ArrayList;

public class ObjetosDao extends BaseDao{
    public ArrayList<ObjetoBean> listar(){

        ArrayList<ObjetoBean> listaObjeto = new ArrayList<>();
        String sql = "";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql);) {
            while (resultSet.next()) {
                ObjetoBean p = new ObjetoBean();
                p.setNombre(resultSet.getString(1));
                p.setPeso(resultSet.getDouble(2));
                p.setTipo(resultSet.getString(3));
                p.setEfectividad_demo(resultSet.getDouble(4));
                p.setEfectividad_rapi(resultSet.getDouble(5));
                p.setEfectividad_nino(resultSet.getDouble(6));
                p.setEfectividad_normal(resultSet.getDouble(7));
                p.setEfectividad_otro(resultSet.getDouble(8));
                listaObjeto.add(p);
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return listaObjeto;
    }
    public void crear_vacuna(String nombre, double peso, double demo, double rapi, double nino, double normal, double otro){
        String sql= "balbal";


        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,nombre);
            pstmt.setDouble(2,peso);
            pstmt.setDouble(3,demo);
            pstmt.setDouble(4,rapi);
            pstmt.setDouble(5,nino);
            pstmt.setDouble(6,normal);
            pstmt.setDouble(7,otro);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }
    public void crear_objeto(String nombre, double peso){
        String sql= "balbal";


        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,nombre);
            pstmt.setDouble(2,peso);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }

    public ObjetoBean buscarPorNombre(String nombre) {
        ObjetoBean objetoBean = null;

        String sql= "balbal";


        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1, nombre);

            try (ResultSet rs = pstmt.executeQuery();) {

            if (rs.next()) {
                objetoBean = new ObjetoBean();
                objetoBean.setNombre(rs.getString(1));
                objetoBean.setPeso(rs.getDouble(2));
                objetoBean.setEfectividad_demo(rs.getDouble(3));
                objetoBean.setEfectividad_rapi(rs.getDouble(4));
                objetoBean.setEfectividad_nino(rs.getDouble(5));
                objetoBean.setEfectividad_normal(rs.getDouble(6));
                objetoBean.setEfectividad_otro(rs.getDouble(7));
            }
        }
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }

        return objetoBean;
    }

    public void editar_objeto(String nombre, double peso){
        String sql= "balbal";


        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,nombre);
            pstmt.setDouble(2,peso);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }

    public void editar_vacuna(String nombre, double peso, double demo, double rapi, double nino, double normal, double otro){
        String sql= "balbal";


        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,nombre);
            pstmt.setDouble(2,peso);
            pstmt.setDouble(3,demo);
            pstmt.setDouble(4,rapi);
            pstmt.setDouble(5,nino);
            pstmt.setDouble(6,normal);
            pstmt.setDouble(7,otro);
            pstmt.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
    }


}
