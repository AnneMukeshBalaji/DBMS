import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBCDeleteProgram {

    static final String DB_URL = "jdbc:oracle:thin:@//localhost:1521/XE";
    static final String USER = "system";
    static final String PASS = "oracle123"; 

    public static void main(String[] args) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected to the database successfully.");
            String sql = "DELETE FROM STUDENTS WHERE STUDENT_ID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, 511);
            int rowsDeleted = preparedStatement.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("The record was deleted successfully!");
            } else {
                System.out.println("No record found with the specified ID.");
            }
        } catch (SQLException | ClassNotFoundException e) {
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
