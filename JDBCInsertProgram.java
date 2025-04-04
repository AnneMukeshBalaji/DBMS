import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBCInsertProgram {

    static final String DB_URL = "jdbc:oracle:thin:@//localhost:1521/XE";
    static final String USER = "system";
    static final String PASS = "oracle123"; 

    public static void main(String[] args) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected to the Oracle database successfully.");
            String sql = "INSERT INTO STUDENTS (STUDENT_ID, FIRST_NAME, LAST_NAME, EMAIL) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, 511);                      
            preparedStatement.setString(2, "Luffy");               
            preparedStatement.setString(3, "Doe");                 
            preparedStatement.setString(4, "luffydoe@gmail.com"); 

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("A new record was inserted successfully!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
