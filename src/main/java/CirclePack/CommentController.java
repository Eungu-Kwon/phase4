package CirclePack;

public class CommentController {
	DBHelper db = DBHelper.getInstance();
	
	
	public int deleteProcess(int cid, int tid, int bid,int id) {
		String sql = "DELETE FROM COMMENTS WHERE cid = " + cid +" and tid = "+ tid+" and bid = "+bid + " and id = " + id;
		return db.updateSql(sql);
	}//아직안고침
	public int createProcess(Comment comment) {
		String sql="INSERT INTO COMMENTS VALUES("+comment.getId()+",TO_DATE('"+comment.getDateString()+"', 'yyyy/mm/dd HH24:MI'),'"+comment.getContent()+"',"+comment.getBid()+","+comment.getTid()+","+comment.getCid()+",'"+comment.getUserId()+"')";
		return db.updateSql(sql);
	}
	public int updateProcess(int cid, int tid, int bid, Board board) {
		String sql ="UPDATE BOARD SET content='"+board.getContent()+"', title = '"+ board.getTitle() +"' where user_id='"+board.getUserId()+"' and tid="+tid+" AND cid="+tid+" AND id="+bid;
		return db.updateSql(sql);
	}
	
}
