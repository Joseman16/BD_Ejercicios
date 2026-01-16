/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clinica.BDD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import clinica.entidades.Paciente;
import clinica.excepcion.JosException;
import clinica.utils.ConexionBDD;
import java.util.Date;

/**
 *
 * @author USER
 */
public class PacienteBDD {
    public ArrayList<Paciente> recuperar() throws JosException{
        ArrayList<Paciente> pacientes = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try{
            con = ConexionBDD.obtenerConexion();
            ps = con.prepareStatement("SELECT cedula, nombres, telefono, fecha_nacimiento, estado FROM paciente");
            rs = ps.executeQuery();
            while(rs.next()){
               String cedula = rs.getString("cedula");
               String nombre = rs.getString("nombres");
               String telefono = rs.getString("telefono");
               Date fecha_na = rs.getDate("fecha_nacimiento");
               boolean estado = rs.getBoolean("estado");
               
               Paciente pa = new Paciente(cedula, nombre, telefono, fecha_na, estado);
               pacientes.add(pa);
            }  
            
        }catch(JosException e){
            e.printStackTrace();
            throw e;
        }catch(SQLException e){
            e.printStackTrace();
            throw new JosException("Erroa al consultar paciente, Detalles: "+e.getLocalizedMessage());
        }finally{
            if(con!= null){
                try{
                    con.close();
                }catch(SQLException e){
                    e.printStackTrace();
                }
            }
        }
        
        return pacientes;
    }
    
    public void registrarPaciente (Paciente paciente) throws JosException{
        Connection con = null;
        PreparedStatement ps = null;
        
        
        try{
            con = ConexionBDD.obtenerConexion();
            ps = con.prepareStatement("INSERT INTO paciente (cedula, nombres, telefono, fecha_nacimiento, estado) "
                    + "VALUES (?,?,?,?,?)");
            ps.setString(1, paciente.getCedula());
            ps.setString(2, paciente.getNombre());
            ps.setString(3, paciente.getTelefono());
            
            java.util.Date utilDate = paciente.getFecha_nacimiento();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            
            ps.setDate(4, sqlDate);
            ps.setBoolean(5, paciente.isEstado());
            ps.executeQuery();
        }catch(JosException e){
            e.printStackTrace();
            throw e;
        }catch(SQLException e){
            e.printStackTrace();
            throw new JosException("Error al rgistrar paciente: "+e.getLocalizedMessage());
        }finally{
            if(con!=null){
                try{
                    con.close();
                }catch(SQLException e){
                    e.printStackTrace();
                }
            }
        }
        
    }
}
