
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
          rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
          rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

    <script>

        $(document).ready(function()
        {
            getAllFeedback();
        })

        function appendTableFeedback(waypointId, waypointName, isEnabled, amt, crit){

            console.log(waypointId + 'WHAT');

            var feedbackTable = $('#feedbackTable > tbody:last');
            feedbackTable.append(
                '<tr>'+
                '<td>'+ waypointId +'</td>'+
                '<td>'+waypointName+'</td>'+
                '<td>'+isEnabled+'</td>'+
                '<td>'+amt+'</td>'+
                '<td>'+
                '<a class="btn btn-primary" href="http://localhost:8080/waypointRedirect?waypointId='+waypointId+'">View</a>' +
                '</td>' +
                '</tr>'
            );
        }

        function getAllFeedback(){

            var url = '/services/wayfinderFeedback';
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
                        var isEnabled = "Enabled";

                        if(f.listValue == "1"){
                            isEnabled = "Disabled";
                        }

                        appendTableFeedback(f.id, f.name, isEnabled, f.feedBackAmt);
                    }

                }


            })

        }

        function dismissFeedbackWaypoint() {

            var cnfm = prompt("To Delete all feedback here please enter name of Waypoint", "");
            console.log(cnfm + " real: ");
            if (cnfm == "") {
                alert("All entries deleted from waypoint")
                window.location = "/feedbackDismiss?from=feedback&all=no&delAllId=no&delId=no";
            }
            else{
                alert("Feedback Delete Cancelled");
            }
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
            <div class="col-md-12">
                <h1 class="text-left">Feedback</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <p class="text-left">A table of locations and the amount of feedback the user have on them</p>
            </div>
        </div>
    </div>
</div>
<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table" id="feedbackTable">
                    <thead>
                        <tr>
                            <th style="width:130px">Waypoint #</th>
                            <th>Waypoint</th>
                            <th>Status</th>
                            <th style="width:130px">Faults</th>
                            <th style="width:150px">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>

</html>