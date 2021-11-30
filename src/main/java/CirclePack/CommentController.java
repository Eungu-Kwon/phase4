package CirclePack;

public class CommentController {
	DBHelper db = DBHelper.getInstance();
	
	
	public int deleteProcess(int cid, int tid, int bid) {
		String sql = "DELETE FROM BOARD WHERE cid = " + cid +" and tid = "+ tid + " and id = " + bid;
		return db.updateSql(sql);
	}//아직안고침
	//public int createProcess(Comment comment) {
		//String sql="INSERT INTO COMMENT VALUES("+board.getId()+",TO_DATE('"+board.getDateString()+"', 'yyyy/mm/dd HH24:MI'),'"+board.getTitle()+"','"+board.getContent()+"',"+board.getTid()+","+board.getCid()+",'"+board.getUserId()+"')";
		
		//return db.updateSql(sql);
	//}
	public int updateProcess(int cid, int tid, int bid, Board board) {
		String sql ="UPDATE BOARD SET content='"+board.getContent()+"', title = '"+ board.getTitle() +"' where user_id='"+board.getUserId()+"' and tid="+tid+" AND cid="+tid+" AND id="+bid;
		return db.updateSql(sql);
	}
	
}
