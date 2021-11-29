package Circle;
import java.sql.*;
public class Tab {

	public static String showTabList(DBHelper db, int cid) {
		String query = "select tname,id\r\n"
				+ "from tab_menu\r\n"
				+ "where cid = " + cid;
		ResultSet rs = db.runSql(query);
		StringBuffer result = new StringBuffer();
		try {
			while(rs.next()){
				result.append("<li><a href=\"#\">"); //이부분 아이디 넘겨줘야함
				String tab_name= rs.getString(1);
				int id = rs.getInt(2);   // 아직
				result.append(tab_name);
				result.append("</a></li>");
				System.out.println(tab_name);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
	}
}
