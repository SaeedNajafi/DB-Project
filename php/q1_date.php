<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 1/11/16
 * Time: 7:17 PM
 */

include 'dbconnect.php';

header("Content-Type: text/xml; charset=utf-8");

$date = $_GET["q1_date"];

$output = "<main>";

if (strlen($date) > 0) {

    $command = "call query_1_date ('" . $date . "');";
    if ($result = mysqli_query($db, $command)) {

        while ($row = mysqli_fetch_array($result)) {
            $output = $output .
                "
                <row>
                <num>$row[0]</num>
                </row>
                ";
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


