// import 'package:esptouch_flutter/esptouch_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model

import '../../core_shelf.dart';

class WifiInfoController {
  WifiInfoController();

  void updateWifiInfo(BuildContext context, String? wifiName, String? wifiBSSID,
      String? wifiIP) {
    var viewModel = Provider.of<WifiInfoModel>(context, listen: false);
    viewModel.setWifiInfo(wifiName, wifiBSSID, wifiIP);
  }

  void updateWifiPassword(BuildContext context, String wifiPassword) {
    var viewModel = Provider.of<WifiInfoModel>(context, listen: false);
    viewModel.setPassword(wifiPassword);
  }

  // void updateWifiPacket(BuildContext context, ESPTouchPacket wifiPacket) {
  //   var viewModel = Provider.of<WifiInfoModel>(context, listen: false);
  //   viewModel.setPacket(wifiPacket);
  // }

  void updateWifiPacket(BuildContext context, bool isBroadcast) {
    var viewModel = Provider.of<WifiInfoModel>(context, listen: false);
    viewModel.setPacket(isBroadcast);
  }
}
