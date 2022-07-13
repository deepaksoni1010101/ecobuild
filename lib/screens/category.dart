import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final documentId;
  // var targetPage;

  const CategoryPage({Key? key, this.documentId}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final Stream<QuerySnapshot> _categoryStream = FirebaseFirestore.instance
      .collection('products1')
      .doc('gjx2oopfI8FUYaSGC7Uf')
      .collection('category')
      .doc('47h5wT1Xgo0DYDO7AI6l')
      .collection('men')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _categoryStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong...");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading...");
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              print(document.id);
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['productName']),
                // leading: NetworkImage(data['productImage']),
                subtitle: Text(data['productPrice']),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data['productImage']),
                ),
              );
            }).toList(),
          );
        },
      ),
    );

    // StreamBuilder<QuerySnapshot>(
    //   stream: _categoryWiseStream,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       return Text("Something went wrong...");
    //     }
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Text("Loading...");
    //     }
    //     return ListView(
    //       children: snapshot.data!.docs.map((DocumentSnapshot document) {
    //         print(document.id);
    //         Map<String, dynamic> data =
    //             document.data()! as Map<String, dynamic>;
    //         return ListTile(
    //           title: Text(data['catname']),
    //         );
    //       }).toList(),
    //     );
    //   },
    // );
  }
}
