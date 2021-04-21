import 'package:flutter/material.dart';
import '../../core/controllers/wifi_info/wifi_info_controller.dart';
import '../../core/helpers/permissions.dart';
import '../wifi_info/wifi_info_view.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _wifiBSSID;
  var _wifiIP;
  var _wifiName;

  Future setup() async {
    await getPermissions();
    _wifiBSSID = await WifiInfo().getWifiBSSID();
    _wifiIP = await WifiInfo().getWifiIP();
    _wifiName = await WifiInfo().getWifiName();
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
                  wifiInfoController.updateWifiInfo(
                      context, _wifiName, _wifiBSSID, _wifiIP);
                  Navigator.of(context).pushNamed(WifiInfoView.routeName);
                },
                child: Text('Add Devices')),
            ElevatedButton(
                onPressed: () async {
                  await getPermissions();
                },
                child: Text('Configure Devices'))
          ],
        ),
      ),
    );
  }
}
