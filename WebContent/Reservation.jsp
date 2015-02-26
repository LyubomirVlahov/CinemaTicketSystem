<%@page import="com.cinema.persistence.model.Projection"%>
<%@page import="com.cinema.Constants"%>
<%@page import="com.cinema.persistence.dao.ProjectionDAO"%>
<%@page import="com.cinema.persistence.model.Status"%>
<%@page import="com.cinema.persistence.model.Seat"%>
<%@page import="com.cinema.persistence.model.Hall"%>
<%@page import="com.cinema.persistence.EntityManagerProviderImpl"%>
<%@page import="com.cinema.persistence.dao.HallDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Collection"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Резервация</title>
	<link rel="stylesheet" href="styles/Style.css" type="text/css" media="all" />
	<script src="javascript/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="javascript/jquery-func.js"></script>
    <link href="styles/visStyles.css" type="text/css" rel="stylesheet" />
    <link href="styles/visStylesUser.css" type="text/css" rel="stylesheet" />
    <link href="styles/global.css" type="text/css" rel="stylesheet" />
    <style type="text/css"></style>
</head>
<body>
<!-- Shell -->
<div id="shell">
<jsp:include page="header.jsp" />
	
	<!-- Main -->
	<div id="main">
		<!-- Content -->
		<div id="content">

			<!-- Box -->
			<div class="box">
			
			
			
    <div id="shell">
      <div class="inner">
        <div id="center">
          <div id="reservationContent">
            <div class="inner">
              <table id="tblBody" class="BodyTable" cellspacing="0" cellpadding="0" border="0" width="582px">
                <tbody>
                  <tr>
                    <td>
                      <br />
                      <table id="tblLegendPos" cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tbody>
                          <tr>
                            <td width="5px"></td>
                            <td>
                              <div id="divLegend" align="center">
                              <span>
                              <img id="imgAutoReserved" class="ImageAppletExample" src="img/selected_seat.png" border="0" /> 
                              <span id="lblAutoReserved" class="Legend">Вашето място</span></span> 
                              <span>
                              <img id="imgEmpty" class="ImageAppletExample" src="img/free_seat.png" border="0" /> 
                              <span id="lblEmpty" class="Legend">Свободно място</span></span> 
                              <span>
                              <img id="imgSold" class="ImageAppletExample" src="img/busy_seat.png" border="0" /> 
                              <span id="lblSold" class="Legend">Продадено място</span></span></div>
                            </td>
                            <td width="5px"></td>
                          </tr>
                        </tbody>
                      </table>
                      <table cellspacing="0" cellpadding="0" width="100%" border="0" style="padding-bottom:15px;">
                        <tbody>
                          <tr>
                            <td align="center" width="100%">
                              <span id="lblApplet"></span>
                              <div id="divSeatMap" class="Screen-AllAreas">
                                <div>
                                  <div id="objSeatPlan" class="Seating-Control" style="width:560px;">
                                    <div style="height: 310px;">
                                      <div class="Seating-Screen" style="width:400px;">
                                        <img src="img/SeatScreen.png" style="width:100%;position:absolute;left:0px;" />
                                      </div>
                                      <div class="Seating-Container" style="width: 430px; height: 250px; visibility: visible;">
                                        <div class="Seating-RowLabelContainer">
                                          <table cellpadding="0" cellspacing="0" style="top:0%;height:100%;">
                                            <tbody>
                                            <% 
                                            long loadedTime = System.currentTimeMillis();
                                            String projectionIdString = request.getParameter("projectionId");
                                            if(null==projectionIdString){
                                               request.setAttribute(Constants.ERR_MSG_ATTR_NAME, "Липсва параметър в заявката с име 'projectionId'");
                                         	   request.getRequestDispatcher("error.jsp").forward(request, response);
                                         	   return;
                                            }
                                            long projectionId=Long.valueOf(projectionIdString);
                                            ProjectionDAO projectionDAO = new ProjectionDAO(EntityManagerProviderImpl.getInstance());
                                            Projection projection = projectionDAO.getById(projectionId);
                                            if(null==projection){
                             		           request.setAttribute(Constants.ERR_MSG_ATTR_NAME, "Не съществува прожекция с ID " + projectionId);
                             		      	   request.getRequestDispatcher("/error.jsp").forward(request, response);
                             		      	   return;
                             				}
                                            Hall hall = projection.getHall();
                                            
                                            for(byte row=1; row <= hall.getRowsCount();row++){ %>
                                              <tr>
                                                <td style="background-color:white; padding-left: 0.3rem;"><%=row%></td>
                                              </tr>
                                            <% } %>
                                            </tbody>
                                          </table>
                                        </div>
                                        <div class="Seating-Theatre" style="width:400px;height:250px;" data-originalsize="250">
                                          <table id="objSeatPlan_1" class="Seating-Area" data-area-number="1" cellspacing="0"
                                          cellpadding="0" style="left:0%;top:0%;width:100%;height:100%;table-layout:fixed;">
                                            <tbody>
                                            <% for(byte row=1; row <= hall.getRowsCount();row++){ %>
                                              <tr style="line-height: 25px; height: 25px;">
                                                <td></td>
                                                	
                                                	<%!
													    Seat getSeatByRowAndColumn(byte row, byte column, Hall hall)
													    {
                                                			for(Seat seat : hall.getSeats()){
                                                				if(seat.getColumn() == column && seat.getRow() == row){
                                                					return seat;
                                                				}
                                                			}
                                                			throw new IllegalStateException("There is no seat with row " +row + " and column "+ column+ " in the hall with id " + hall.getId());
													    }
													%>
                                                	
                                                	<%for(byte column=1; column <= hall.getColumnsCount();column++){ %>
	                                                <td>
	                                                  <p unselectable="on" class="unselectable"
	                                                  style="width: 25px; line-height: 25px;"></p>
	                                                  <%
	                                                    Seat seat = getSeatByRowAndColumn(row, column, hall);
	                                                  if(seat.getStatus() == Status.FREE || (seat.getStatus() == Status.RESERVED && seat.getReservedUntil() < loadedTime)){
	                                                  		out.append("<img src=\"img/free_seat.png\" class=\"freeSeat\" seatid=" +seat.getId() + " style=\"width: 24px; height: 25px;\" />");
	                                                  } else if( seat.getStatus() == Status.PAID || (seat.getStatus() == Status.RESERVED && seat.getReservedUntil() >= loadedTime)){
	                                               			out.append("<img src=\"img/busy_seat.png\" class=\"busySeat\" seatid=" +seat.getId() + " style=\"width: 24px; height: 25px;\" />");
	                                                  } else{
	                                                	  throw new IllegalStateException("Invalid seat status " + seat.getStatus());
	                                                  }
	                                                  %>
	                                                </td>
	                                                <%}%>
                                                <td></td>
                                                <td style="width:0px;"></td>
                                              </tr>
                                            <%}%>
                                            </tbody>
                                          </table>
                                        </div>
                                        <div class="Seating-RowLabelContainer">
                                          <table cellpadding="0" cellspacing="0" style="top:0%;height:100%;">
                                            <tbody>
                                            <% for(byte row=1; row <= hall.getRowsCount();row++){ %>
                                              <tr>
                                                <td style="background-color:white; padding-left: 0.3rem;"><%=row%></td>
                                              </tr>
                                            <% } %>
                                            </tbody>
                                          </table>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div id="divSeatMapBack" class="Screen-Back"></div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div style="text-align: right;" onclick="requestReservation()">
              	<a class="btn">Напред</a>
              </div>	
            </div>
            
          </div>
        </div>
      </div>
    </div>

	</div>
			<!-- end Box -->
				
				<div class="cl">&nbsp;</div>
		</div>
		<!-- end Content -->
			
		<div class="cl">&nbsp;</div>
	</div>
	<!-- end Main -->
</div>
<!-- end Shell -->
<jsp:include page="footer.jsp" />
</body>
  <script src="javascript/reservation.js"></script>
</html>
