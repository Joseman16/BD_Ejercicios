
package clinica;

import clinica.BDD.PacienteBDD;
import clinica.entidades.Paciente;
import clinica.excepcion.JosException;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

public class Main {

    public static void main(String[] args) throws JosException {
        PacienteBDD pa = new PacienteBDD();
        
        Calendar calendario = Calendar.getInstance();
        calendario.set(2001, Calendar.NOVEMBER, 17);

        Date fechaNacimiento = calendario.getTime();
        
        Paciente paciente = new Paciente("1799223312","Hugo","0912123131",(Date)fechaNacimiento,true);
        
        //pa.registrarPaciente(paciente);
        
        for(int i = 0; i<pa.recuperar().size(); i++){
            System.out.println(pa.recuperar().get(i));
        }
        
    }
    
}
