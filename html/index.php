<?php

    // configuration
    require("../includes/config.php"); 

    // query portfolio database for user
    $rows = CS50::query("SELECT symbol,shares FROM portfolio WHERE user_id = ?", $_SESSION["id"]);
    
    // store all portfolio info of a user in positions 
    $positions = [];
    foreach ($rows as $row)
    {
        $stock = lookup($row["symbol"]);
        if ($stock !== false)
        {
            $positions[] = [
                "name" => $stock["name"],
                "price" => number_format($stock["price"], 4),
                "shares" => $row["shares"],
                "symbol" => $row["symbol"]
            ];
        }
    }
    
    // query users database for user
    $cash = CS50::query("SELECT cash FROM users WHERE id = ?", $_SESSION["id"]);
        
    // render portfolio
    render("portfolio.php", ["title" => "Portfolio", "positions" => $positions, "cash" => $cash]);

?>
