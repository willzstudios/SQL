<!DOCTYPE html>
<html>
<head>
<style>

table 
{
  border-spacing: 1;
  width: 100%;
  border: 1px solid #ddd;
}

th 
{
  cursor: pointer;
}

th, td 
{
  text-align: left;
  padding: 16px;s
}

tr:nth-child(even) 
{
  background-color: #f2f2f2
}
</style>
</head>
<body>

<!-- adding this bit to make the table clicka switch sortable -->
<p><strong>Click the headers to sort the table.</strong></p>
<p>The first time you click, the sorting direction is ascending (A to Z).</p>
<p>Click again, and the sorting direction will be descending (Z to A):</p>
<p>Work in Progress: trying to sort numbers, and enums</p>
<table id="myTable">
<!-- adding this bit to make the table clicka switch sortable -->   

<?php
$servername = "localhost";
$username = "guest";
$password = "password";
$dbname = "database";

// Create connection to MySQL database
$conn = new mysqli($servername, $username, $password, $dbname); 

// Check connection
if ($conn->connect_error) // "->" in PHP means it's calling a method from an instantiated class - in this case the class mysqli. and i think "connect_error" is a method within mysqli, which provides an error message on the connection error if there is one
{
    echo "ERROR: couldn't connect do database!";
    die("Connection failed: " . $conn->connect_error);
}

///////////SQL section
//I just had an idea instead of debugging within Cpanel's FileManager's editor, let's just use phpMyAdmin, and see ifi the QUERY is written propertly

//you can format the date column by replacing DateStartedLearning with "date_format(DateStartedLearning, '%d-%m-%Y') AS DateStartedLearning"
$sql = "SELECT ProgrammingLanguage, Expertise, DateStartedLearning, Interest, `Project Experience/Applications` FROM Languages"; 
$result = $conn->query($sql); //ohh actually it's pasting a string into the query method of PHP's mysqli class.

if (!$result) //debugging if Query made is incorrect
{
    trigger_error('Invalid query: ' . $conn->error);
}

//apparently closing tags are completly optional in HTML???
if ($result->num_rows > 0) //if mysqli.num_rows($result) returns greater than 0
{   //creating the HTML table, autofitting table width to 100% of browser width with border of 6px? from the sides

    //changing <th>Programming Language</th> to:
    //<th onclick="sortTable(0)">Programming Language</th>, for clickability, to link to our JavaScript function below
    //actually you'll need escape keys (backslash) for the quotation marks.
    //<th onclick=\"sortTable(0)\">Programming Language</th>
    //i think referencing the javascript here might not work if echoed?? nah should work right
    echo 
    "   <tr>
            <th onclick=\"sortTable(0)\">Programming Language</th>
            <th onclick=\"sortTable(1)\">Expertise</th>
            <th onclick=\"sortTable(2)\">Date Started Learning</th>
            <th onclick=\"sortTable(3)\">Interest</th>
            <th onclick=\"sortTable(4)\">Project Experience/Applications</th>
        </tr>"; 
    //tr defines a row in a HTML table
    //th defines a header cell in a HTML table
    //</> in HTML represents closing a part/bit/body/section-of-code?
    
    // output data of each row
    //what is fetch_assoc() and how does it work?
    while($row = $result->fetch_assoc()) 
    {
        //<td> defines a standard data cell in a HTML table
        //i think everytime <tr> is used we're going to the NEXT row
        echo "<tr>";
        echo "<td>" . $row["ProgrammingLanguage"]."</td>";
        echo "<td>" . $row["Expertise"]. "</td>";
        
        echo "<td>" . $row["DateStartedLearning"]. "</td>"; //why is this line producing a PHP error: "undefined index" ?? THE COLUMN NAME has to match the actual name here you idiot!
        echo "<td>" . $row["Interest"]. "</td>";
        echo "<td>" . $row["Project Experience/Applications"]. "</td>";
        echo "</tr>";
    }
    echo "</table>";
} 
else 
{
  echo "0 results";
}
$conn->close();
?>

<!-- trying some JavaSript for Sorting HTML table, woah this is a very specific format.. -->
<script> //using JavaScript
function sortTable(n) //creating a JavaScript function/method. up above in the echoed HTML we've called this function with parameters 0 and 1. for us we need up to 4,5?
{
    //i don't get why we don't bother declaring variable types here:
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("myTable");
  switching = true; //bool switching = True;
  //Set the sorting direction to ascending:
  dir = "asc"; //string dir = "asc"
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) 
  {
    //start by saying: no switching is done:
    switching = false; //bool switching = false;
    rows = table.rows;
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) 
    {
      //start by saying there should be no switching:
      shouldSwitch = false; //bool shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[n]; 
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /*check if the two rows should switch place,
      based on the direction, asc or desc:*/
      if (dir == "asc") 
      {
          //interesting string/text comparison here?
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) 
        {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      } 
      else if (dir == "desc") 
      {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) 
        {
          //if so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) 
    {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      //Each time a switch is done, increase this count by 1:
      switchcount ++;      
    } else {
      /*If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again.*/
      if (switchcount == 0 && dir == "asc") 
      {
        dir = "desc"; //string dir = "desc"
        switching = true;
      }
    }
  }
}
</script>

</body>
</html>
