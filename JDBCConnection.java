import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//java -cp ".;C:\\Users\\BCL\\Downloads\\ojdbc17.jar" JDBCConnection
public class JDBCConnection {

    static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    static final String USER = "system";
    static final String PASS = "manager";

    public static void main(String[] args) {
        Connection connection = null;
        Statement statement = null;
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected to the Oracle database successfully.");

            statement = connection.createStatement();
            String sql = "SELECT s_id, name FROM student";
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int s_id = resultSet.getInt("s_id");
                String name = resultSet.getString("name");
                System.out.printf("Student ID: %d, Name: %s\n", s_id, name);
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
