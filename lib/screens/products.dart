import 'package:ecobuild/constants/constants.dart';
import 'package:ecobuild/screens/homescreen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductsScreen extends StatefulWidget {
  final image, name, price;

  const ProductsScreen(
      {Key? key, required this.image, required this.name, required this.price})
      : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<String> categories = [
    'About',
    'Price',
    'Colors',
    'Comments',
    'Similar products',
    'Photos',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
                    height: 250,
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
                              maxRadius: 100,
                              backgroundImage: NetworkImage(widget.image),
                            ),
                          ],
                        )),
                      ],
                    )),
                  ),
                  Positioned(
                      top: 30,
                      right: 80,
                      child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            maxRadius: 15,
                            child: FavoriteButton(
                              valueChanged: (_isFavorite) {
                                print('Is Favorite $_isFavorite)');
                              },
                            ),
                          )))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Rs: ${widget.price}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 20,
                  thickness: 5,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black,
                ),
                TabBar(
                  unselectedLabelColor: Colors.black,
                  labelColor: AppColor.deepOrange,
                  tabs: [
                    Tab(
                      text: 'Details',
                    ),
                    Tab(
                      text: 'Photos',
                    ),
                    Tab(
                      text: 'Summary',
                    ),
                    Tab(
                      text: 'Comments',
                    ),
                    Tab(
                      text: 'Similar Products',
                    ),
                  ],
                  indicatorSize: TabBarIndicatorSize.tab,
                )

                //

                // SizedBox(
                //   height: 35,
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: categories.length,
                //       itemBuilder: (context, index) => GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 selectedIndex = index;
                //               });
                //             },
                //             child: Padding(
                //               padding: EdgeInsets.symmetric(horizontal: 10),
                //               child: SingleChildScrollView(
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       categories[index],
                //                       style: TextStyle(
                //                           fontSize: 15,
                //                           color: selectedIndex == index
                //                               ? AppColor.deepOrange
                //                               : Colors.black),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           )),
                // ),

                // Container(
                //   height: 170,
                //   width: 400,
                //   color: Colors.blueAccent,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Container(
                //   height: 70,
                //   width: 370,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(40),
                //       color: Colors.purple),
                //   child: Center(
                //       child: Text(
                //     "Add to Card",
                //     style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.w500,
                //         color: Colors.white),
                //   )),
                // )
              ],
            ),
          )),
    );
  }
}
