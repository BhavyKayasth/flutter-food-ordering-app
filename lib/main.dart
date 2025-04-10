import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/services/auth/auth_gate.dart';
import 'package:fooddelivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'models/restaurant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  // fetch address from firestore
  Restaurant restaurant = Restaurant();
  await restaurant.fetchSavedAddress();

  // String? userAddress = await FirestoreService().getUserAddress();
  // print("User Address: $userAddress");

  runApp(
      MultiProvider(
        providers: [
          // theme provider
          ChangeNotifierProvider(create: (context) => ThemeProvider(),),
          // restaurant provider
          ChangeNotifierProvider(create: (context) => Restaurant(),),
          // load previous saved address
          ChangeNotifierProvider(
            create: (context) => restaurant
          ),
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
