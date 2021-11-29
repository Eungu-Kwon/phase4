package CirclePack;
import java.sql.*;
public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String query = "select e.lname, e.minit, e.fname\r\n"
				+ "from employee e, project p, works_on w\r\n"
				+ "where e.salary > 20000 "+"\r\n"
				+ "and w.pno  = p.pnumber and w.essn = e.ssn" +" ORDER BY Lname ASC ";
		//System.out.println(query);
		DBHelper db = DBHelper.getInstance();
		ResultSet rs = db.runSql(query);
		System.out.println("<table border=\"1\">");
		ResultSetMetaData rsmd;
		try {
			rsmd = rs.getMetaData();
			int cnt = rsmd.getColumnCount();
			for(int i=1;i <= cnt; i++){
				System.out.println("<th>"+rsmd.getColumnName(i)+"</th>");
			}
			while(rs.next()){
				System.out.println("<tr>");
				System.out.println("<td>"+rs.getString(1)+"</td>");
				System.out.println("<td>"+rs.getString(2)+"</td>");
				System.out.println("<td>"+rs.getString(3)+"</td>");
				System.out.println("</tr>");
			}
			System.out.println("</table>");
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
