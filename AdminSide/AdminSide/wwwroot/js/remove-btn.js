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