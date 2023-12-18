<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Parent-Child Table with Toggle</title>
  <style>
    /* Some basic styling for the table */
    table {
      border-collapse: collapse;
      width: 100%;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #f2f2f2;
    }
    .child {
      display: none; /* Hide child rows initially */
    }
    .childTable {
      margin-left: 20px; /* Indent child table */
    }
  </style>
</head>
<body>

<table id="parentTable">
  <thead>
    <tr>
      <th>Parent ID</th>
      <th>Parent Name</th>
    </tr>
  </thead>
  <tbody>
    <tr class="parentRow">
      <td class="toggle">1</td>
      <td class="toggle">Parent A</td>
    </tr>
    <tr class="child">
      <td colspan="2" class="childTable">
        <table>
          <thead>
            <tr>
              <th>Child ID</th>
              <th>Child Name</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1.1</td>
              <td>Child A1</td>
            </tr>
            <tr>
              <td>1.2</td>
              <td>Child A2</td>
            </tr>
            <!-- Add more child records here -->
          </tbody>
        </table>
      </td>
    </tr>
    <!-- Add more parent and child rows here -->
  </tbody>
</table>

<script>
  // Toggle child rows on clicking parent rows
  const parentRows = document.querySelectorAll('.parentRow');

  parentRows.forEach(row => {
    row.addEventListener('click', () => {
      const childRow = row.nextElementSibling;
      childRow.classList.toggle('child');
    });
  });
</script>

</body>
</html>
