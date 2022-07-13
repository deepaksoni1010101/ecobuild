import 'package:ecobuild/constants/constants.dart';
import 'package:ecobuild/screens/favorite.dart';
import 'package:ecobuild/screens/homescreen.dart';
import 'package:ecobuild/screens/profile.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  // late final String productName;
  // late final String productDiscription;
  // late final String productPrice;
  // late final String productImage;

  // AddUser(this.productName, this.productDiscription, this.productPrice, this.productImage);

  int index = 0;
  final screens = [
    HomePage(),
    FavoritePage(),
    // CartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('product');

    // Future<void> addUser(){
    //   return users
    //           .add({
    //             'productName': productName,
    //             'productDiscription': productDiscription,
    //             'productPrice': productPrice,
    //             'productImage': productImage,
    //           })
    //           .then((value) => print("User Added"))
    //           .catchError((error) => print("Faild to add user: $error"));
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Nav Bar"),
        backgroundColor: AppColor.deepOrange,
        centerTitle: true,
      ),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Color.fromARGB(255, 255, 224, 234),
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
        child: NavigationBar(
          height: 60,
          backgroundColor: AppColor.deepOrange,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.favorite_border), label: 'Favorite'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
