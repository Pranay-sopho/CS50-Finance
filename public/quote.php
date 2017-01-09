<?php

    // configuration
    require("../includes/config.php");
    
    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // else render form
        render("quote_form.php", ["title" => "Quote"]);
    }
    
    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        // validate submission
        if (empty($_POST["symbol"]))
        {
            apologize("You must provide a Stock Symbol.");
        }
        
        // lookup stock symbol
        $stock = lookup($_POST["symbol"]);
        
        // if stock symbol is not found, apologize
        if ($stock == false)
        {
            apologize("You must provide valid Stock Symbol");
        }
        // else show the values
        else
        {
            $value = number_format($stock["price"], 4);
            render("quote.php", ["title" => "Quote", "symbol" => $stock["symbol"], "name" => $stock["name"], "price" => $value]);
        }
    }
