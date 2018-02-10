<%@ page import="exam.*" %>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Exam Results</title>
		
		<style type="text/css">
		table {
  border-spacing: 1;
  border-collapse: collapse;
  background: white;
  border-radius: 6px;
  overflow: hidden;
  max-width: 800px;
  width: 100%;
  margin: 0 auto;
  position: relative;
}
table * {
  position: relative;
}
table td, table th {
  padding-left: 8px;
}
table thead tr {
  height: 60px;
  
  
  background: #FFED86;

  font-size: 16px;
}
table tbody tr {
  height: 48px;
  border-bottom: 1px solid #E3F1D5;
}
table tbody tr:last-child {
  border: 0;
}
table td, table th {
  text-align: left;
}
table td.l, table th.l {
  text-align: right;
}
table td.c, table th.c {
  text-align: center;
}
table td.r, table th.r {
  text-align: center;
}

@media screen and (max-width: 35.5em) {
  table {
    display: block;
  }
  table > *, table tr, table td, table th {
    display: block;
  }
  table thead {
    display: none;
  }
  table tbody tr {
    height: auto;
    padding: 8px 0;
  }
  table tbody tr td {
    padding-left: 45%;
    margin-bottom: 12px;
  }
  table tbody tr td:last-child {
    margin-bottom: 0;
  }
  table tbody tr td:before {
    position: absolute;
    font-weight: 700;
    width: 40%;
    left: 10px;
    top: 0;
  }
  
  
  table tbody tr td:nth-child(1):before {
    content: "Code";
  }
  table tbody tr td:nth-child(2):before {
    content: "Stock";
  }
  table tbody tr td:nth-child(3):before {
    content: "Cap";
  }
  table tbody tr td:nth-child(4):before {
    content: "Inch";
  }
  table tbody tr td:nth-child(5):before {
    content: "Box Type";
  }
  
  
}

body{
 
  background-size: cover;
  background-position: center center;
  position: relative;
  top: 0;
  bottom: 0;
  height: 100vh;
  z-index: -10;
  background-color: #F5F5DC;

}






blockquote {
  color: white;
  text-align: center;
}
a{
	text-decoration: none; 
	text-align: center; 
	color: black; 
	font-size: 20px; 
	
}


/* Database Hover Effect*/


/* Might have to changed to .hovereffect tr:hover*/
.hover_effect {
	background-color: white; 
}

.hover_effect:hover{
	background-color: #ffff99; 
}

th.headerSortUp {
            background-image: url(asc.gif);
            background-color: #3399FF;
            background-repeat: no-repeat;
            background-position: center right;
        }
        th.headerSortDown {
            background-image: url(desc.gif);
            background-color: #3399FF;
            background-repeat: no-repeat;
            background-position: center right;
        }
        
        input[type=text] {
        width: 200px; 
        }

		
		</style>
		
	</head>
	<body>
		
		<% 
		ExamResult result = (ExamResult)session.getAttribute("result");
		if (result != null){
		%>
	
	<div class="form-group pull-right">
   <center><input type="text" class="search form-control" placeholder="What are you looking for?"></center> 
</div>
		
		<table id = "myTable" class = "tablesorter">
			<thead>
			<tr>
				<th>Assignment</th>
				<th>Grade</th>
			</tr>
			</thead>
			
			<tbody>
			<tr class = "hover_effect">
				<td style="font-weight:bold;">Homework 1:</td>
				<td><%=result.gethw1() %></td>
			</tr>
			<tr class = "hover_effect">
				<td style="font-weight:bold;">Homework 2:</td>
				<td ><%=result.gethw2() %></td>
				
			</tr>
		
			
			<tr class = "hover_effect">
				<td style="font-weight:bold;">Project 1:</td>
				<td><%=result.getproject1() %></td>
			</tr>
			
			<tr class = "hover_effect">
				<td style="font-weight:bold;">Project 2:</td>
				<td ><%=result.getproject2() %></td>
					
			</tr>
			
	
			
				<tr class = "hover_effect">
				<td style="font-weight:bold;">Exam1:</td>
				<td><%=result.getExam1() %></td>
			</tr>
				<tr class = "hover_effect">
				<td style="font-weight:bold;">Exam2:</td>
				<td ><%=result.getExam2() %></td>
			</tr>
			
		
				<tr class = "hover_effect">
				<td style="font-weight:bold;">Final Exam:</td>
				<td><%=result.getfinalexam() %></td>
			</tr>
			</tbody>
		</table>
		<%
		} else {
		%>
		<h3>We could not provide you with any results.</h3>
		<% 
		}
		%>
		<hr/><center><a href="index.html">Back to Home</a></center>
		
		<!-- Filters for Data -->
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		  <script src = "tablesorter.js"></script>

		
		<script>
		$(document).ready(function(){
	        $("#myTable").tablesorter();
	        
	        
	        $('.search').on('keyup',function(){
	            var searchTerm = $(this).val().toLowerCase();
	            $('#myTable tbody tr').each(function(){
	                var lineStr = $(this).text().toLowerCase();
	                if(lineStr.indexOf(searchTerm) === -1){
	                    $(this).hide();
	                }else{
	                    $(this).show();
	                }
	            });
	        });
	        
	      });
		
		
		
		
		</script>
		
	</body>
</html>
