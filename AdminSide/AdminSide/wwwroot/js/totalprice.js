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