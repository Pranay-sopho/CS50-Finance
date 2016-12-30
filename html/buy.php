<?php

    // configuration
    require("../includes/config.php"); 

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // else render form
        render("buy_form.php", ["title" => "Buy"]);
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        // validate submission
        if (empty($_POST["symbol"]))
        {
            apologize("You must provide a Stock Symbol.");
        }
        else if (empty($_POST["shares"]))
        {
            apologize("You must provide number of shares you want to purchase.");
        }
        else if (!preg_match("/^\d+$/", $_POST["shares"]))
        {
            apologize("You must provide whole shares of stock.");
        }
        
        // lookup stock symbol
        $stock = lookup($_POST["symbol"]);
        
        // if stock symbol is not found, apologize
        if ($stock == false)
        {
            apologize("You must provide valid Stock Symbol");
        }
        // else go forward with purchase
        else
        {
            // calculate total purchase value
            $value = number_format($stock["price"], 4);
            $purchase = number_format($value * $_POST["shares"], 4);
            
            // query users database for cash
            $cashi = CS50::query("SELECT cash FROM users WHERE id = ?", $_SESSION["id"]);
            
            // check if user can afford the stocks
            if ($purchase > $cashi)
            {
                apologize("You don't have enough cash for purchase.");
            }
            else
            {
                // update portfolio
                $result = CS50::query("INSERT INTO portfolio (user_id, symbol, shares) VALUES(?, ?, ?) ON DUPLICATE KEY UPDATE shares = shares + VALUES(?)", $_SESSION["id"], $stock["symbol"], $_POST["shares"], $_POST["shares"]);
                
                // update users cash
                if (count($result) == 1)
                {
                    $cashf = number_format($cashi[0]["cash"] - $purchase, 4);
                    $result2 = CS50::query("UPDATE users SET cash = ? WHERE id = ?", $cashf, $_SESSION["id"]);
                    
                    if (count($result2) == 1)
                    {
                        // redirect to portfolio
                        redirect("/");
                    }
                }
            }
        }
    }

?>
