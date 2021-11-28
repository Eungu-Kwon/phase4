package CirclePack;
import java.sql.*;
import java.util.Scanner;
public class Board {
	
	public int id=0;
	public Date date;
	public String title;
	public String content;
	public String userId;
	
	
	public Board(DBHelper db, String cid, String tid, String id) {
		String query = "SELECT ID,BDATE,TITLE,CONTENT,USER_ID " + "FROM BOARD B " + "WHERE B.tid=" + tid + " AND B.cid="
	               + cid + "AND B.id="+ id;
		//System.out.println(query);
		ResultSet rs = db.runSql(query);
		ResultSetMetaData rsmd;
		try {
			while(rs.next()){

				this.id = rs.getInt(1);
				this.date = rs.getDate(2);
				this.title = rs.getString(3);
				this.content = rs.getString(4);
				this.userId = rs.getString(5);

			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public Date getDate() {
		return date;
	}
	public String getUserId() {
		return userId;
	}
	public int getId() {
		return id;
	}
		
	
	
	public static String showBoardList(DBHelper db, int tid, int cid) {
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
				
				result.append("<h2 class=\"title\"><a href=\"board_page.jsp?cid="+cid+"&tid="+tid+"&id="+id+"\">" + title+"</a></h2>");
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
