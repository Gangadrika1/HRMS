<!DOCTYPE html>
<html>
<head>
    <title>Delete GoalType Form</title>
</head>
<body>
<!-- Script to automatically trigger deletion when the page loads -->
<script>
    window.addEventListener('load', function() {
        // Extract the 'id' parameter from the URL
        var urlParams = new URLSearchParams(window.location.search);
        var taxId = urlParams.get('GoalsTypeID');
console.log("you have entered deletetacsrv");
        // Make an AJAX request to delete the employee
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './DeleteGoalTypeSrv', true);
        console.log("deletetacsrv called");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('GoalsTypeID=' + taxId);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Handle the response if needed
                var response = xhr.responseText;
                console.log(response); // You can log the response to the console
            }
        };
    });
</script>
<!-- console.log("you are about to taxes.jsp");-->
<%   response.sendRedirect("goal-type.jsp"); %>
</body>
</html>
