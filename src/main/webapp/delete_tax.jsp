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
        var expensesId = urlParams.get('TaxID');
console.log("you have entered deleteexpensessrv");
        // Make an AJAX request to delete the employee
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './DeleteTaxSrv', true);
        console.log("deleteexpensessrv called");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('TaxID=' + expensesId);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Handle the response if needed
                var response = xhr.responseText;
                console.log(response); // You can log the response to the console
            }
        };
    });
</script>
console.log("you are about to training.jsp");
<%   response.sendRedirect("empTaxes.jsp"); %>
</body>
</html>
