package Daos;

import Beans.VarianteBean;
import Beans.VirusBean;
import Beans.ZombieBean;

import java.sql.*;
import java.util.ArrayList;

public class VirusDao extends BaseDao{
    public ArrayList<VirusBean> listarVirus(){
        ArrayList<VirusBean> viruss = new ArrayList<>();
        String sql = "select vi.idVirus, vi.nombre, va.idVariante, va.nombre from virus vi, variante va\n" +
                "where vi.idVirus = va.idVirus";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            while (resultSet.next()) {
                VirusBean virus = new VirusBean();
                virus.setId(resultSet.getInt(1));
                virus.setVirus(resultSet.getString(2));
                VarianteBean variante = new VarianteBean();
                variante.setId(resultSet.getInt(3));
                variante.setNombre(resultSet.getString(4));
                virus.setVariante(variante);
                viruss.add(virus);
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return viruss;
    }

    public ArrayList<VirusBean> casosEncontrados(){
        ArrayList<VirusBean> casos = new ArrayList<>();
        String sql = "select count(zo.idHumano), va.idVariante, vi.idvirus, va.nombre from humano zo\n" +
                "inner join variante va on zo.idVariante = va.idVariante\n" +
                "inner join virus vi on vi.idVirus = va.idVirus \n" +
                "group by zo.idVariante";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            while (resultSet.next()) {
                    VirusBean virus = new VirusBean();
                    virus.setId(resultSet.getInt(3));
                    virus.setCaso(resultSet.getInt(1));
                    VarianteBean variante = new VarianteBean();
                    variante.setId(resultSet.getInt(2));
                    variante.setNombre(resultSet.getString(4));
                    virus.setVariante(variante);
                    casos.add(virus);
                }
        }catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return casos;
    }



    public Integer virusActivos(){
        int activo = 0;
        String sql = "select count(vi.idVirus) from virus vi\n" +
                "where  vi.activo = 'si'" ;
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            if (resultSet.next()) {
              activo = resultSet.getInt(1);
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return activo;
    }


    public boolean existeVirus(String virus){
        boolean existe = false;
        String sql = "select * from virus where nombre = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, virus);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    existe = true;
                }
            }catch (NullPointerException f){
                System.out.println("El virus ya existe con ese nombre!");
                f.printStackTrace();
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return existe;
    }
    public void anadirNuevaVariante(String virus,String variante){
        if(!existeVirus(virus)){
            String sql = "insert into virus (nombre, activo) values (?,'si')";
            try (Connection conn = this.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1,virus);
                pstmt.executeUpdate();
            }

            catch( SQLException e){
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
            String sql1 = "insert into variante (nombre,idVirus) values (?,(select max(vi.idVirus) from virus vi))";
            try (Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql1)) {
                pstmt.setString(1,variante);
                pstmt.executeUpdate();
            }

            catch( SQLException e){
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
        }
    }


    public boolean varianteRestante(int id){
        boolean existe = false;
        String sql = "select * from variante where idVirus = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, id);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    existe = true;
                }
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return existe;
    }

    public void eliminarZombie(int idVariante,  int idVirus){
        String sql = "Delete from humano where idVariante = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1,idVariante);
            pstmt.executeUpdate();
        }

        catch( SQLException e){
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        String sql1 = "DELETE FROM variante where idVariante = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql1)) {
            pstmt.setInt(1, idVariante);
            pstmt.executeUpdate();
        }

        catch( SQLException e){
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        if(!varianteRestante(idVirus)){
            String sql2 = "update  virus set activo = 'no' where idVirus = ?";
            try (Connection conn = this.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql2)) {
                pstmt.setInt(1, idVirus);
                pstmt.executeUpdate();
            }

            catch( SQLException e){
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
        }
    }






}
