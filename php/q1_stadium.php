<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 1/11/16
 * Time: 7:17 PM
 */

include 'dbconnect.php';

header("Content-Type: text/xml; charset=utf-8");

$stadium = $_GET["q1_stadium"];

$output = "<main>";

if (strlen($stadium) > 0) {

    $command = "call query_1_name ('" . $stadium . "');";
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