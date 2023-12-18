	<!DOCTYPE html>
<html>
<head>
    <title>Delete  Form</title>
</head>
<body>

<!-- Script to automatically trigger deletion when the page loads -->
<script>
    window.addEventListener('load', function() {
        // Extract the 'id' parameter from the URL
        var urlParams = new URLSearchParams(window.location.search);
        var  supplierID = urlParams.get('supplierID');
console.log("you have entered Delete Assets");
        // Make an AJAX request to delete the employee
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './DeleteSupplierSrv', true);
        console.log("DeleteSupplierSrv called");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('supplierID=' + supplierID);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Handle the response if needed
                var response = xhr.responseText;
                console.log(response); // You can log the response to the console
            }
        };
    });
</script>
console.log("you are about to supplier.jsp");
<%   response.sendRedirect("supplier.jsp"); %> 
</body>
</html>
			 		