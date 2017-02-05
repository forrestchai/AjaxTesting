<%@ page import="WayfinderModel.Waypoint" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/5/2017
  Time: 2:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
          rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
          rel="stylesheet" type="text/css">

    <%
        Waypoint name = (Waypoint) session.getAttribute("feedbackSelected");

    %>

    <script>

        $(document).ready(function()
        {
            getFeedback();
        })

        function appendTableFeedback(index, waypointName, isCrit){

            var feedbackTable = $('#feedbackTable > tbody:last');
            feedbackTable.append(
                '<tr>'+
                '<td>'+ index +'</td>'+
                '<td>'+waypointName+'</td>'+
                '<td>'+isCrit+'</td>'+
                '<td>'+
                '<a class="btn btn-primary" href="">Resolved</a>' +
                '</td>' +
                '</tr>'
            );

        }

        function getFeedback(){

            var url = '/services/waypointFeedback/A1-003';
            var allFeedback = [];

            $.ajax({

                async:false,
                url: url,
                type: 'GET',
                datatype: 'json',
                success:function(response)
                {
                    allFeedback = response;

                    for(var i=0; i<response.length; i++)
                    {
                        var f =response[i];
                        var index=1;
                        var isCrit = false;

                        if(f.listValue = 1){
                            isCrit = true;
                        }

                        appendTableFeedback(f.id, f.name, isEnabled, f.feedBackAmt);
                    }

                }


            })

        }

    </script>

</head>

<body>
<div class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand"><span>Wayfinder</span></a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="#">Home</a>
                </li>
                <li class="active">
                    <a href="WayfinderLanding.jsp">Wayfinder</a>
                </li>
                <li>
                    <a href="#">Diabetes Monitor</a>
                </li>
                <li>
                    <a href="login.jsp">Virtual Chat</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <h1 class="text-left">A&amp;E Entrance</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">
                <p class="text-left">Feedback gathered of the QR waypoint.
                    <br>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h3>Waypoint Status: Enabled</h3>
                <a class="btn btn-primary">Toggle Status</a>
            </div>
        </div>
    </div>
</div>
<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table" id="waypointTable">
                    <thead>
                    <tr>
                        <th style="width:50px">#</th>
                        <th>Feedback Subject</th>
                        <th style="width:230px">Critical issue</th>
                        <th style="width:130px">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>Waypoint Inaccessible</td>
                        <td>False</td>
                        <td >
                            <a class="btn btn-primary">Resolved</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>

</html>