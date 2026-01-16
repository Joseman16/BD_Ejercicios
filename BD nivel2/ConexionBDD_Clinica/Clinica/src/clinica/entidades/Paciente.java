
package clinica.entidades;

import java.util.Date;

public class Paciente {
    private String cedula;
    private String nombre;
    private String telefono;
    private Date fecha_nacimiento;
    private boolean estado;
    
    public Paciente(){
        
    }
    
    public Paciente(String cedula, String nombre, String telefono, Date fecha_nacimiento, boolean estado){
        this.cedula = cedula;
        this.nombre = nombre;
        this.telefono = telefono;
        this.fecha_nacimiento = fecha_nacimiento;
        this.estado = estado;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Paciente{" + "cedula=" + cedula + ", nombre=" + nombre + ", telefono=" + telefono + ", fecha_nacimiento=" + fecha_nacimiento + ", estado=" + estado + '}';
    }
}
