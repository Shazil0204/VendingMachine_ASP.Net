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
    $(".display .total").text("Total Price: " + totalPrice + " Kr");
}

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
                $(".selection-showcase .item").append(productLine, removeButton);
            }
        }
    
        // Display total price in display
        var totalPrice = calculateTotalPrice();
        $(".display p").text("Total Price: " + totalPrice + " Kr");
    }


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
        }
        $(document).ready(function () {
            // Event listener for the "Clear" button
            $(".clear-item-btn").on("click", function () {
                // Remove all selected items from the DOM
                $(".selection-showcase .item").each(function() {
                    $(this).empty(); // or $(this).remove() to remove the entire item container
                });
        
                // Clear the selectedItems object
                selectedItems = {};
        
                // Update the display
                updateDisplay();
            });
        
    });