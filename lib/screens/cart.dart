import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final image, name, price, Id, description;

  const CartPage(
      {Key? key,
      required this.Id,
      required this.description,
      required this.image,
      required this.name,
      required this.price})
      : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
    );
  }
}
