import 'package:flutter/material.dart';
import 'package:wifi/controllers/wifi_info/wifi_info_controller.dart';
import 'package:wifi/models/wifi_info/wifi_info_model.dart';

class WifiInfoList extends StatelessWidget {
  final List<String?>? wifiInfoList;

  const WifiInfoList({Key? key, this.wifiInfoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? passwordController;
    var theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: wifiInfoList!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: theme.disabledColor),
                      hintText: wifiInfoList![index],
                      enabled: false),
                ),
              ));
            },
          ),
          ListTile(
              title: Container(
            child: TextFormField(
              controller: passwordController,
              onChanged: (text) {
                WifiInfoController().updateWifiPassword(context, text);
              },
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ))
        ],
      ),
    );
  }
}
