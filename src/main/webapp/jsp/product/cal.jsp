<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
  <style>
  	.fc .fc-button-primary{
  		background-color: #2c3e50;
  	}
  </style>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        
        // 서버에서 데이터를 가져와서 events 배열에 추가
        var events = [
          <% 
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
              Class.forName("org.mariadb.jdbc.Driver"); // your_db_driver에는 실제 사용하는 데이터베이스 드라이버명을 넣어야 합니다.
              conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/kream", "kream", "1234"); // 연결 정보를 수정하세요.
              stmt = conn.createStatement();
              rs = stmt.executeQuery("SELECT auction_start_day FROM auction"); // 쿼리를 수정하세요.

              while (rs.next()) {
                String auctionStartDay = rs.getString("auction_start_day");
          %>
          {
            title: 'Auction Start',
            start: '<%= auctionStartDay %>'
          },
          <%
              }
            } catch (Exception e) {
              e.printStackTrace();
            } finally {
              try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
              } catch (SQLException e) {
                e.printStackTrace();
              }
            }
          %>
        ];

        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          events: events
        });

        calendar.render();
      });

    </script>
  </head>
  <body>
  	<%@include file="../default/header.jsp" %>
    <div id='calendar'></div>
    <div>
		<c:import url="/footer" />
	</div>
  </body>
</html>
