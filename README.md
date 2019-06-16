# This is a demo for a log in and log out UI automated smoke test for Airbnb using XCUITest.

## To run your test you would need to have a valid email and password for the airbnb. You have to run it on a real device with Airbnb app already installed and in a clean state: meaning no previously logged in users were deteced. 
### Method .typeText() is not working for this app. I created a helper function that would type(text: String) for your email. For your password there's a similar function but you would need to specify when you type nubers/special characters and when you type letters. 
### This is just a simple demo how to login into the app. I am not handling edge cases or any other cases after user is logged in. Feel free to have fun with it and add more logic to it. 



