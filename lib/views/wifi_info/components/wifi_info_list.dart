import 'package:flutter/material.dart';

class WifiInfoList extends StatelessWidget {
  final List<String> wifiInfoList;

  const WifiInfoList({Key? key, required this.wifiInfoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: wifiInfoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(wifiInfoList[index]),
          );
        },
      ),
    );
  }
}
