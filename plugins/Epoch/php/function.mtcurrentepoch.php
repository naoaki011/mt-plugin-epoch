<?php
    function smarty_function_mtcurrentepoch($args, &$ctx) {
        return strtotime("now");
    }
?>