package CirclePack;

public class CommentController {
	DBHelper db = DBHelper.getInstance();
	
	
	public int deleteProcess(String cid, String tid, String bid, String id) {
		String sql = "DELETE FROM COMMENTS WHERE cid = " + cid +" and tid = "+ tid + " and bid = " + bid+ " and id= "+ id;
		return db.updateSql(sql);
	}//아직안고침
	public int createProcess(Comment comment) {
		String sql="INSERT INTO COMMENTS VALUES("+comment.getId()+",TO_DATE('"+comment.getDateString()+"', 'yyyy/mm/dd HH24:MI'),'"+comment.getContent()+"',"+comment.getBid()+","+comment.getTid()+","+comment.getCid()+",'"+comment.getUserId()+"')";
		return db.updateSql(sql);
	}

	
}
