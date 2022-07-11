import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecobuild/constants/constants.dart';
import 'package:ecobuild/screens/homescreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductsScreen extends StatefulWidget {
  final image, name, price, Id, description, image1, image2, image3;

  const ProductsScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.Id,
    required this.description,
    required this.image1,
    required this.image2,
    required this.image3,
  }) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int selectedIndex = 0;
  var activePage = 1;
  late PageController _pageController;
  // List<String> images = [
  //   "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
  //   "https://wallpaperaccess.com/full/2637581.jpg",
  //   "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  // ];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _pageController = PageController(viewportFraction: 0.8);
  // }

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
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 183, 232, 255),
                          border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        child: ListView(
                      children: [
                        CarouselSlider(
                            items: [
                              Container(
                                  margin: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(widget.image1),
                                          fit: BoxFit.cover))),
                              Container(
                                  margin: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(widget.image2),
                                          fit: BoxFit.cover))),
                              Container(
                                  margin: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(widget.image3),
                                          fit: BoxFit.cover))),
                            ],
                            options: CarouselOptions(
                              height: 400.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  Duration(microseconds: 2000),
                              viewportFraction: 0.8,
                            ))
                      ],
                    )
                        // PageView.builder(
                        //   itemCount: 3,
                        //   pageSnapping: true,
                        //   controller: _pageController,
                        //   onPageChanged: (page) {
                        //     setState(() {
                        //       activePage = page;
                        //     });
                        //   },
                        //   itemBuilder: (context, pagePosition) {
                        //     return Container(
                        //       margin: EdgeInsets.all(10),
                        //       child: Image.network(images[pagePosition]),
                        //     );
                        //   },
                        // ),
                        ),
                    Container(
                      color: Colors.brown,
                    ),
                    Container(
                      color: Colors.cyanAccent,
                    ),
                    Container(
                      color: Colors.indigo,
                    ),
                  ],
                ))
                // TabBarView(children: <Widget>[
                //   Center(
                //     child: Text(widget.description),
                //   ),
                //   Center(
                //     child: Text(widget.description),
                //   ),
                //   Center(
                //     child: Text(widget.description),
                //   ),
                //   Center(
                //     child: Text(widget.description),
                //   ),
                //   Center(
                //     child: Text(widget.description),
                //   ),
                // ])

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
