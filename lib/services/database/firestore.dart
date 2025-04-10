import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of orders
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  // final CollectionReference users = FirebaseFirestore.instance.collection('users');

  // save order to db
  Future<void> saveOrdersToDatabase(String receipt, String deliveryAddress) async {
    await orders.add({
      'date' : DateTime.now(),
      'order' : receipt,
      'deliveryAddress' : deliveryAddress,
      // add more fields as necessary
    });
  }
  // // Get stored address of the current user
  // Future<String?> getUserAddress() async {
  //   try {
  //     String? userId = FirebaseAuth.instance.currentUser?.uid;
  //     if (userId == null) return null;
  //
  //     DocumentSnapshot userDoc = await users.doc(userId).get();
  //     if (userDoc.exists) {
  //       return userDoc['address'] as String?;
  //     }
  //   } catch (e) {
  //     print("Error fetching address: $e");
  //   }
  //   return null;
  // }
}