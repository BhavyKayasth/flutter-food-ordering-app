import 'package:flutter/material.dart';
import 'package:fooddelivery/component/my_button.dart';
import 'package:fooddelivery/component/my_cart_tile.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:fooddelivery/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // cart
        final userCart = restaurant.cart;
  
        // scaffold UI
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // clear cart button
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure you want to clear the cart ?"),
                      actions: [
                        // cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),

                        // yes button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              
              // list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty ?
                    const Expanded(
                      child: Center(
                        child: Text('Cart is empty..',),
                      ),
                    ) :
                    Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                
                          //get individual cart item
                          final cartItem = userCart[index];
                
                          // return cart title UI
                          return MyCartTile(cartItem: cartItem);
                        }
                      ),
                    ),
                  ],
                ),
              ),
              
              // button to pay
              MyButton(
                text: "Go to checkout",
                onTap: () {
                  final restaurant = context.read<Restaurant>();
                  String currentAddress = restaurant.deliveryAddress.trim();
                  final userCart = restaurant.cart;

                  if (userCart.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Cart is Empty"),
                        content: const Text("Your cart is empty! Add items before proceeding to checkout."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                    return;
                  }

                  if (currentAddress.isEmpty || currentAddress == "Enter your address...") {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Address Required"),
                        content: const Text("Please enter a valid delivery address before proceeding to checkout."),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                    return;
                  }

                  // Proceed to payment if everything is fine
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentPage(),
                    ),
                  );
                },
              ),


              // MyButton(
              //   text: "Go to checkout",
              //   onTap: () {
              //     if (userCart.isEmpty) {
              //       // Show a dialog box if the cart is empty
              //       showDialog(
              //         context: context,
              //         builder: (context) {
              //           return AlertDialog(
              //             title: const Text("Cart is Empty"),
              //             content: const Text("Your cart is empty! Add items before proceeding to checkout."),
              //             actions: [
              //               TextButton(
              //                 onPressed: () {
              //                   Navigator.pop(context); // Close the dialog
              //                 },
              //                 child: const Text("OK"),
              //               ),
              //             ],
              //           );
              //         },
              //       );
              //     } else {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const PaymentPage(),
              //         ),
              //       );
              //     }
              //   }
              //   // onTap: () => Navigator.push(
              //   //   context,
              //   //   MaterialPageRoute(
              //   //     builder: (context) => const PaymentPage(),
              //   //   ),
              //   // ),
              // ),
              const SizedBox(height: 20,),
            ],
          ),
        );
      },
    );
  }
}
