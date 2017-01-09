<?php

    // configuration
    require("../includes/config.php"); 

    // query history database for user
    $rows = CS50::query("SELECT * FROM history WHERE user_id = ?", $_SESSION["id"]);
    
    // store all history info of a user in positions 
    $positions = [];
    foreach ($rows as $row)
    {
            $positions[] = [
                "status" => $row["status"],
                "symbol" => $row["symbol"],
                "shares" => $row["shares"],
                "price" => $row["price"],
                "timestamp" => $row["timestamp"]
            ];
    }
        
    // render portfolio
    render("history.php", ["title" => "History", "positions" => $positions]);

?>
