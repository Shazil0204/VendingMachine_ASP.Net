﻿
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
    var selectedItems = {}; // Object to store selected items and their quantities

    $(".buy-item").click(function () {
        var selectedProduct = $(this).data("product");
        var selectedPrice = $(this).data("price");

        // Check if the item is already selected
        if (selectedItems[selectedProduct]) {
            // If yes, increment the quantity
            selectedItems[selectedProduct].quantity++;
        } else {
            // If no, add a new entry
            selectedItems[selectedProduct] = {
                quantity: 1,
                price: selectedPrice
            };
        }

        // Update the display
        updateDisplay();
    });

    // Event delegation for remove buttons
    $(".selection-showcase").on("click", ".remove-item", function () {
        var selectedProduct = $(this).data("product");

        // Check if the item is selected
        if (selectedItems[selectedProduct]) {
            // If yes, decrement the quantity
            selectedItems[selectedProduct].quantity--;

            // If the quantity becomes 0, remove the item
            if (selectedItems[selectedProduct].quantity === 0) {
                delete selectedItems[selectedProduct];
            }

            // Update the display
            updateDisplay();
        }
    });

    function updateDisplay() {
        // Clear previous content
        $(".selection-showcase .item").empty();

        // Display selected items in selection-showcase
        for (var product in selectedItems) {
            if (selectedItems.hasOwnProperty(product)) {
                var quantity = selectedItems[product].quantity;

                var productLine = $("<p>").addClass("order-product").text(quantity + "x " + (product || "undefined"));

                // Create remove button
                var removeButton = $("<button>").addClass("remove-item").text("Remove").data("product", product);

                // Append elements to the container
                $(".selection-showcase .item").append(productLine, removeButton)
            }
        }

        // Display total price in display
        var totalPrice = calculateTotalPrice();
        $(".selection-container .display .total").text("Total Price: " + totalPrice + " Kr");
    }

    function calculateTotalPrice() {
        var totalPrice = 0;

        for (var product in selectedItems) {
            if (selectedItems.hasOwnProperty(product)) {
                var quantity = selectedItems[product].quantity;
                var price = selectedItems[product].price;

                totalPrice += quantity * price;
            }
        }

        return totalPrice;
    }

    var modal = document.getElementById('loginModal');
    var btn = document.getElementById('loginBtn');
    var body = document.getElementsByTagName('body');

    document.addEventListener('DOMContentLoaded', function () {
        modal.style.display = 'none';
    });


    // Event listener for the "Clear" button
    $(".clear-item-btn").on("click", function () {
        // Clear the selectedItems object
        selectedItems = {};

        // Remove all selected items from the DOM
        $(".selection-showcase .item").each(function () {
            $(this).empty(); // or $(this).remove() to remove the entire item container
        });

        // Update the display
        updateDisplay();
    });
});


        var modal = document.getElementById('loginModal');

        var btn = document.getElementById('loginBtn');
        
        var body = document.getElementsByTagName('body');

        var span = document.getElementsByTagName('span');
    
        $(document).ready(function () {
            modal.style.display = 'none';
        });

        document.getElementById('loginModal').addEventListener('click', function(event) {
            if (event.target.classList.contains('close-modalI')) {
               closeModal();
            }
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
};

$(".purchase-item-btn").on("click", function () {
    // Assuming you have a balance variable defined somewhere
    var balance = 1000; // Replace this with the actual balance variable

    var totalPrice = calculateTotalPrice();

    // Check if the balance is sufficient for the purchase
    if (totalPrice <= balance) {
        // Deduct the total price from the balance
        balance -= totalPrice;

        // Clear the selectedItems object
        selectedItems = {};

        // Remove all selected items from the DOM
        $(".selection-showcase .item").each(function () {
            $(this).empty(); // or $(this).remove() to remove the entire item container
        });

        // Update the display
        updateDisplay();

        // Update the balance display (replace this with the actual code to update the balance in your UI)
        $(".balance-display").text("Balance: " + balance + " Kr");

        // Display a success message or perform other actions as needed
        alert("Purchase successful!");
    } else {
        // Display an error message or perform other actions as needed
        alert("Insufficient balance. Please add funds.");
    }
});