package Circle;
import java.sql.*;
import java.util.Scanner;
public class Board {
	
	public static String showBoard(DBHelper db, int tid, int cid) {
		String query = "SELECT ID,BDATE,TITLE,CONTENT,USER_ID " + "FROM BOARD B " + "WHERE B.tid=" + tid + " AND B.cid="
	               + cid + "ORDER BY BDATE DESC";
		//System.out.println(query);
		ResultSet rs = db.runSql(query);
		StringBuffer result = new StringBuffer();
		ResultSetMetaData rsmd;
		try {
			while(rs.next()){
				result.append("<div class=\"post\">");
				int id = rs.getInt(1);
				Date date = rs.getDate(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String userId = rs.getString(5);
				
				result.append("<h2 class=\"title\"><a href=\"#\">" + title+"</a></h2>");
				result.append("<p class=\"meta\"><span class=\"date\">"+ date.toString() + "</span><span class=\"posted\">Posted by <a href=\"#\">" +userId +"</a></span></p>");
				result.append("</div>");
			}
			
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
	}
}
