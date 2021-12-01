<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import= "CirclePack.*" %>
<%@ page import= "java.sql.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Sprayed Strokes   
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20110329
-->

<%	
	int cid = Integer.parseInt(request.getParameter("cid"));
	DBHelper db = new DBHelper();
	Circle circle = new Circle(request.getParameter("cid"));
%>

<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Sprayed Strokes   
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20110329
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>The Coffee Shop</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    
    <script src="https://momentjs.com/downloads/moment-with-locales.js"></script>
    <link rel="stylesheet" href="/phase4/schedule/schedule.css">
        
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../css/default.css" rel="stylesheet" type="text/css" />
<style>
div#schedule {
    width: fit-content;
}
</style>
</head>
<body>
<div id="wrapper">
  <div id="menu">
    <ul>
      <li><a href="/phase4/mainpage/lib/mainpage.jsp" accesskey="1">Home</a></li>
      <li class="active"><a href="#" accesskey="2">Photos</a></li>
      <li><a href="#" accesskey="3">Links</a></li>
      <li><a href="#" accesskey="4">About</a></li>
      <li><a href="#" accesskey="5">Contact</a></li>
    </ul>
  </div>
  <!-- end #menu -->
  <div id="header">
  
  </div>
  <!-- end #header -->
  <div id="content">
  	<div class="Article">
        <div id="schedule"></div>
    </div> 	

    <!-- end #posts -->
    <div id="links">
      <ul>
      	<li>
          <h2><%=circle.getCname()%></h2>
          <ul>
            <li><a>total number : 20 </a></li>
            <li><a>Category : <%=circle.getCategoryName()%></a></li>
            <li><a>Manager : <%=circle.getManager()%></a></li>
            <li><a>phone-number : <%=circle.getPhoneNum()%></a></li>
          </ul>
        <li>
          <h2>Tab</h2>
          <ul>
             <% 
             out.println("<li><a href=\"schedule.jsp?cid=" + circle.getId() + "\">스케줄</a></li>");
             out.println(Tab.showTabList(db,circle.getId()));
             %>
             <li><a href="circle_page.jsp?cid=" + circle.getId()></a></li>
          </ul>
        </li>

      </ul>
      <a style="width: 100%;" href="schedule_create_page.jsp?cid=<%out.print(circle.getId());%>">스케줄 추가하기</a>
    </div>
    <!-- end #links -->
    <div style="clear: both;">&nbsp;</div>
    
  </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

	<script>
	!function() {

		  var today = moment();

		  function Calendar(selector, events) {
		    this.el = document.querySelector(selector);
		    this.events = events;
		    this.current = moment().date(1);
		    
		    this.draw();
		    var current = document.querySelector('.today');
		    if(current) {
		      var self = this;
		      window.setTimeout(function() {
		        self.openDay(current);
		      }, 500);
		    }
		  }

		  Calendar.prototype.draw = function() {
		    //Create Header
		    this.drawHeader();

		    //Draw Month
		    this.drawMonth();

		    this.drawLegend();
		  }

		  Calendar.prototype.drawHeader = function() {
		    var self = this;
		    if(!this.header) {
		      //Create the header elements
		      this.header = createElement('div', 'header');
		      this.header.className = 'header';

		      this.title = createElement('h1');

		      var right = createElement('div', 'right');
		      right.addEventListener('click', function() { self.nextMonth(); });

		      var left = createElement('div', 'left');
		      left.addEventListener('click', function() { self.prevMonth(); });

		      //Append the Elements
		      this.header.appendChild(this.title); 
		      this.header.appendChild(right);
		      this.header.appendChild(left);
		      this.el.appendChild(this.header);
		    }

		    this.title.innerHTML = this.current.format('MMMM YYYY');
		  }

		  Calendar.prototype.drawMonth = function() {
		    var self = this;
		    
		    this.events.forEach(function(ev) {
		     //if(ev.month == self.current)
		     if(self.current.month()+1 == ev.month)
		     	ev.date = self.current.clone().date(ev.day);
		     else ev.date = self.current.clone().date(0);
		    });
		    
		    
		    if(this.month) {
		      this.oldMonth = this.month;
		      this.oldMonth.className = 'month out ' + (self.next ? 'next' : 'prev');
		      this.oldMonth.addEventListener('webkitAnimationEnd', function() {
		        self.oldMonth.parentNode.removeChild(self.oldMonth);
		        self.month = createElement('div', 'month');
		        self.backFill();
		        self.currentMonth();
		        self.fowardFill();
		        self.el.appendChild(self.month);
		        window.setTimeout(function() {
		          self.month.className = 'month in ' + (self.next ? 'next' : 'prev');
		        }, 16);
		      });
		    } else {
		        this.month = createElement('div', 'month');
		        this.el.appendChild(this.month);
		        this.backFill();
		        this.currentMonth();
		        this.fowardFill();
		        this.month.className = 'month new';
		    }
		  }

		  Calendar.prototype.backFill = function() {
		    var clone = this.current.clone();
		    var dayOfWeek = clone.day();

		    if(!dayOfWeek) { return; }

		    clone.subtract(dayOfWeek+1, 'days');

		    for(var i = dayOfWeek; i > 0 ; i--) {
		      this.drawDay(clone.add(1, 'days'));
		    }
		  }

		  Calendar.prototype.fowardFill = function() {
		    var clone = this.current.clone().add(1, 'months').subtract(1, 'days');
		    var dayOfWeek = clone.day();

		    if(dayOfWeek === 6) { return; }

		    for(var i = dayOfWeek; i < 6 ; i++) {
		      this.drawDay(clone.add(1, 'days'));
		    }
		  }

		  Calendar.prototype.currentMonth = function() {
		    var clone = this.current.clone();

		    while(clone.month() === this.current.month()) {
		      this.drawDay(clone);
		      clone.add(1, 'days');
		    }
		  }

		  Calendar.prototype.getWeek = function(day) {
		    if(!this.week || day.day() === 0) {
		      this.week = createElement('div', 'week');
		      this.month.appendChild(this.week);
		    }
		  }

		  Calendar.prototype.drawDay = function(day) {
		    var self = this;
		    this.getWeek(day);

		    //Outer Day
		    var outer = createElement('div', this.getDayClass(day));
		    outer.addEventListener('click', function() {
		      self.openDay(this);
		    });

		    //Day Name
		    var name = createElement('div', 'day-name', day.format('ddd'));

		    //Day Number
		    var number = createElement('div', 'day-number', day.format('DD'));


		    //Events
		    var events = createElement('div', 'day-events');
		    this.drawEvents(day, events);

		    outer.appendChild(name);
		    outer.appendChild(number);
		    outer.appendChild(events);
		    this.week.appendChild(outer);
		  }

		  Calendar.prototype.drawEvents = function(day, element) {
		    if(day.month() === this.current.month()) {
		      var todaysEvents = this.events.reduce(function(memo, ev) {
		        if(ev.date.isSame(day, 'day')) {
		          memo.push(ev);
		        }
		        return memo;
		      }, []);

		      todaysEvents.forEach(function(ev) {
		        var evSpan = createElement('span', ev.color);
		        element.appendChild(evSpan);
		      });
		    }
		  }

		  Calendar.prototype.getDayClass = function(day) {
		    classes = ['day'];
		    if(day.month() !== this.current.month()) {
		      classes.push('other');
		    } else if (today.isSame(day, 'day')) {
		      classes.push('today');
		    }
		    return classes.join(' ');
		  }

		  Calendar.prototype.openDay = function(el) {
		    var details, arrow;
		    var dayNumber = +el.querySelectorAll('.day-number')[0].innerText || +el.querySelectorAll('.day-number')[0].textContent;
		    var day = this.current.clone().date(dayNumber);

		    var currentOpened = document.querySelector('.details');

		    //Check to see if there is an open detais box on the current row
		    if(currentOpened && currentOpened.parentNode === el.parentNode) {
		      details = currentOpened;
		      arrow = document.querySelector('.arrow');
		    } else {
		      //Close the open events on differnt week row
		      //currentOpened && currentOpened.parentNode.removeChild(currentOpened);
		      if(currentOpened) {
		        currentOpened.addEventListener('webkitAnimationEnd', function() {
		          currentOpened.parentNode.removeChild(currentOpened);
		        });
		        currentOpened.addEventListener('oanimationend', function() {
		          currentOpened.parentNode.removeChild(currentOpened);
		        });
		        currentOpened.addEventListener('msAnimationEnd', function() {
		          currentOpened.parentNode.removeChild(currentOpened);
		        });
		        currentOpened.addEventListener('animationend', function() {
		          currentOpened.parentNode.removeChild(currentOpened);
		        });
		        currentOpened.className = 'details out';
		      }

		      //Create the Details Container
		      details = createElement('div', 'details in');

		      //Create the arrow
		      var arrow = createElement('div', 'arrow');

		      //Create the event wrapper

		      details.appendChild(arrow);
		      el.parentNode.appendChild(details);
		    }

		    var todaysEvents = this.events.reduce(function(memo, ev) {
		      if(ev.date.isSame(day, 'day')) {
		        memo.push(ev);
		      }
		      return memo;
		    }, []);

		    this.renderEvents(todaysEvents, details);

		    arrow.style.left = el.offsetLeft - el.parentNode.offsetLeft + 27 + 'px';
		  }

		  Calendar.prototype.renderEvents = function(events, ele) {
		    //Remove any events in the current details element
		    var currentWrapper = ele.querySelector('.events');
		    var wrapper = createElement('div', 'events in' + (currentWrapper ? ' new' : ''));

		    events.forEach(function(ev) {
		      var div = createElement('div', 'event');
		      var square = createElement('div', 'event-category ' + ev.color);
		      var span = createElement('span',);
		      var s_btn = createElement('button', 'dayevent', ev.eventName);
		      s_btn.setAttribute('onclick', "location.href='/phase4/board/lib/schedule_create_page.jsp?cid=<%out.print(circle.getId());%>&id=" + ev.sid + "'");
		      span.appendChild(s_btn);

		      div.appendChild(square);
		      div.appendChild(span);
		      wrapper.appendChild(div);
		    });

		    if(!events.length) {
		      var div = createElement('div', 'event empty');
		      var span = createElement('span', '', 'No Events');

		      div.appendChild(span);
		      wrapper.appendChild(div);
		    }

		    if(currentWrapper) {
		      currentWrapper.className = 'events out';
		      currentWrapper.addEventListener('webkitAnimationEnd', function() {
		        currentWrapper.parentNode.removeChild(currentWrapper);
		        ele.appendChild(wrapper);
		      });
		      currentWrapper.addEventListener('oanimationend', function() {
		        currentWrapper.parentNode.removeChild(currentWrapper);
		        ele.appendChild(wrapper);
		      });
		      currentWrapper.addEventListener('msAnimationEnd', function() {
		        currentWrapper.parentNode.removeChild(currentWrapper);
		        ele.appendChild(wrapper);
		      });
		      currentWrapper.addEventListener('animationend', function() {
		        currentWrapper.parentNode.removeChild(currentWrapper);
		        ele.appendChild(wrapper);
		      });
		    } else {
		      ele.appendChild(wrapper);
		    }
		  }

		  Calendar.prototype.drawLegend = function() {
		    var legend = createElement('div', 'legend');
		    var calendars = this.events.map(function(e) {
		      return e.calendar + '|' + e.color;
		    }).reduce(function(memo, e) {
		      if(memo.indexOf(e) === -1) {
		        memo.push(e);
		      }
		      return memo;
		    }, []).forEach(function(e) {
		      var parts = e.split('|');
		      var entry = createElement('span', 'entry ' +  parts[1], parts[0]);
		      legend.appendChild(entry);
		    });
		    this.el.appendChild(legend);
		  }

		  Calendar.prototype.nextMonth = function() {
		    this.current.add(1, 'months');
		    this.next = true;
		    this.draw();
		  }

		  Calendar.prototype.prevMonth = function() {
		    this.current.subtract(1, 'months');
		    this.next = false;
		    this.draw();
		  }

		  window.Calendar = Calendar;

		  function createElement(tagName, className, innerText) {
		    var ele = document.createElement(tagName);
		    if(className) {
		      ele.className = className;
		    }
		    if(innerText) {
		      ele.innderText = ele.textContent = innerText;
		    }
		    return ele;
		  }
		}();
	</script>
	<script>
	window.onload = function() {
		  var data = [
			  <%
			  SimpleDateFormat getMonth = new SimpleDateFormat("MM");
			  SimpleDateFormat getday = new SimpleDateFormat("dd");
			  String month, day, str;
			  int Circle_id = circle.getId();
			  DBHelper dbhelper = DBHelper.getInstance();
			  String query = "SELECT * FROM SCHEDULES WHERE CID=" + Circle_id;
			  
			  ResultSet rs = dbhelper.runSql(query);
			  
			  while(rs.next()){
				  month = getMonth.format(rs.getDate(6));
				  day = getday.format(rs.getDate(6));
				  str = rs.getString(8);
				  str = str.replaceAll("\\\"\\\"", "\\\\\"");
				  out.println("{ sid: " + rs.getString(1) + ", eventName: \"" + str + "\", calendar: '', color: '" + rs.getString(4) + "', month: '" + month + "', day: '" + day + "' },");
			  }
			  %>
		  ];
		  function addDate(ev) {
		    
		  }

		  var calendar = new Calendar('#schedule', data);

		}();
	</script>
	
</html>