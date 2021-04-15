import 'package:flutter/material.dart';
import 'package:wifi/controllers/wifi_info/wifi_info_controller.dart';
import 'package:wifi/helpers/permissions.dart';
import 'package:wifi/views/wifi_info/wifi_info_view.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/';

  var wifiBSSID;
  var wifiIP;
  var wifiName;

  Future setup() async {
    await getPermissions();
    wifiBSSID = await WifiInfo().getWifiBSSID();
    wifiIP = await WifiInfo().getWifiIP();
    wifiName = await WifiInfo().getWifiName();
  }

  @override
  Widget build(BuildContext context) {
    setup();
    var wifiInfoController = WifiInfoController();

    return Scaffold(
      appBar: AppBar(
        title: Text('WifiInfo'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  wifiInfoController.updateWifiName(context, wifiName);
                  wifiInfoController.updateWifiIP(context, wifiIP);
                  wifiInfoController.updateWifiBSSID(context, wifiBSSID);

                  Navigator.of(context).pushNamed(WifiInfoView.routeName);
                },
                child: Text('Add Devices')),
            ElevatedButton(onPressed: null, child: Text('Configure Devices'))
          ],
        ),
      ),
    );
  }
}
