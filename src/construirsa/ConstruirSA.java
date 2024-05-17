 
package construirsa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class ConstruirSA {

    public static void main(String[] args) throws ClassNotFoundException, SQLException{
        Connection con;
        
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/obrador2", "root", "");
            JOptionPane.showMessageDialog(null,"Conexion establecida");
       //INSERTAR 3 EMPLEADOS
            PreparedStatement ps = con.prepareStatement
            ("INSERT INTO `empleado`(`Dni`, `Apellido`, `Nombre`, `Acceso`, `Estado`) "
                     + "VALUES (55321555,'Valdez','Ramón',1,1),"
                     + "(45874932, 'Meza', 'Florinda', 2, true),"
                     + "(5553544, 'Fernández', 'Angelines', 3, false )");
            ps.execute();   
        //INSERTAR 2 HERRAMIENTAS
            ps = con.prepareStatement("INSERT INTO `herramienta`(`Nombre`,"
                        + " `Stock`, `Descripcion`, `Estado`)"
                        + "VALUES ('torno',5,'torno eléctrico de carpintería',true),"
                        + "('martillo', 120, 'una maza, grande y pesada', false)");
            ps.execute();
        //CONSULTA DE HERRAMIENTAS CON STOCK >10
            ps = con.prepareStatement("SELECT * FROM `herramienta` WHERE stock>10");
            ResultSet rs =ps.executeQuery();
        
            while(rs.next()){ //recorremos el resultset
                int idHerramienta = rs.getInt("Id_Herramienta");
                    String nombre = rs.getString("Nombre");
                    int stock = rs.getInt("Stock");
                    String descripcion = rs.getString("Descripcion");
                    boolean estado = rs.getBoolean("Estado");


                    System.out.println("Id_Herramienta: "+idHerramienta);
                    System.out.println("Nombre: "+ nombre);
                    System.out.println("Stock: "+stock);
                    System.out.println("Descripcion: "+descripcion);
                    System.out.println("Estado: "+estado);
             }
        //UPDATE DEL ESTADO DE DON RAMON 
             ps = con.prepareStatement("UPDATE `empleado` SET `Estado`=false WHERE `Dni` = 55321555");    
             ps.execute();    
        
        
        //Agregamos update opcional aprendido del ejemplo de Carlos para estudiarlo entre los miembros del grupo
            int id=0;
        //El LIMIT nos permite limitar el número de filas
            String query="SELECT IdEmpleado FROM empleado ORDER BY IdEmpleado LIMIT 1";
        //El ORDERBY los ordena de menor a mayor por lo que tendríamos el primer
        //empleado por numero de id
            ps= con.prepareStatement(query);
            rs=ps.executeQuery();

            if(rs.next()){//se ejecutará si tiene un elemento y solo una vez
                id=rs.getInt("Id_Empleado"); //acá se asigna el primer empleado
        }
         //se consulta para actualizar el estado sin conocer el id del empleado
            query = "UPDATE empleado SET estado = false WHERE IdEmpleado = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);//se selecciona el comodin y se le asigna el id
            
            ps.execute();
        }
        
        catch(SQLException e){
             
             JOptionPane.showMessageDialog(null,e + "Conexion no establecida por error de SQL");
        }
        catch(ClassNotFoundException e){
            JOptionPane.showMessageDialog(null,e + "Conexion no establecida por error de clase");
        }
    }
}
