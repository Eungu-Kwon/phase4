package CirclePack;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Date;

public class Comment {
	
	
	
	public static String getCommentListHTML(DBHelper db, int tid, int cid, int bid) {
		String query = "select cdate, content, user_id\r\n"
				+ "from comments\r\n"
				+ "where cid = "+cid+" and tid = "+tid+" and bid ="+ bid 
	             + " ORDER BY CDATE DESC";
		System.out.println(query);
		ResultSet rs = db.runSql(query);
		StringBuffer result = new StringBuffer();
		ResultSetMetaData rsmd;
		try {
			while(rs.next()){
			
				Date date = rs.getDate(1);
				String content = rs.getString(2);
				String userId = rs.getString(3);
				result.append("<li class=\"CommentItem\">\r\n"
						+ "                            <div class=\"comment_area\">\r\n"
						+ "                                <p class=\"comment_thumb\">\r\n"
						+ "                                    <img src=\"https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png?type=c77_77\" alt=\"프로필 사진\" width=\"36\" height=\"36\">\r\n"
						+ "                                </p> \r\n"
						+ "                                <div class=\"comment_box\">\r\n"
						+ "                                    <div class=\"comment_nick_box\">\r\n"
						+  String.format("<a>%s</a>", userId)
						+ "                                    </div>\r\n"
						+ "                                    <div class=\"comment_text_box\">\r\n"
						+ "                                        <span class=\"text_comment\">"+content +"</span>\r\n"
						+ "                                    </div>\r\n"
						+ "                                    <div class=\"comment_info_box\">\r\n"
						+ "                                        <span class=\"comment_info_date\">"+date.toString()+"</span>\r\n"
						+ "                                        <button type=\"button\" class=\"btn btn-secondary\">modify</button>\r\n"
						+ "                                        <button type=\"button\" class=\"btn btn-secondary\">delete</button>\r\n"
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
