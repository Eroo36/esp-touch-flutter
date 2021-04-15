import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wifi/components/esp_touch.dart';
import 'package:wifi/components/esp_touch_smartconfig.dart';
// import model
import 'package:wifi/models/wifi_info/wifi_info_model.dart';
// import controller
import 'package:wifi/controllers/wifi_info/wifi_info_controller.dart';
import 'package:wifi/views/wifi_info/components/wifi_info_list.dart';

class WifiInfoView extends StatefulWidget {
  static const routeName = '/wifi-info';

  @override
  _WifiInfoViewState createState() => _WifiInfoViewState();
}

class _WifiInfoViewState extends State<WifiInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WifiInfo'),
      ),
      body: Consumer<WifiInfoModel>(
        builder: (context, wifiInfoModel, child) {
          var wifiInfoList = [
            wifiInfoModel.wifiName,
            wifiInfoModel.wifiBSSID,
            wifiInfoModel.wifiIP
          ];
          var startConnection = false;
          return Column(
            children: [
              WifiInfoList(
                wifiInfoList: wifiInfoList,
              ),
              // EspTouchButtonWidget(
              //     ssid: wifiInfoModel.wifiName,
              //     bssid: wifiInfoModel.wifiBSSID,
              //     password: wifiInfoModel.password,
              //     packet: wifiInfoModel.packet)
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(EspTouchSmartConfigWidget.routeName);
                  },
                  child: Text('Start Connection')),
            ],
          );
        },
      ),
    );
  }
}
