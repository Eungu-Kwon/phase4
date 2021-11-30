package TimePack;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeCheck {
	
//	//[날짜를 받아서 Calendar로 바꾸는 함수]
//	public String  startDate;
//	public String EndDate;
//	public String CurrentDate;

	   private Calendar getDateTime(String strDatetime) {

	      Calendar cal = Calendar.getInstance();

	      String[] strSplitDateTime = strDatetime.split(" ");

	      String[] strSplitDate = strSplitDateTime[0].split("-");

	      String[] strSplitTime = strSplitDateTime[1].split(":");

	      cal.set(Integer.parseInt(strSplitDate[0]), Integer.parseInt(strSplitDate[1]) - 1,

	            Integer.parseInt(strSplitDate[2]), Integer.parseInt(strSplitTime[0]), Integer.parseInt(strSplitTime[1]),

	            Integer.parseInt(strSplitTime[2]));

	      return cal;

	   }



		//	[비교 함수]

	   public  Boolean getValidDate(String strStart, String strEnd, String strValue) {





	      Calendar calStart = getDateTime(strStart);

	      Calendar calEnd = getDateTime(strEnd);

	      Calendar calValue = getDateTime(strValue);

	      

	      Boolean bValid = false;

	      if (calStart.before (calValue) && calEnd.after(calValue)) {

	         bValid = true;

	      }



	      return bValid;

	   }
	   
	   public  String getCurrentDate() {
			//System.out.println(now); 현재 시간 출력 
			Date now = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String formatedNow = formatter.format(now); // 포맷팅 적용
			return formatedNow;
			
		}
		



//			[사용]
//
//			      String GUILD_BATTLE_APPLICATION_START_TIME1 = "2016-03-09 11:40:11";
//
//			      String GUILD_BATTLE_APPLICATION_END_TIME1 = "2016-03-09 12:40:11";
//
//			      String strValue = "2016-03-09 12:45:11";
//
//
//
//			      Boolean bValid = getValidDate(GUILD_BATTLE_APPLICATION_START_TIME1, GUILD_BATTLE_APPLICATION_END_TIME1, strValue);
	

}
