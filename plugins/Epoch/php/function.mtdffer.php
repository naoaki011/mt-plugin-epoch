<?php
    function smarty_function_mtdffer($args, &$ctx) {
        $from = $args['from'];
        if ($from == 'current') {
            $from_ts = strtotime("now");
        } else {
            if ( is_numeric($from) && (strlen($from) === 14) ) {
                list($year, $month, $day, $hour, $min, $sec) = sscanf($from, "%04d%02d%02d%02d%02d%02d");
                if (($sec > 59)||($min > 59)||($hour > 23)||($day > 31)||($month > 12)) return '';
                $from_ts = mktime($hour, $min, $sec, $month, $day, $year);
            } else {
                $from_ts = '';
            }
        }
        $to = $args['to'];
        if ($to == 'current') {
            $to_ts = strtotime("now");
        } else {
            if ( is_numeric($to) && (strlen($to) === 14) ) {
                list($year, $month, $day, $hour, $min, $sec) = sscanf($to, "%04d%02d%02d%02d%02d%02d");
                if (($sec > 59)||($min > 59)||($hour > 23)||($day > 31)||($month > 12)) return '';
                $to_ts = mktime($hour, $min, $sec, $month, $day, $year);
            } else {
                $to_ts = '';
            }
        }
        $output    = $args['output'];
        $return = $to_ts - $from_ts;
        if (($output == 'minutes')||($output == 'min')) {
            $return = floor( $return / 60 );
        }
        if ($output == 'hour') {
            $return = floor( $return / 3600 );
        }
        if ($output == 'day') {
            $return = floor( $return / 86400 );
        }
        return $return;
    }
?>