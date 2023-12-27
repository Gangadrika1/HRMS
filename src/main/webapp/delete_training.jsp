<!DOCTYPE html>
<html>
<head>
    <title>Delete Holiday Form</title>
</head>
<body>
<!-- Script to automatically trigger deletion when the page loads -->
<script>
    window.addEventListener('load', function() {
        // Extract the 'id' parameter from the URL
        var urlParams = new URLSearchParams(window.location.search);
        var expensesId = urlParams.get('TainingID');
        // Make an AJAX request to delete the employee
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './DeleteTrainingServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('TainingID=' + expensesId);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Handle the response if needed
                var response = xhr.responseText;
                 // You can log the response to the console
            }
        };
    });
</script>

<%   response.sendRedirect("training.jsp"); %>
</body>
</html>
