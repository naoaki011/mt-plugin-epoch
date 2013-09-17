<?php
    function smarty_function_mttime2epoch($args, &$ctx) {
        $time    = $args['time'];
        if ( is_numeric($time) && (strlen($time) === 14) ) {
            list($year, $month, $day, $hour, $min, $sec) = sscanf($time, "%04d%02d%02d%02d%02d%02d");
            if (($sec > 59)||($min > 59)||($hour > 23)||($day > 31)||($month > 12)) return '';
            return mktime($hour, $min, $sec, $month, $day, $year);
        } else {
            return '';
        }
    }
?>