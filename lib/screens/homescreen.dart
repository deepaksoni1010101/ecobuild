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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        title: const Center(
            child: Text(
          "Collections",
          style: TextStyle(color: Colors.black),
        )),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ));
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Collections",
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 33,
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 115.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataList.length,
              itemBuilder: (context, index) => Container(
                  height: 100.0,
                  width: 95.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          maxRadius: 40,
                          backgroundImage: NetworkImage(dataList[index].image),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(dataList[index].name),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
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
            height: 330,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataList.length,
                itemBuilder: (context, index) => const CardScreen()),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 70,
            width: 370,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.purple),
            child: const TextField(),
          ),
        ],
      ),
    );
  }
}
