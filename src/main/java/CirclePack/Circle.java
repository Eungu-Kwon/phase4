package CirclePack;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class Circle {
	 
	public DBHelper db = DBHelper.getInstance();
	public int id;
	public String Cname;
	public String manager;
	public String phoneNum;
	public String description;
	public int max_person;
	public String isCircle;
	public int categoryId;
	public String categoryName;
	public Date startDate;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCname() {
		return Cname;
	}

	public void setCname(String cname) {
		Cname = cname;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getMax_person() {
		return max_person;
	}

	public void setMax_person(int max_person) {
		this.max_person = max_person;
	}

	public String getIsCircle() {
		return isCircle;
	}

	public void setIsCircle(String isCircle) {
		this.isCircle = isCircle;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public Date endDate;
	public String thumbnail;
	
	public Circle(String id) {
		String query = "SELECT *\r\n"
				+ "FROM CIRCLE\r\n"
				+ "WHERE id = "+ id;
		ResultSet rs = db.runSql(query);
		try {
			while(rs.next()){
				this.id = rs.getInt(1);
				Cname = rs.getString(2);
				manager = rs.getString(3);
				phoneNum = rs.getString(4);
				description = rs.getString(5);
				max_person = rs.getInt(6);
				isCircle = rs.getString(7);
				categoryId = rs.getInt(8);
				startDate = rs.getDate(9);
				endDate = rs.getDate(10);
				thumbnail = rs.getString(11);
			}
			rs.close();
			query = "SELECT Cvalue FROM categorys WHERE id = " + categoryId;
			rs = db.runSql(query);
			while(rs.next()){
				categoryName = rs.getString(1);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public int getNewId() {
		int id = 0;
		ResultSet rs = null;

		try {
			String sql = "select max(id) from circle";
			rs = db.runSql(sql);
			rs.next();
			id = rs.getInt(1);
			rs.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return id + 1;
	}
	
	

	
}
