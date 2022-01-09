import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerProduct {
  final String name;
  final double price;
  final String imageUrl;

  CustomerProduct({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  static CustomerProduct fromSnapshot(DocumentSnapshot snapshot) {
    CustomerProduct product = CustomerProduct(
      name: snapshot["product_name"],
      price: snapshot["price"],
      imageUrl: snapshot["image"],
    );
    return product;
  }
}
