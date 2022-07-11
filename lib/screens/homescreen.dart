import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecobuild/widget/circlewidget.dart';
import 'package:ecobuild/screens/signup.dart';
import 'package:flutter/material.dart';

import '../model/circle_model.dart';
import '../widget/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('product').snapshots();

  final Stream<QuerySnapshot> _categoryStream =
      FirebaseFirestore.instance.collection('category').snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Collections',
            style: TextStyle(color: Colors.black),
          ),
          // centerTitle: true,
          backgroundColor: Colors.white,
          // elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
          ],
        ),

        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   toolbarHeight: 70,
        //   title: const Center(
        //       child: Text(
        //     "Collections",
        //     style: TextStyle(color: Colors.black),
        //   )),
        //   leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.black,
        //     ),
        //     onPressed: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => const SignUpScreen(),
        //           ));
        //     },
        //   ),
        //   actions: [
        //     IconButton(
        //         onPressed: () {},
        //         icon: const Icon(
        //           Icons.shopping_cart_outlined,
        //           color: Colors.black,
        //         ))
        //   ],
        // ),
        body: Column(
          children: [
            // const SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       const Text(
            //         "Collections",
            //         style: TextStyle(fontSize: 30),
            //       ),
            //       SizedBox(
            //         width: 140,
            //       ),
            //       IconButton(
            //           onPressed: () {},
            //           icon: const Icon(
            //             Icons.more_horiz,
            //             size: 33,
            //           )),
            //       IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 150,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _categoryStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return CircleWidget(
                          image: data['categoryImage'],
                          name: data['categoryName'],
                        );
                        // ListTile(
                        //   leading: Image(image: NetworkImage(data['product_image'])),
                        //   title: Text(data['product_name']),
                        //   subtitle: Text(data['product_description']),
                        //   trailing: Text(data['product_price']),
                        // );
                      }).toList(),
                    );
                  },
                )
                // ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: dataList.length,
                //     itemBuilder: (context, index) => CardScreen()),
                ),
            Divider(
              height: 30,
              color: Color.fromARGB(255, 202, 202, 202),
              thickness: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "New In",
                  style: TextStyle(fontSize: 30),
                ),
                TextButton(onPressed: () {}, child: const Text("See All"))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
                height: 330,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return CardScreen(
                          image: data['productImage'],
                          name: data['productName'],
                          price: data['productPrice'],
                          Id: data['productId'],
                          discription: data['productDiscription'],
                          image1: data['image1'],
                          image2: data['image2'],
                          image3: data['image3'],
                        );
                        // ListTile(
                        //   leading: Image(image: NetworkImage(data['product_image'])),
                        //   title: Text(data['product_name']),
                        //   subtitle: Text(data['product_description']),
                        //   trailing: Text(data['product_price']),
                        // );
                      }).toList(),
                    );
                  },
                )
                // ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: dataList.length,
                //     itemBuilder: (context, index) => CardScreen()),
                ),
            SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
            //   child: TextFormField(
            //     decoration: const InputDecoration(
            //         hintText: 'Find Something',
            //         filled: true,
            //         fillColor: Colors.purple,
            //         border: OutlineInputBorder(
            //             borderSide: BorderSide(color: Colors.black),
            //             borderRadius: BorderRadius.all(Radius.circular(20))),
            //         suffixIcon: Padding(
            //           padding: EdgeInsets.only(top: 5, right: 30),
            //           child: Icon(
            //             Icons.filter_list,
            //             color: Colors.white,
            //             size: 30,
            //           ),
            //         ),
            //         prefixIcon: Padding(
            //           padding: EdgeInsets.only(left: 15, top: 1),
            //           child: CircleAvatar(
            //             backgroundColor: Colors.white,
            //             maxRadius: 25,
            //             child: Icon(
            //               Icons.search,
            //               color: Colors.grey,
            //               size: 30,
            //             ),
            //           ),
            //         )),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
