*** Settings ***
Documentation  This is some basic info about the whole suite
Resource  ../Resources/Common.robot  # for Setup & Teardown
Resource  ../Resources/AmazonApp.robot  # for lower level keywords in test cases
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# pybot -d results tests/Amazon.robot

*** Variables ***
${BROWSER} =  ie
${START_URL} =  https://www.amazon.com
${SEARCH_TERM} =  Ferrari 458
${LOGIN_EMAIL} =  admin@robotrameworktutorial.com
${LOGIN_PASSWORD} =  myPassword1

*** Test Cases ***
Should be able to login
    [Tags]  Login
    AmazonApp.Login  ${LOGIN_EMAIL}  ${LOGIN_PASSWORD}

Logged out user should be able to search for products
    [Tags]  Current
    AmazonApp.Search for Products

Logged out user should be able to view a product
    AmazonApp.Search for Products
    AmazonApp.Select Product from Search Results

Logged out user should be able to add product to cart
    AmazonApp.Search for Products
    AmazonApp.Select Product from Search Results
    AmazonApp.Add Product to Cart

Logged out user should be asked to sign in to check out
    AmazonApp.Search for Products
    AmazonApp.Select Product from Search Results
    AmazonApp.Add Product to Cart
    AmazonApp.Begin Checkout
