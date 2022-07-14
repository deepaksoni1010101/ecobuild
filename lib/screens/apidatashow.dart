import 'package:ecobuild/model/productapi.dart';
import 'package:ecobuild/model/products100.dart';
import 'package:flutter/material.dart';

class ApiDataShow extends StatefulWidget {
  const ApiDataShow({Key? key}) : super(key: key);

  @override
  State<ApiDataShow> createState() => _ApiDataShowState();
}

class _ApiDataShowState extends State<ApiDataShow> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Data Show"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: Text('Fetch Data')),
          check
              ? FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ProductApi> dData =
                          snapshot.data as List<ProductApi>;
                      return SizedBox(
                        height: 600,
                        child: SingleChildScrollView(
                          child: Column(
                            children: dData
                                .map((e) => Card(
                                      child: Column(
                                        children: [
                                          Text(e.title),
                                          Image(
                                              image: NetworkImage(e.thumbnail)),
                                          Text(e.price.toString()),
                                          Text(e.discountPercentage.toString())
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              : CircularProgressIndicator()
        ],
      )),
    );
  }

  void fetchData() async {
    // check
    List cData = await getData();
    if (cData.length > 0) {
      check = true;
    } else {}
    setState(() {});
  }
}
