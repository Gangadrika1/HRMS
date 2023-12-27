<!DOCTYPE html>
<html>
<head>
    <title>Delete Employee Form</title>
</head>
<body>

<!-- Script to automatically trigger deletion when the page loads -->
<script>
    window.addEventListener('load', function() {
        // Extract the 'id' parameter from the URL
        var urlParams = new URLSearchParams(window.location.search);
        var employeeId = urlParams.get('RoleID');
console.log("you have entered deleteEmployee");
        // Make an AJAX request to delete the employee
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './DeleteRolesSrv', true);
        console.log("DeleteRolesSrv called");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('RoleID=' + employeeId);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Handle the response if needed
                var response = xhr.responseText;
                console.log(response); // You can log the response to the console
            }
        };
    });
</script>

<%   response.sendRedirect("roles.jsp"); %>
</body>
</html>
