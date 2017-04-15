<?php
header('Content-Type: text/html; charset=utf-8');

$uploaddir = './';
$file = basename($_FILES['userfile']['name']);
$uploadfile = $uploaddir . $file;

echo "username: " . $_POST["username"]."\n";
echo "password: " . $_POST["password"]."\n\n\n";

if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
        echo "Success";
}

?>
