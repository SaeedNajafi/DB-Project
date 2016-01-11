<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 1/11/16
 * Time: 8:08 PM
 */


include 'dbconnect.php';

header("Content-Type: text/xml; charset=utf-8");


$date_from = $_GET["q4_date_from"];
$date_to = $_GET["q4_date_to"];

$output = "<main>";

if ((strlen($date_from) > 0) and (strlen($date_to) > 0)) {


    $index = 1;
    $command = " call query_4(' " . $date_from . " ',' " . $date_to . " '); ";
    if ($result = mysqli_query($db, $command)) {

        while ($row = mysqli_fetch_array($result)) {
            $output = $output .
                "
                <row>
                <index>$index</index>
                <player_name>$row[0]</player_name>
                <match_id>$row[1]</match_id>
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

} else {
    $output = $output . "</main>";
    echo $output;
}
include 'dbclose.php';