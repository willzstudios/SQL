<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>
<body>

<?php
$servername = "localhost";
$username = "guyest";
$password = "password";
$dbname = "database";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname); //need to connect to database ofcourse!

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
    echo 
    "<table width=100% border='6'> 
        <tr>
            <th>Programming Language</th>
            <th>Expertise</th>
            <th>Date Started Learning</th>
            <th>Interest</th>
            <th>Project Experience/Applications</th>
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
        
        echo "<td>" . $row["DateStartedLearning"]. "</td>"; //why is this line producing a PHP error: "undefined index" ?? I think it might have something to do with having null values or the Column title is WRONG? LOLFKENL - THE COLUMN NAME has to match the actual name here you idiot!
        echo "<td>" . $row["Interest"]. "</td>";
        echo "<td>" . $row["Project Experience/Applications"]. "</td>"; //so this column is now spelt correctly however it is returning the column title, not the column value?
        echo "</tr>";
    }
    echo "</table>";
    /* This section prints out each row of values as strings
  // output data of each row
  while($row = $result->fetch_assoc()) //where did $row come from is it like a keyword/method within the class mysqli, or a defined variable within method "num_rows?"
  {
    echo $row["ProgrammingLanguage"]
    . " - Expertise: ".$row["Expertise"]
    .$row["DateStartedLearning"]
    ."Interest: " .$row["Interest"]
    ."Project Experience/Applications :" .$row["Project Experience/Applications"]
    . "<br>";
  } //what are all the dots?: dot is a string concatenator in PHP
    //<br> is "carriage return" in HTML aka new line like \r\n in C# or Console.WriteLine()
    */
} 
else 
{
  echo "0 results"; //ok since we're going straight here. we might not be connecting to database.
}
$conn->close();
?>

</body>
</html>
