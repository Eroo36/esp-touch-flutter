import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import controller
// import '../../core/controllers/wifi_info/wifi_info_controller.dart';
// import model
import '../../core/models/wifi_info/wifi_info_model.dart';
import 'package:wifi/views/wifi_info/components/wifi_info_list.dart';

// import '../../core/components/esp_touch.dart';
import '../../core/components/esp_touch_smartconfig.dart';

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
          // var startConnection = false;
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
