<link rel="stylesheet" href="css/style.css">

<?php
$myPDO = new PDO('mysql:host=localhost;dbname=dating site for superheroes', 'root', '');
//var_dump ($myPDO);

//updateret et eksistenrende navn
$update = "UPDATE user
SET Username = 'Fatty'
WHERE id = 1";

$query = $myPDO->prepare( $update );
$query->execute();
$results = $query->fetchAll();


//viser de forskellige vædier
echo $_POST['Username'].$_POST['Gender'].$_POST['Age'].$_POST['Superpowers'];

$sql = "SELECT * FROM user";
$query = $myPDO->prepare( $sql );
$query->execute();
$results = $query->fetchAll();

foreach( $results as $row ){
    
?>
<p class="tekst">
    <?php
  //var_dump( $row );
 
//til at vise brugerens forskellige data;
 echo $row["Username"]."<br>". $row["Age"]."<br>". $row["Superpowers"]."<br>". $row["Gender"]."<br>";
 //til at vise antal likes;
 echo $row["Number of likes"]."<br>"; 
 //til at vise billederne til de forskellige brugere;
 echo '<img src="img/'.$row["Pictures"].'" />'."<br>";
  
?>
<!-- knap til at like en bruger-->
  <button type="submit" class="like-button">Like</button>
<?php 

?>
<button type="text">Message</button>
</p>

</div>
<input type="text" placeholder="comment">
<button id="comment" onclick>Add comment</button>
<?php
}
?>

<!-- sende privat besked -->
<?php    
$st= "SELECT* FROM message WHERE sentto='$user' ORDER BY ID DESC LIMIT 10";

$st= "SELECT*FROM message WHERE sentby='$user' ORDER BY ID DESC LIMIT 10";

$sql = "SELECT * FROM user 
LEFT JOIN message 
ON message.id = user.message_id 
WHERE user.username = '$user' 
AND user.mailbox = 'Out';"

?>


<!-- like og sende gave -->

<!-- kommentere på en andens profil -->


<form action="index.php" method="post">
		<label for="username">Username: </label>
        <input type="text" name="Username" id="name" placeholder="Sexyfox91" maxlength="20">
        <br>
        <br>
		<label for="gender">Gender:</label>
		<input type="text" name="Gender" id="gender" placeholder="female" maxlength="10">
		<br>
        <br>
		<label for="age">Age: </label>
		<input type="number" name="Age" id="age" placeholder="27" maxlength="5">
		<br>
        <br>
		<label for="superpowers">Superpowers: </label>
		<input type="text" name="Superpowers" id="superpowers" placeholder="fly" maxlength="10">
		<br>
        <br>
        <input type="submit" name="submit" value="Update"/>
</form>
