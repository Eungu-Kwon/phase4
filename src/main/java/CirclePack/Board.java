package CirclePack;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Scanner;
public class Board {
	
	public int id=0;
	public int cid;
	public int tid;
	public Date date;
	public String dateString;
	public String title;
	public String content;
	public String userId;
	public DBHelper db = DBHelper.getInstance();
	
	
	public Board(String cid, String tid, String id) {
		String query = "SELECT ID,BDATE,TITLE,CONTENT,USER_ID " + "FROM BOARD B " + "WHERE B.tid=" + tid + " AND B.cid="
	               + cid + "AND B.id="+ id;
		//System.out.println(query);
		ResultSet rs = db.runSql(query);
		ResultSetMetaData rsmd;
		try {
			while(rs.next()){
				this.id = rs.getInt(1);
				this.date = rs.getDate(2);
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm");
				dateString = simpleDateFormat.format(this.date);
				this.title = rs.getString(3);
				this.content = rs.getString(4);
				this.userId = rs.getString(5);
				this.cid = Integer.parseInt(cid);
				this.tid = Integer.parseInt(tid);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Board(String cid, String tid) {
		LocalDateTime now = LocalDateTime.now();
		this.cid = Integer.parseInt(cid);
		this.tid = Integer.parseInt(tid);
		id = getNewId();
		dateString = now.format(DateTimeFormatter.ofPattern("yyyy/MM/dd hh:mm"));
		//title, content, userId 는 set으로 받아옴
	}
	public String getDateString() {
		return dateString;
	}
	public void setDateString(String dateString) {
		this.dateString = dateString;
	}

	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
		
	public int getNewId() {
		int id = 0;
		ResultSet rs = null;

		try {
			String sql = "select max(id) from board where cid="+cid+" and tid="+tid;
			rs = db.runSql(sql);
			rs.next();
			id = rs.getInt(1);
			rs.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return id + 1;
	}
	
	public static String showBoardList(DBHelper db, int cid, int tid) {
		String query = "SELECT ID,BDATE,TITLE,CONTENT,USER_ID " + "FROM BOARD B " + "WHERE B.tid=" + tid + " AND B.cid="
	               + cid + "ORDER BY BDATE DESC";
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
