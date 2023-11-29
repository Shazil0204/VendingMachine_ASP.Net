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
