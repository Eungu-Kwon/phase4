package CirclePack;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Comment {
	
	DBHelper db = new DBHelper();
	int id;
	Date date;
	String dateString;


	String content;
	int	bid;
	int tid;
	int cid;
	String userId;
	
	public Comment(DBHelper db, int cid, int tid, int bid, int id) {
		String query = "SELECT ID,CDate,Content,USER_ID " + "FROM Comments C " + "WHERE C.tid=" + tid + " AND C.cid="
	               + cid + "AND C.bid="+ bid+ " and C.id = "+id;
		//System.out.println(query);
		ResultSet rs = db.runSql(query);
		ResultSetMetaData rsmd;
		try {
			while(rs.next()){
				this.id = rs.getInt(1);
				this.date = rs.getDate(2);
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm");
				dateString = simpleDateFormat.format(this.date);
				this.content = rs.getString(3);
				this.userId = rs.getString(4);
				this.cid = cid;
				this.tid = tid;
				this.bid = bid;
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	public Comment(String cid, String tid, String bid) {
		LocalDateTime now = LocalDateTime.now();
		this.cid = Integer.parseInt(cid);
		this.tid = Integer.parseInt(tid);
		this.bid = Integer.parseInt(bid);
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
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date cdate) {
		date = cdate;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getBid() {
		return bid;
	}


	public void setBid(int bid) {
		this.bid = bid;
	}


	public int getTid() {
		return tid;
	}


	public void setTid(int tid) {
		this.tid = tid;
	}


	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	
	
	public int getNewId() {
		int id = 0;
		ResultSet rs = null;

		try {
			String sql = "select max(id) from comments where cid="+cid+" and tid="+tid+" and bid="+bid;
			rs = db.runSql(sql);
			rs.next();
			id = rs.getInt(1);
			rs.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return id + 1;
	}
	
	public static String getCommentListHTML(DBHelper db, int tid, int cid, int bid) {
		String query = "SELECT ID,CDate,Content,USER_ID " + "FROM Comments C " + "WHERE C.tid=" + tid + " AND C.cid="
	               + cid + "AND C.bid="+ bid + "ORDER BY CDATE DESC";
		//System.out.println(query);
		ResultSet rs = db.runSql(query);
		StringBuffer result = new StringBuffer();
		ResultSetMetaData rsmd;
		try {
			while(rs.next()){
				result.append("<li class=\"CommentItem\">\r\n"
						+ "                            <div class=\"comment_area\">\r\n"
						+ "                                <p class=\"comment_thumb\">\r\n"
						+ "                                    <img src=\"https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png?type=c77_77\" alt=\"프로필 사진\" width=\"36\" height=\"36\">\r\n"
						+ "                                </p> \r\n"
						+ "                                <div class=\"comment_box\">\r\n"
						+ "                                    <div class=\"comment_nick_box\">\r\n"
						);
				int id = rs.getInt(1);
				Date date = rs.getDate(2);
				String content = rs.getString(3);
				String userId = rs.getString(4);

				result.append("                                        <a>"+userId+"</a>\r\n"
						+ "                                    </div>\r\n"
						+ "                                    <div class=\"comment_text_box\">\r\n"
						+ "                                        <span class=\"text_comment\">"+content+"</span>\r\n"
						+ "                                    </div>\r\n"
						+ "                                    <div class=\"comment_info_box\">\r\n"
						+ "                                        <span class=\"comment_info_date\">"+date.toString()+"</span>\r\n"
						+ "                                        <button type=\"button\" class=\"btn btn-secondary\" onclick = \"location.href = 'comment_delete_process.jsp?cid="+cid+"&tid="+tid+"&bid="+bid+"&id="+id+"' \">delete</button>\r\n"
						+ "                                    </div>\r\n"
						+ "                                </div>\r\n"
						+ "                            </div>\r\n"
						+ "                        </li>");
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
	}
}
