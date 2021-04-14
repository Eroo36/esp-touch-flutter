import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model

import '../../models/wifi_info/wifi_info_model.dart';

class WifiInfoController {
  WifiInfoController();

  void updateWifiName(BuildContext context, String wifiName) {
    var viewModel = Provider.of<WifiInfoModel>(context, listen: false);
    viewModel.setWifiName(wifiName);
  }

  void updateWifiBSSID(BuildContext context, String wifiBSSID) {
    var viewModel = Provider.of<WifiInfoModel>(context, listen: false);
    viewModel.setWifiBSSID(wifiBSSID);
  }

  void updateWifiIP(BuildContext context, String wifiIP) {
    var viewModel = Provider.of<WifiInfoModel>(context, listen: false);
    viewModel.setWifiIP(wifiIP);
  }
}
