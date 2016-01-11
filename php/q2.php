<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 1/11/16
 * Time: 7:38 PM
 */

include 'dbconnect.php';

header("Content-Type: text/xml; charset=utf-8");


$date = $_GET["q2_date"];

$output = "<main>";

if (strlen($date) > 0) {


    $index = 1;
    $command = "call query_2('" . $date . "');";
    if ($result = mysqli_query($db, $command)) {

        while ($row = mysqli_fetch_array($result)) {
            $output = $output .
                "
                <row>
                <index>$index</index>
                <player_name>$row[0]</player_name>
                <player_birth_date>$row[2]</player_birth_date>
                <team_name>$row[1]</team_name>
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