package Daos;

import Beans.VarianteBean;
import Beans.VirusBean;
import Beans.ZombieBean;

import java.sql.*;
import java.util.ArrayList;

public class ZombiesDao extends BaseDao{
    public ArrayList<ZombieBean> listarZombie(){
        ArrayList<ZombieBean> zombies = new ArrayList<>();
        String sql = "select zo.idHumano, zo.tiempoInfectado, va.nombre, zo.numeroVictimas, zo.tipo from Humano zo\n" +
                    "inner join variante va on zo.idVariante = va.idVariante where zo.estado = 'zombie'";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            while (resultSet.next()) {
                ZombieBean zombie = new ZombieBean();
                zombie.setNumero_identi(resultSet.getString(1));
                zombie.setTiempo_infectado(resultSet.getInt(2));
                VarianteBean varianteBean = new VarianteBean();
                varianteBean.setNombre(resultSet.getString(3));
                zombie.setVariante(varianteBean);
                zombie.setNum_victima(resultSet.getInt(4));
                zombie.setTipo(resultSet.getString(5));
                zombies.add(zombie);
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return zombies;
    }

    public ArrayList<ZombieBean> listarTipoZombie(){
        ArrayList<ZombieBean> zombies = new ArrayList<>();
        String sql = "select zo.tipo from humano zo where estado = 'zombie' group by zo.tipo";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            while (resultSet.next()) {
                ZombieBean zombie = new ZombieBean();
                zombie.setTipo(resultSet.getString(1));
                zombies.add(zombie);
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return zombies;
    }

    public boolean existeTiempo(String id){
        boolean existe = false;
        String sql = "select tiempoInfectado from Humano where tiempoInfectado is not null and idHumano = ? and estado = 'zombie'";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, id);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    existe=true;
                }
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return existe;
    }

    public void calcularTiempoInfectado(String id, String fecha){

        if(existeTiempo(id)){
            String sql = "UPDATE Humano SET tiempoInfectado = TIMESTAMPDIFF(hour, ?, now()) where idHumano = ?";
            try (Connection conn = this.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql);) {
                pstmt.setString(1,fecha);
                pstmt.setString(2, id);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
        }else{
            String sql = "insert into Humano (idHumano, tiempoInfectado) values (?,TIMESTAMPDIFF(hour, ?, now()))";
            try (Connection conn = this.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql);) {
                pstmt.setString(1,id);
                pstmt.setString(2, fecha);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }

        }

    }

   public ArrayList<VarianteBean> listarVariante(){
        ArrayList<VarianteBean> variantes = new ArrayList<>();
        String sql = "select idVariante, nombre from Variante where nombre is not null";
       try (Connection conn = this.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet resultSet = stmt.executeQuery(sql)) {
           while (resultSet.next()) {
               VarianteBean variante = new VarianteBean();
               variante.setId(resultSet.getInt(1));
               variante.setNombre(resultSet.getString(2));
               variantes.add(variante);
           }


       } catch (SQLException e) {
           System.out.println("Hubo un error en la conexión!");
           e.printStackTrace();
       }
        return variantes;
   }


    public ArrayList<VirusBean> listarVirus(){
        ArrayList<VirusBean> viruss = new ArrayList<>();
        String sql = "select idVirus, nombre from Virus where nombre is not null";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            while (resultSet.next()) {
                VirusBean virus = new VirusBean();
                virus.setId(resultSet.getInt(1));
                virus.setVirus(resultSet.getString(2));
                viruss.add(virus);
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return viruss;
    }

    public void agregarZombie(String id, int tiempo, int idV, String tipo, String sexo){
        String sql = "insert into Humano (idHumano,estado, tiempoInfectado, idVariante, tipo, numeroVictimas, sexo) values (?,'zombie',?,?,?,0,?)";
        if(!existeZombie(id)){
            try (Connection conn = this.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1,id);
                pstmt.setInt(2,tiempo);
                pstmt.setInt(3,idV);
                pstmt.setString(4,tipo);
                pstmt.setString(5, sexo);
                 pstmt.executeUpdate();
            }

            catch( SQLException e){
                System.out.println("Hubo un error en la conexión!");
                e.printStackTrace();
            }
        }
    }

    public boolean existeZombie(String id){
        boolean existe = false;
        String sql = "select * from Humano where idHumano = ? and estado = 'zombie'";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, id);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    existe=true;
                }
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return existe;
    }

    public ZombieBean zombiePorSexo(String sexo){
        ZombieBean zombie = null;
        String sql = "select sexo, count(idHumano) from Humano  where sexo = ? and estado = 'zombie' group by sexo";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1,sexo);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    zombie = new ZombieBean();
                    zombie.setSexo(resultSet.getString(1));
                    zombie.setCantidad(resultSet.getInt(2));
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return zombie;
    }

    public VarianteBean varianteMasComun(){
        VarianteBean variante = null;
        String sql = "select t1.´nombre´, max(t1.´piscis´) from (select va.nombre as ´nombre´, count(zo.idHumano) as ´piscis´ from Humano zo inner join Variante va on zo.idVariante = va.idVariante group by zo.idVariante) t1";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {
            if (resultSet.next()) {
                variante = new VarianteBean();
                variante.setNombre(resultSet.getString(1));
                variante.setComun(resultSet.getInt(2));
            }


        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return  variante;
    }

    public ZombieBean promedioVictimasporZombie(String tipo){
        ZombieBean zombie = null;
        String sql = "select truncate(avg(zo.numeroVictimas),2), zo.tipo from Humano zo where zo.tipo = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1,tipo);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    zombie = new ZombieBean();
                    zombie.setPromedio(resultSet.getFloat(1));
                    zombie.setTipo(resultSet.getString(2));
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return zombie;
    }

}
