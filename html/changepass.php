<?php

    // configuration
    require("../includes/config.php"); 

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // else render form
        render("changepass_form.php", ["title" => "Change Password"]);
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        // validate submission
        if (empty($_POST["old_password"]))
        {
            apologize("You must provide your Old Password.");
        }
        else if (empty($_POST["new_password"]))
        {
            apologize("You must provide your New Password.");
        }
        else if ($_POST["new_password"] != $_POST["confirmation"])
        {
            apologize("You must provide same password twice.");
        }

        // query database for user
        $rows = CS50::query("SELECT * FROM users WHERE id = ?", $_SESSION["id"]);

        // check if old password is correct
        if (count($rows) == 1)
        {
            // first (and only) row
            $row = $rows[0];

            // compare hash of user's input against hash that's in database
            if (password_verify($_POST["password"], $row["hash"]))
            {
                // update new password
                $result = CS50::query("UPDATE users SET hash = ? WHERE id = ?", password_hash($_POST["new_password"], PASSWORD_DEFAULT), $_SESSION["id"]);
                
                // show confirmation form if password updated successfully
                if (count($result) == 1)
                {
                    render("confirm.php", ["title" => "Successfull!!"]);
                }
            }
        }

        // else apologize
        apologize("Invalid old password.");
    }

?>
