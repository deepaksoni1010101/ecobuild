import 'package:ecobuild/screens/cart.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import '../screens/products.dart';

class CardScreen extends StatefulWidget {
  final image, name, price, Id, description;

  const CardScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.Id,
      required this.description})
      : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      width: 280,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(image: NetworkImage(

                          // "https://yt3.ggpht.com/ytc/AKedOLTYWSzYOUv2cQhYqkcv0oCCwmrXsjC-r8UDn28F2g=s900-c-k-c0x00ffffff-no-rj"
                          widget.image))),
                ),
                // Positioned(
                //     left: 7,
                //     top: 7,
                //     child: Icon(
                //       Icons.add_shopping_cart,
                //       size: 30,
                //     )),
                Positioned(
                    right: 7,
                    top: 7,
                    child: FavoriteButton(
                      valueChanged: (_isFavorite) {
                        print('Is Favorite $_isFavorite)');
                      },
                    )),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Rs: ${widget.price}\n${widget.name}",
                  style: TextStyle(fontSize: 20),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(
                            name: widget.name,
                            image: widget.image,
                            Id: widget.Id,
                            description: widget.description,
                            price: widget.price,
                          ),
                        ));
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white,
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductsScreen(
                            name: widget.name,
                            image: widget.image,
                            price: widget.price,
                            description: widget.description,
                            Id: widget.Id,
                          ),
                        ));
                  },
                  child: Icon(
                    Icons.open_in_new,
                    color: Colors.black,
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
