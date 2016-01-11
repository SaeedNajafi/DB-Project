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
$command = "call query_5();";
if ($result = mysqli_query($db, $command)) {

    while ($row = mysqli_fetch_array($result)) {
        $output = $output .
            "
                <row>
                <index>$index</index>
                <team_name>$row[1]</team_name>
                <won_matches>$row[2]</won_matches>
                <lost_matches>$row[3]</lost_matches>
                <score>$row[4]</score>
                <won_sets>$row[5]</won_sets>
                <lost_sets>$row[6]</lost_sets>
                <set_ratio>$row[7]</set_ratio>
                <won_points>$row[8]</won_points>
                <lost_points>$row[9]</lost_points>
                <point_ratio>$row[10]</point_ratio>
                </row>
                ";

        $index++;
    }
    $output = $output . "</main>";
    mysqli_free_result($result);
    echo $output;
} else {
    echo $output;
}


include 'dbclose.php';