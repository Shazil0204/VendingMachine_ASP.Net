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
};