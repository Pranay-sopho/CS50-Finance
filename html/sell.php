<?php

    // configuration
    require("../includes/config.php"); 

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // query portfolio database for user
        $rows = CS50::query("SELECT symbol FROM portfolio WHERE user_id = ?", $_SESSION["id"]);
        
        // store symbols of shares owned by a user in symbols 
        $symbols = [];
        foreach ($rows as $row)
        {
            $symbols[] = [
                "symbol" => $row["symbol"]
            ];
        }
        
        // else render form
        render("sell_form.php", ["title" => "Sell", "symbols" => $symbols]);
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        // validate submission
        if (empty($_POST["symbol"]))
        {
            apologize("You must select a Stock Symbol.");
        }
        
        // query portfolio for shares sold
        $sharessold = CS50::query("SELECT shares FROM portfolio WHERE user_id = ? AND symbol = ?", $_SESSION["id"], $_POST["symbol"]);
        
        // delete sold shares record from portfolio
        $result = CS50::query("DELETE FROM portfolio WHERE user_id = ? AND symbol = ?", $_SESSION["id"], $_POST["symbol"]);
        
        // update users cash if shares sold
        if (count($result) == 1)
        {
            // query users for cash
            $cashi = CS50::query("SELECT cash FROM users WHERE id = ?", $_SESSION["id"]);
            
            // find current value of sold stock
            $stock = lookup($_POST["symbol"]);
            $value = number_format($stock["price"], 4);
            
            // update users balance
            $cashf = $cashi[0]["cash"] + $sharessold[0]["shares"] * $value;
            $cashff = number_format($cashf, 4);
            $result2 = CS50::query("UPDATE users SET cash = ? WHERE id = ?", $cashff, $_SESSION["id"]);
            
            if (count($result2) == 1)
            {
                // store current date and time
                $timestamp = CURRENT_TIMESTAMP;
                
                // insert all transaction details in history table
                $result3 = CS50::query("INSERT INTO history (user_id, status, symbol, shares, price, timestamp) VALUES(?, SOLD, ?, ?, ?, ?)", $_SESSION["id"], $_POST["symbol"], $sharessold[0]["shares"], $value, $timestamp);
                
                // redirect to portfolio
                redirect("/");
            }
        }
    }

?>
