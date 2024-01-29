<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    <style>
      #event-info {
      z-index: 9999;
        display: none;
        position: absolute;
        background-color: white;
        padding: 10px;
        border: 1px solid #ccc;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      }
    </style>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var eventInfoEl = document.getElementById('event-info');

        var events = [
          <% 
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
              Class.forName("org.mariadb.jdbc.Driver");
              conn = DriverManager.getConnection("jdbc:mariadb://ec2-13-124-30-131.ap-northeast-2.compute.amazonaws.com:3306/kream", "kream", "kream1234");
              //conn = DriverManager.getConnection("jdbc:mariadb://ec2-52-78-47-224.ap-northeast-2.compute.amazonaws.com:3306/lyh", "lyh", "1234");
              stmt = conn.createStatement();
              rs = stmt.executeQuery("SELECT a.auction_start_day, p.name_Kr FROM auction a JOIN product p ON a.auction_id = p.product_no");

              while (rs.next()) {
                String auctionStartDay = rs.getString("auction_start_day");
                String name_Kr = rs.getString("name_Kr"); // 수정된 부분
          %>
          {
            title: 'Auction Start',
            start: '<%= auctionStartDay %>',
            description: '<%= name_Kr %>'
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
          events: events,
          eventMouseEnter: function(info) {
            // 마우스가 이벤트에 들어가면 설명칸을 표시
            var description = info.event.extendedProps.description;
            showEventInfo(info.jsEvent.pageX, info.jsEvent.pageY, description);
          },
          eventMouseLeave: function() {
            // 마우스가 이벤트에서 나가면 설명칸을 숨김
            hideEventInfo();
          }
        });

        calendar.render();

        function showEventInfo(x, y, description) {
          var y0ffset = 20;
          eventInfoEl.innerHTML = description;
          eventInfoEl.style.left = x + 'px';
          eventInfoEl.style.top = y + 'px';
          eventInfoEl.style.display = 'block';
        }

        function hideEventInfo() {
          eventInfoEl.style.display = 'none';
        }
      });
    </script>
  </head>
  <%@include file="../default/header.jsp" %>
  <body>
    <div id='calendar'></div>
    <div id='event-info'></div>
    <div>
      <c:import url="/footer" />
    </div>
  </body>
</html>
