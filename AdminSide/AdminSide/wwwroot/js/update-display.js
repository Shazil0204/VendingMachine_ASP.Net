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
            $(".selection-showcase .item").append(productLine, removeButton);
        }
    }

    // Display total price in display
    var totalPrice = calculateTotalPrice();
    $(".display p").text("Total Price: " + totalPrice + " Kr");
}
