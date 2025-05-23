import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCConnection {

    static final String DB_URL = "jdbc:oracle:thin:@//localhost:1521/XE";
    static final String USER = "system";
    static final String PASS = "oracle123";  

    public static void main(String[] args) {
        Connection connection = null;
        Statement statement = null;
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected to the Oracle database successfully.");

            statement = connection.createStatement();
            String sql = "SELECT STUDENT_ID, FIRST_NAME, LAST_NAME FROM STUDENTS";
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int studentId = resultSet.getInt("STUDENT_ID");
                String firstName = resultSet.getString("FIRST_NAME");
                String lastName = resultSet.getString("LAST_NAME");

                System.out.printf("Student ID: %d, Name: %s %s%n", studentId, firstName, lastName);
            }

            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
