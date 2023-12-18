<%-- <!DOCTYPE html>
<html>
<head>
    <title>Delete Assets Form</title>
</head>
<body>

<!-- Script to automatically trigger deletion when the page loads -->
<script>
    window.addEventListener('load', function() {
        // Extract the 'id' parameter from the URL
        var urlParams = new URLSearchParams(window.location.search);
        var  Assets_ID = urlParams.get('Id');
console.log("you have entered Delete Assets");
        // Make an AJAX request to delete the employee
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './DeleteAssetSrv', true);
        console.log("DeleteAssetSrv called");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('assetId=' + Assets_ID);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Handle the response if needed
                var response = xhr.responseText;
                console.log(response); // You can log the response to the console
            }
        };
    });
</script>
console.log("you are about to employee.jsp");
<%   response.sendRedirect("Assets.jsp"); %> 
</body>
</html>

 --%>
 
 
 
 
<%-- <!DOCTYPE html>
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
        var employeeId = urlParams.get('id');
console.log("you have entered deleteEmployee");
        // Make an AJAX request to delete the employee
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './DeleteAssetSrv', true);
        console.log("deleteDeleteAssetSrv called");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('id=' + employeeId);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Handle the response if needed
                var response = xhr.responseText;
                console.log(response); // You can log the response to the console
            }
        };
    });
</script>

<%   response.sendRedirect("Assets.jsp"); %>
</body>
</html>
 --%>
			 	
			 	
			 	
			 	<!-- ... your HTML code ... -->

<script>
    window.addEventListener('load', function() {
        var urlParams = new URLSearchParams(window.location.search);
        var id = urlParams.get('id');

        var xhr = new XMLHttpRequest();
        xhr.open('POST', './DeleteAssetSrv', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('id=' + id);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = xhr.responseText;
                console.log(response);

                // Redirect after successful deletion
                window.location.href = "Assets.jsp";
            }
        };
    });
</script>
			 		