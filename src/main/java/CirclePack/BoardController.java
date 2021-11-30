package CirclePack;

public class BoardController {
	
	DBHelper db = DBHelper.getInstance();
	
	public int deleteProcess(int cid, int tid, int bid) {
		String sql = "DELETE FROM BOARD WHERE cid = " + cid +" and tid = "+ tid + " and id = " + bid;
		return db.updateSql(sql);
	}
	public int createProcess(Board board) {
		
		
		String sql="INSERT INTO BOARD VALUES("+board.getId()+",TO_DATE('"+board.getDateString()+"', 'yyyy/mm/dd HH24:MI'),'"
	+board.getTitle()+"','"+board.getContent()+"',"+board.getTid()+","+board.getCid()+",'"+board.getUserId()+"')";
		
		return db.updateSql(sql);
	}
	public int updateProcess(Board board) {
		String sql ="UPDATE BOARD SET content='"+board.getContent()+"', title = '"+ board.getTitle() +"' where user_id='"+board.getUserId()
		+"' and cid="+board.getCid()+" AND tid="+board.getTid()+" AND id="+board.getId();
		return db.updateSql(sql);
	}
	
}
