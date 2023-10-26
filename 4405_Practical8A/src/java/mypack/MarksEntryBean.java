package mypack;

import java.sql.*;
import javax.ejb.Stateful;

@Stateful
public class MarksEntryBean {

    public void addMarks(String sname, int m1, int m2, int m3) {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/mydb", "root", "root");
            Statement st = con.createStatement();
            String query = "insert into marks(sname,marks1,marks2,marks3) values('" + sname + "'  ," +
                    m1 + "  ," + m2 + "  ," + m3 + ")";
            st.executeUpdate(query);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
