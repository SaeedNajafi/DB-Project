<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 1/11/16
 * Time: 8:08 PM
 */


include 'dbconnect.php';

header("Content-Type: text/xml; charset=utf-8");


$output = "<main>";

$index = 1;
$command = "call query_6();";
if ($result = mysqli_query($db, $command)) {

    while ($row = mysqli_fetch_array($result)) {
        $output = $output .
            "
                <row>
                <index>$index</index>
                <player_name>$row[0]</player_name>
                </row>
                ";

        $index++;
    }
    $output = $output . "</main>";
    mysqli_free_result($result);
    echo $output;
} else {
    $output = $output . "</main>";
    echo $output;
}


include 'dbclose.php';