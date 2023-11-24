// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

// Function to calculate and update the total price
function updateTotalPrice() {
    var totalPrice = 0;

    // Iterate through each selected item
    $(".selection-showcase .item .price").each(function () {
        var priceText = $(this).text().replace("Price: ", "").trim();
        var price = parseFloat(priceText) || 0; // Convert the price to a number, default to 0 if not a valid number
        totalPrice += price;
    });

    // Display the total price inside the specific <p> element
    $(".selection-showcase section p").text("Total Price: " + totalPrice);
}


$(document).ready(function () {
    $(".buy-item").click(function () {
        var selectedProduct = $(this).data("product");
        var selectedPrice = $(this).data("price");

        // Create new paragraph elements
        var productParagraph = $("<p>").addClass("order-product").text("Selected item: " + (selectedProduct || "undefined"));
        var priceParagraph = $("<p>").addClass("price").text((selectedPrice || "undefined"));

        // Append new paragraphs to the container
        $(".selection-showcase .item").append(productParagraph, priceParagraph);
    });
});


var modal = document.getElementById('loginModal');

var btn = document.getElementById('loginBtn');

var body = document.getElementsByTagName('body');

document.addEventListener('DOMContentLoaded', function() {
    modal.style.display = 'none';
});

btn.onclick = function() {
    modal.style.display = 'block';
}

function closeModal() {
    modal.style.display = 'none';
}

window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = 'none';
        body.style.overflow = 'hidden';
    }
}


function login() {
    var username = document.getElementsByName('username')[0].value;
    var password = document.getElementsByName('password')[0].value;

    var rememberMe = document.getElementsByName('remember')[0].checked;

    alert('Username: ' + username + '\nPassword: ' + password + '\nRemember Me: ' + rememberMe);

    closeModal();
}