<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 1/11/16
 * Time: 8:08 PM
 */


include 'dbconnect.php';

header("Content-Type: text/xml; charset=utf-8");


$player_name = $_GET["q3_player_name"];

$output = "<main>";

if (strlen($player_name) > 0) {


    $index = 1;
    $command = "call query_3('" . $player_name . "');";
    if ($result = mysqli_query($db, $command)) {

        while ($row = mysqli_fetch_array($result)) {
            $output = $output .
                "
                <row>
                <index>$index</index>
                <referee_name>$row[0]</referee_name>
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