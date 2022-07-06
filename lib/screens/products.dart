import 'package:ecobuild/screens/homescreen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 70,
          title: Center(
              child: Text(
            "Products",
            style: TextStyle(color: Colors.black),
          )),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ))
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 370,
                  width: 450,
                  // color: Colors.blue,
                  child: Container(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                          child: Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 150,
                            backgroundImage: NetworkImage(
                                "https://yt3.ggpht.com/ytc/AKedOLTYWSzYOUv2cQhYqkcv0oCCwmrXsjC-r8UDn28F2g=s900-c-k-c0x00ffffff-no-rj"),
                          ),
                        ],
                      )),
                    ],
                  )),
                ),
                Positioned(
                    left: 20,
                    bottom: 20,
                    child: CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        radius: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 30,
                          child: FavoriteButton(
                            valueChanged: (_isFavorite) {
                              print('Is Favorite $_isFavorite)');
                            },
                          ),
                        )))
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Milli Bobby\nBrown",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Rs: 1200T",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 170,
                width: 400,
                color: Colors.blueAccent,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.purple),
                child: Center(
                    child: Text(
                  "Add to Card",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
              )
            ],
          ),
        ));
  }
}
