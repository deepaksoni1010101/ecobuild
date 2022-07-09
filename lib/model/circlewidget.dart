import 'package:ecobuild/model/circle_model.dart';
import 'package:flutter/material.dart';

class CircleWidget extends StatefulWidget {
  final image, name;

  const CircleWidget({Key? key, this.image, this.name}) : super(key: key);

  @override
  State<CircleWidget> createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 115,
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: 40,
            backgroundImage: NetworkImage(widget.image),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(widget.name),
          )
        ],
      ),
    );
    // Container(
    //   margin: const EdgeInsets.all(10.0),
    //   height: 115.0,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: dataList.length,
    //     itemBuilder: (context, index) => Container(
    //         height: 100.0,
    //         width: 95.0,
    //         child: Center(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               CircleAvatar(
    //                 maxRadius: 40,
    //                 backgroundImage: NetworkImage(dataList[index].image),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Text(dataList[index].name),
    //               ),
    //             ],
    //           ),
    //         )),
    //   ),
    // );
  }
}