import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:fooddelivery/models/cart_item.dart';
import 'package:intl/intl.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier{
  // list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Classic Cheeseburger",
      description:
        "A juicy patty with melted cheddar, lettuce, tomato, and a hint of onion",
      imagePath: "lib/images/burgers/classic cheeseburger.webp",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Extra cheese", price: 0.99),
      ],
    ),
    Food(
      name: "Spicy Inferno Burger",
      description:
          "Turn up the heat with this fiery burger featuring a beef patty topped with pepper jack cheese, spicy chipotle mayo, jalapeños, and crispy onions. Served on a toasted sesame seed bun.",
      imagePath: "lib/images/burgers/Spicy Inferno Burger.webp",
      price: 10.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Guacamole", price: 1.99),
        Addon(name: "Sriracha Drizzle", price: 0.50),
        Addon(name: "Fried Egg", price: 1.25),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description:
      "A hearty delight with a smoky beef patty, melted cheddar, crispy bacon, BBQ sauce, and onion rings, all layered in a toasted potato bun.",
      imagePath: "lib/images/burgers/BBQ Bacon Burger.jpg",
      price: 11.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Sweet Pickles", price: 0.75),
        Addon(name: "Coleslaw", price: 1.00),
        Addon(name: "Double Bacon", price: 1.29),
      ],
    ),
    Food(
      name: "Veggie Delight Burger",
      description:
      "A plant-based patty topped with fresh avocado, vegan mayo, arugula, and tomato slices, served in a whole-grain bun.",
      imagePath: "lib/images/burgers/Veggie Delight Burger.jpeg",
      price: 9.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Grilled Mushrooms", price: 1.25),
        Addon(name: "Caramelized Onions", price: 0.75),
        Addon(name: "Vegan Cheese", price: 1.00),
      ],
    ),
    Food(
      name: "Gourmet Truffle Burger",
      description:
      "A luxurious burger featuring a premium patty, truffle aioli, brie cheese, arugula, and caramelized onions, served in a toasted brioche bun.",
      imagePath: "lib/images/burgers/Gourmet Truffle Burger.png",
      price: 14.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Brie", price: 2.00),
        Addon(name: "Black Truffle Shavings", price: 3.50),
        Addon(name: "Garlic Aioli", price: 0.75),
      ],
    ),

    //salads
    Food(
      name: "Caesar Salad",
      description:
      "Crisp romaine lettuce tossed with creamy Caesar dressing, parmesan cheese, and crunchy croutons.",
      imagePath: "lib/images/salads/Caesar salad.webp",
      price: 7.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 2.99),
        Addon(name: "Shrimp", price: 3.99),
        Addon(name: "Extra Parmesan", price: 0.99),
      ],
    ),
    Food(
      name: "Greek Salad",
      description:
      "A refreshing mix of cucumbers, tomatoes,  olives, red onions, and feta cheese, dressed with olive oil and herbs.",
      imagePath: "lib/images/salads/Greek Salad.jpg",
      price: 8.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Lamb", price: 4.49),
        Addon(name: "Pita Bread", price: 1.99),
        Addon(name: "Extra Feta", price: 1.50),
      ],
    ),
    Food(
      name: "Cobb Salad",
      description:
      "A hearty salad with mixed greens, grilled chicken, crispy bacon, avocado, boiled egg, and blue cheese crumbles.",
      imagePath: "lib/images/salads/Cobb Salad.jpg",
      price: 9.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Avocado", price: 1.99),
        Addon(name: "Extra Bacon", price: 1.50),
        Addon(name: "Ranch Dressing", price: 0.75),
      ],
    ),
    Food(
      name: "Asian Sesame Salad",
      description:
      "A vibrant blend of mixed greens, shredded carrots, mandarin oranges, crispy wontons, and sesame ginger dressing.",
      imagePath: "lib/images/salads/Asian Sesame Salad.jpg",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Salmon", price: 4.99),
        Addon(name: "Toasted Almonds", price: 1.25),
        Addon(name: "Extra Wontons", price: 0.99),
      ],
    ),
    Food(
      name: "Berry Spinach Salad",
      description:
      "Fresh baby spinach, mixed berries, candied pecans, and goat cheese, drizzled with a sweet balsamic glaze.",
      imagePath: "lib/images/salads/Berry Spinach Salad.jpg",
      price: 9.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Shrimp", price: 3.99),
        Addon(name: "Walnuts", price: 1.50),
        Addon(name: "Extra Goat Cheese", price: 1.25),
      ],
    ),


    //sides
    Food(
      name: "French Fries",
      description:
      "Golden and crispy potato fries, perfectly seasoned for a savory crunch.",
      imagePath: "lib/images/sides/French Fries.jpg",
      price: 3.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.99),
        Addon(name: "Bacon Bits", price: 1.50),
        Addon(name: "Truffle Oil", price: 1.99),
      ],
    ),
    Food(
      name: "Onion Rings",
      description:
      "Crispy battered onion rings, fried to golden perfection, served with a tangy dipping sauce.",
      imagePath: "lib/images/sides/Onion Rings.jpg",
      price: 4.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Ranch Dip", price: 0.75),
        Addon(name: "BBQ Sauce", price: 0.50),
        Addon(name: "Spicy Mayo", price: 0.99),
      ],
    ),
    Food(
      name: "Mozzarella Sticks",
      description:
      "Melted mozzarella cheese encased in crispy breading, served with marinara sauce.",
      imagePath: "lib/images/sides/Mozzarella Sticks.jpg",
      price: 5.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Marinara", price: 0.75),
        Addon(name: "Spicy Marinara", price: 0.99),
        Addon(name: "Garlic Dip", price: 0.99),
      ],
    ),
    Food(
      name: "Garlic Bread",
      description:
      "Warm, buttery garlic bread slices, seasoned with herbs and parmesan cheese.",
      imagePath: "lib/images/sides/Garlic Bread.jpg",
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Topping", price: 1.50),
        Addon(name: "Marinara Dip", price: 0.75),
        Addon(name: "Chili Flakes", price: 0.50),
      ],
    ),
    Food(
      name: "Side Salad",
      description:
      "A simple mix of fresh greens, cucumbers, cherry tomatoes, and shredded carrots, served with your choice of dressing.",
      imagePath: "lib/images/sides/Side Salad.jpg",
      price: 4.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 2.99),
        Addon(name: "Croutons", price: 0.99),
        Addon(name: "Extra Dressing", price: 0.75),
      ],
    ),

    //desert
    Food(
      name: "Chocolate Lava Cake",
      description:
      "A warm, rich chocolate cake with a gooey molten center, served with a dollop of whipped cream.",
      imagePath: "lib/images/deserts/Chocolate Lava Cake.jpg",
      price: 5.99,
      category: FoodCategory.deserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 1.99),
        Addon(name: "Extra Chocolate Drizzle", price: 0.99),
        Addon(name: "Whipped Cream", price: 0.75),
      ],
    ),
    Food(
      name: "New York Cheesecake",
      description:
      "A creamy and smooth cheesecake with a classic graham cracker crust, topped with your choice of berry compote.",
      imagePath: "lib/images/deserts/New York Cheesecake.webp",
      price: 6.49,
      category: FoodCategory.deserts,
      availableAddons: [
        Addon(name: "Strawberry Sauce", price: 1.25),
        Addon(name: "Fresh Berries", price: 1.99),
        Addon(name: "Whipped Cream", price: 0.75),
      ],
    ),
    Food(
      name: "Tiramisu",
      description:
      "An Italian classic made with layers of coffee-soaked ladyfingers,  cream, and cocoa powder.",
      imagePath: "lib/images/deserts/Tiramisu.jpg",
      price: 7.49,
      category: FoodCategory.deserts,
      availableAddons: [
        Addon(name: "Extra Mascara", price: 1.50),
        Addon(name: "Espresso Shot", price: 1.25),
        Addon(name: "Chocolate Shavings", price: 0.99),
      ],
    ),
    Food(
      name: "Apple Pie",
      description:
      "A traditional apple pie with a buttery crust and cinnamon-spiced apple filling, served warm.",
      imagePath: "lib/images/deserts/Apple Pie.jpg",
      price: 4.99,
      category: FoodCategory.deserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 1.99),
        Addon(name: "Caramel Sauce", price: 0.99),
        Addon(name: "Whipped Cream", price: 0.75),
      ],
    ),
    Food(
      name: "Banana Split",
      description:
      "A fun and colorful dessert featuring a split banana, scoops of vanilla, chocolate, and strawberry ice cream, topped with chocolate sauce, nuts, and a cherry.",
      imagePath: "lib/images/deserts/Banana Split.jpg",
      price: 6.99,
      category: FoodCategory.deserts,
      availableAddons: [
        Addon(name: "Extra Cherry", price: 0.50),
        Addon(name: "Crushed Nuts", price: 0.99),
        Addon(name: "Extra Ice Cream Scoop", price: 2.49),
      ],
    ),

    //drinks
    Food(
      name: "Classic Lemonade",
      description:
      "Refreshing homemade lemonade with the perfect balance of tangy and sweet flavors.",
      imagePath: "lib/images/drinks/Classic Lemonade.jpg",
      price: 3.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Mint Leaves", price: 0.50),
        Addon(name: "Extra Lemon Slice", price: 0.25),
        Addon(name: "Sugar-Free Option", price: 0.00),
      ],
    ),
    Food(
      name: "Iced Coffee",
      description:
      "Chilled coffee served over ice with a hint of cream and sugar.",
      imagePath: "lib/images/drinks/Iced Coffee.jpg",
      price: 4.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Whipped Cream", price: 0.75),
        Addon(name: "Vanilla Syrup", price: 0.50),
        Addon(name: "Caramel Drizzle", price: 0.50),
      ],
    ),
    Food(
      name: "Berry Smoothie",
      description:
      "A vibrant blend of strawberries, blueberries, and raspberries with a creamy yogurt base.",
      imagePath: "lib/images/drinks/Berry Smoothie.jpg",
      price: 5.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Protein Powder", price: 1.50),
        Addon(name: "Chia Seeds", price: 0.75),
        Addon(name: "Extra Berries", price: 1.25),
      ],
    ),
    Food(
      name: "Green Tea",
      description:
      "A soothing cup of antioxidant-rich green tea, served hot or iced.",
      imagePath: "lib/images/drinks/Green Tea.jpg",
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Honey", price: 0.50),
        Addon(name: "Lemon Slice", price: 0.25),
        Addon(name: "Extra Tea Bag", price: 1.00),
      ],
    ),
    Food(
      name: "Mango Lassi",
      description:
      "A creamy and refreshing Indian yogurt-based drink blended with sweet mango pulp.",
      imagePath: "lib/images/drinks/Mango Lassi.jpg",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Rose Water", price: 0.50),
        Addon(name: "Cardamom Powder", price: 0.25),
        Addon(name: "Extra Mango", price: 1.00),
      ],
    ),
  ];

  // user cart
  final List<CartItem> _cart =[];

  // delivery address (which user can change/update)
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _deliveryAddress = "Enter your address...";

  /*
  G E T T E R S
   */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*
  O P E R A T I O N
   */



  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there ia a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food item are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
        const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total numbers of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update delivery address
  Future<void> updateDeliveryAddress(String newAddress) async{
    _deliveryAddress = newAddress;
    notifyListeners();

    // Save delivery address to Firestore (using a fixed document ID or a new entry)
    await _firestore.collection('address').add({
      'deliveryAddress' : newAddress,
      'timestamp' : FieldValue.serverTimestamp(),
    });
  }

  // fetch delivery address
  Future<String?> fetchSavedAddress() async {
    QuerySnapshot snapshot = await _firestore
        .collection('orders')
        .orderBy('date', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      String latestAddress = snapshot.docs.first['deliveryAddress'];
      updateDeliveryAddress(latestAddress);
    }
    return null;
  }
  // Future<void> fetchUserAddress() async{
  //   QuerySnapshot snapshot = await _firestore
  //       .collection('address')
  //       .orderBy('timestamp', descending: true)
  //       .limit(1)
  //       .get();
  //
  //   if (snapshot.docs.isNotEmpty) {
  //     _deliveryAddress = snapshot.docs.first['deliveryAddress'];
  //     notifyListeners();
  //   }
  // }


  /*
  H E L P E R S
   */
  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    String formattedDate =
      DateFormat('yyyy-MM-dd | HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("       Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivery to : $deliveryAddress");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into string summary
  String _formatAddons(List<Addon> addon) {
    return addon
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }

}