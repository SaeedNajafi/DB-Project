/**
 * Created by root on 1/12/16.
 */




q11();
function xmlsynchronousAjax(source) {

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", source, false);
    xmlhttp.send("");

    if (xmlhttp.status == 200) {
        return xmlhttp.responseXML;
    }

}

function textsynchronousAjax(source) {

    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", source, false);
    xmlhttp.send("");

    if (xmlhttp.status == 200) {
        return xmlhttp.responseText;
    }

}

function q11() {
    var to_show = textsynchronousAjax("./q1_date.html");
    document.getElementById("inner_div").innerHTML = to_show;
}

function q12() {
    var to_show = textsynchronousAjax("./q1_stadium.html");
    document.getElementById("inner_div").innerHTML = to_show;
}

function q2() {
    var to_show = textsynchronousAjax("./q2.html");
    document.getElementById("inner_div").innerHTML = to_show;
}

function q3() {
    var to_show = textsynchronousAjax("./q3.html");
    document.getElementById("inner_div").innerHTML = to_show;
}

function q4() {
    var to_show = textsynchronousAjax("./q4.html");
    document.getElementById("inner_div").innerHTML = to_show;
}

function q5() {

    var xml = xmlsynchronousAjax("../php/q5.php");
    var to_show_html = textsynchronousAjax("../html/q5.html");

    var to_show_index = xml.documentElement.getElementsByTagName("index");

    var to_show_team_name = xml.documentElement.getElementsByTagName("team_name");

    var to_show_won_matches = xml.documentElement.getElementsByTagName("won_matches");

    var to_show_lost_matches = xml.documentElement.getElementsByTagName("lost_matches");

    var to_show_score = xml.documentElement.getElementsByTagName("score");

    var to_show_set_ratio = xml.documentElement.getElementsByTagName("set_ratio");

    var to_show_lost_sets = xml.documentElement.getElementsByTagName("lost_sets");

    var to_show_won_sets = xml.documentElement.getElementsByTagName("won_sets");

    var to_show_point_ratio = xml.documentElement.getElementsByTagName("point_ratio");

    var to_show_lost_points = xml.documentElement.getElementsByTagName("lost_points");

    var to_show_won_points = xml.documentElement.getElementsByTagName("won_points");

    var str = to_show_html;

    for (var i = 0; i < to_show_index.length; i++) {

        str = str + '<tr bgcolor="#ecfafa">';
        str = str + '<td>' + to_show_index[i].firstChild.nodeValue + '</td>';
        str = str + '<td style="text-align:left;">' + to_show_team_name[i].firstChild.nodeValue + '</td>';
        str = str + '<td><b>' + to_show_won_matches[i].firstChild.nodeValue + '</b></td>';
        str = str + '<td>' + to_show_lost_matches[i].firstChild.nodeValue + '</td>';
        str = str + '<td>' + to_show_score[i].firstChild.nodeValue + '</td>';
        str = str + '<td>' + to_show_won_sets[i].firstChild.nodeValue + '</td>';
        str = str + '<td>' + to_show_lost_sets[i].firstChild.nodeValue + '</td>';
        str = str + '<td>' + to_show_set_ratio[i].firstChild.nodeValue + '</td>';
        str = str + '<td>' + to_show_won_points[i].firstChild.nodeValue + '</td>';
        str = str + '<td>' + to_show_lost_points[i].firstChild.nodeValue + '</td>';
        str = str + '<td>' + to_show_point_ratio[i].firstChild.nodeValue + '</td>';
        str = str + '</tr>';
    }

    str = str + '</tbody></table>';

    document.getElementById("inner_div").innerHTML = str;

}

function q6() {
    var to_show = textsynchronousAjax("./q6.html");
    document.getElementById("inner_div").innerHTML = to_show;
}

function q7() {
    var to_show = textsynchronousAjax("./q7.html");
    document.getElementById("inner_div").innerHTML = to_show;
}

function q8() {
    var to_show = textsynchronousAjax("./q8.html");
    document.getElementById("inner_div").innerHTML = to_show;
}

function send11_query() {
    var to_send = document.getElementById("q1_date").value;
    var xml = xmlsynchronousAjax("../php/q1_date.php?q1_date=" + to_send);
    var to_show = xml.documentElement.getElementsByTagName("num")[0].firstChild.nodeValue;
    document.getElementById("q1_date_out").value = to_show;
}

function send12_query() {
    var to_send = document.getElementById("q1_stadium").value;
    var xml = xmlsynchronousAjax("../php/q1_stadium.php?q1_stadium=" + to_send);
    var to_show = xml.documentElement.getElementsByTagName("num")[0].firstChild.nodeValue;
    document.getElementById("q1_stadium_out").value = to_show;
}

function send2_query() {

    var to_send = document.getElementById("q2_date").value;
    var xml = xmlsynchronousAjax("../php/q2.php?q2_date=" + to_send);
    var to_show_index = xml.documentElement.getElementsByTagName("index");
    var to_show_player_name = xml.documentElement.getElementsByTagName("player_name");
    var to_show_player_birth_date = xml.documentElement.getElementsByTagName("player_birth_date");
    var to_show_team_name = xml.documentElement.getElementsByTagName("team_name");
    document.getElementsByClassName("inputs")[1].innerHTML = "";

    for (var i = 0; i < to_show_index.length; i++) {

        var input_element1 = document.createElement("input");
        var att1;
        att1 = document.createAttribute("type");
        att1.value = "text";
        input_element1.setAttributeNode(att1);
        att1 = document.createAttribute("disabled");
        att1.value = "true";
        input_element1.setAttributeNode(att1);
        att1 = document.createAttribute("class");
        att1.value = "out_q2_index";
        input_element1.setAttributeNode(att1);
        input_element1.value = to_show_index[i].firstChild.nodeValue;


        var input_element2 = document.createElement("input");
        var att2;
        att2 = document.createAttribute("type");
        att2.value = "text";
        input_element2.setAttributeNode(att2);
        att2 = document.createAttribute("disabled");
        att2.value = "true";
        input_element2.setAttributeNode(att2);
        att2 = document.createAttribute("class");
        att2.value = "out_q2_player_name";
        input_element2.setAttributeNode(att2);
        input_element2.value = to_show_player_name[i].firstChild.nodeValue;


        var input_element3 = document.createElement("input");
        var att3;
        att3 = document.createAttribute("type");
        att3.value = "text";
        input_element3.setAttributeNode(att3);
        att3 = document.createAttribute("disabled");
        att3.value = "true";
        input_element3.setAttributeNode(att3);
        att3 = document.createAttribute("class");
        att3.value = "out_q2_date";
        input_element3.setAttributeNode(att3);
        input_element3.value = to_show_player_birth_date[i].firstChild.nodeValue;


        var input_element4 = document.createElement("input");
        var att4;
        att4 = document.createAttribute("type");
        att4.value = "text";
        input_element4.setAttributeNode(att4);
        att4 = document.createAttribute("disabled");
        att4.value = "true";
        input_element4.setAttributeNode(att4);
        att4 = document.createAttribute("class");
        att4.value = "out_q2_team_name";
        input_element4.setAttributeNode(att4);
        input_element4.value = to_show_team_name[i].firstChild.nodeValue;

        document.getElementsByClassName("inputs")[1].appendChild(input_element1);
        document.getElementsByClassName("inputs")[1].appendChild(input_element2);
        document.getElementsByClassName("inputs")[1].appendChild(input_element3);
        document.getElementsByClassName("inputs")[1].appendChild(input_element4);


    }
}


function send3_query() {

    var to_send = document.getElementById("q3_player_name").value;
    var xml = xmlsynchronousAjax("../php/q3.php?q3_player_name=" + to_send);
    var to_show_index = xml.documentElement.getElementsByTagName("index");
    var to_show_referee_name = xml.documentElement.getElementsByTagName("referee_name");
    document.getElementsByClassName("inputs")[1].innerHTML = "";

    for (var i = 0; i < to_show_index.length; i++) {

        var input_element1 = document.createElement("input");
        var att1;
        att1 = document.createAttribute("type");
        att1.value = "text";
        input_element1.setAttributeNode(att1);
        att1 = document.createAttribute("disabled");
        att1.value = "true";
        input_element1.setAttributeNode(att1);
        att1 = document.createAttribute("class");
        att1.value = "out_index";
        input_element1.setAttributeNode(att1);
        input_element1.value = to_show_index[i].firstChild.nodeValue;


        var input_element2 = document.createElement("input");
        var att2;
        att2 = document.createAttribute("type");
        att2.value = "text";
        input_element2.setAttributeNode(att2);
        att2 = document.createAttribute("disabled");
        att2.value = "true";
        input_element2.setAttributeNode(att2);
        att2 = document.createAttribute("class");
        att2.value = "out_name";
        input_element2.setAttributeNode(att2);
        input_element2.value = to_show_referee_name[i].firstChild.nodeValue;


        document.getElementsByClassName("inputs")[1].appendChild(input_element1);
        document.getElementsByClassName("inputs")[1].appendChild(input_element2);


    }

}

function send4_query() {

    var to_send1 = document.getElementById("q4_date_from").value;
    var to_send2 = document.getElementById("q4_date_to").value;

    var xml = xmlsynchronousAjax("../php/q4.php?q4_date_from=" + to_send1 + "&q4_date_to=" + to_send2);
    var to_show_index = xml.documentElement.getElementsByTagName("index");
    var to_show_player_name = xml.documentElement.getElementsByTagName("player_name");
    var to_show_match_id = xml.documentElement.getElementsByTagName("match_id");

    document.getElementsByClassName("inputs")[1].innerHTML = "";

    for (var i = 0; i < to_show_index.length; i++) {

        var input_element1 = document.createElement("input");
        var att1;
        att1 = document.createAttribute("type");
        att1.value = "text";
        input_element1.setAttributeNode(att1);
        att1 = document.createAttribute("disabled");
        att1.value = "true";
        input_element1.setAttributeNode(att1);
        att1 = document.createAttribute("class");
        att1.value = "out_q4_index";
        input_element1.setAttributeNode(att1);
        input_element1.value = to_show_index[i].firstChild.nodeValue;


        var input_element2 = document.createElement("input");
        var att2;
        att2 = document.createAttribute("type");
        att2.value = "text";
        input_element2.setAttributeNode(att2);
        att2 = document.createAttribute("disabled");
        att2.value = "true";
        input_element2.setAttributeNode(att2);
        att2 = document.createAttribute("class");
        att2.value = "out_q4_name";
        input_element2.setAttributeNode(att2);
        input_element2.value = to_show_player_name[i].firstChild.nodeValue;


        var input_element3 = document.createElement("input");
        var att3;
        att3 = document.createAttribute("type");
        att3.value = "text";
        input_element3.setAttributeNode(att3);
        att3 = document.createAttribute("disabled");
        att3.value = "true";
        input_element3.setAttributeNode(att3);
        att3 = document.createAttribute("class");
        att3.value = "out_q4_id";
        input_element3.setAttributeNode(att3);
        input_element3.value = to_show_match_id[i].firstChild.nodeValue;

        document.getElementsByClassName("inputs")[1].appendChild(input_element1);
        document.getElementsByClassName("inputs")[1].appendChild(input_element2);
        document.getElementsByClassName("inputs")[1].appendChild(input_element3);

    }

}


function send6_query() {


    var xml = xmlsynchronousAjax("../php/q6.php");
    var to_show_index = xml.documentElement.getElementsByTagName("index");
    var to_show_player_name = xml.documentElement.getElementsByTagName("player_name");
    document.getElementsByClassName("inputs")[1].innerHTML = "";

    for (var i = 0; i < to_show_index.length; i++) {

        var input_element1 = document.createElement("input");
        var att1;
        att1 = document.createAttribute("type");
        att1.value = "text";
        input_element1.setAttributeNode(att1);
        att1 = document.createAttribute("disabled");
        att1.value = "true";
        input_element1.setAttributeNode(att1);
        att1 = document.createAttribute("class");
        att1.value = "out_index";
        input_element1.setAttributeNode(att1);
        input_element1.value = to_show_index[i].firstChild.nodeValue;


        var input_element2 = document.createElement("input");
        var att2;
        att2 = document.createAttribute("type");
        att2.value = "text";
        input_element2.setAttributeNode(att2);
        att2 = document.createAttribute("disabled");
        att2.value = "true";
        input_element2.setAttributeNode(att2);
        att2 = document.createAttribute("class");
        att2.value = "out_name";
        input_element2.setAttributeNode(att2);
        input_element2.value = to_show_player_name[i].firstChild.nodeValue;


        document.getElementsByClassName("inputs")[1].appendChild(input_element1);
        document.getElementsByClassName("inputs")[1].appendChild(input_element2);


    }

}

function send7_query() {


    var xml = xmlsynchronousAjax("../php/q7.php");
    var to_show_index = xml.documentElement.getElementsByTagName("index");
    var to_show_player_name = xml.documentElement.getElementsByTagName("player_name");
    document.getElementsByClassName("inputs")[1].innerHTML = "";

    for (var i = 0; i < to_show_index.length; i++) {

        var input_element1 = document.createElement("input");
        var att1;
        att1 = document.createAttribute("type");
        att1.value = "text";
        input_element1.setAttributeNode(att1);
        att1 = document.createAttribute("disabled");
        att1.value = "true";
        input_element1.setAttributeNode(att1);
        att1 = document.createAttribute("class");
        att1.value = "out_index";
        input_element1.setAttributeNode(att1);
        input_element1.value = to_show_index[i].firstChild.nodeValue;


        var input_element2 = document.createElement("input");
        var att2;
        att2 = document.createAttribute("type");
        att2.value = "text";
        input_element2.setAttributeNode(att2);
        att2 = document.createAttribute("disabled");
        att2.value = "true";
        input_element2.setAttributeNode(att2);
        att2 = document.createAttribute("class");
        att2.value = "out_name";
        input_element2.setAttributeNode(att2);
        input_element2.value = to_show_player_name[i].firstChild.nodeValue;


        document.getElementsByClassName("inputs")[1].appendChild(input_element1);
        document.getElementsByClassName("inputs")[1].appendChild(input_element2);


    }

}


function send8_query() {

    var xml = xmlsynchronousAjax("../php/q8.php");
    var to_show_index = xml.documentElement.getElementsByTagName("index");
    var to_show_team_name = xml.documentElement.getElementsByTagName("team_name");
    document.getElementsByClassName("inputs")[1].innerHTML = "";

    for (var i = 0; i < to_show_index.length; i++) {

        var input_element1 = document.createElement("input");
        var att1;
        att1 = document.createAttribute("type");
        att1.value = "text";
        input_element1.setAttributeNode(att1);
        att1 = document.createAttribute("disabled");
        att1.value = "true";
        input_element1.setAttributeNode(att1);
        att1 = document.createAttribute("class");
        att1.value = "out_index";
        input_element1.setAttributeNode(att1);
        input_element1.value = to_show_index[i].firstChild.nodeValue;


        var input_element2 = document.createElement("input");
        var att2;
        att2 = document.createAttribute("type");
        att2.value = "text";
        input_element2.setAttributeNode(att2);
        att2 = document.createAttribute("disabled");
        att2.value = "true";
        input_element2.setAttributeNode(att2);
        att2 = document.createAttribute("class");
        att2.value = "out_name";
        input_element2.setAttributeNode(att2);
        input_element2.value = to_show_team_name[i].firstChild.nodeValue;


        document.getElementsByClassName("inputs")[1].appendChild(input_element1);
        document.getElementsByClassName("inputs")[1].appendChild(input_element2);

    }

}

