import 'package:flutter/material.dart';

class WifiInfoModel extends ChangeNotifier {
  String _wifiName = '';
  String _wifiBSSID = '';
  String _wifiIP = '';

  String get wifiName => _wifiName;
  String get wifiBSSID => _wifiBSSID;
  String get wifiIP => _wifiIP;

  void setWifiName(String wifiName) {
    _wifiName = wifiName;
    notifyListeners();
  }

  void setWifiBSSID(String wifiBSSID) {
    _wifiBSSID = wifiBSSID;
    notifyListeners();
  }

  void setWifiIP(String wifiIP) {
    _wifiIP = wifiIP;
    notifyListeners();
  }

  WifiInfoModel();
  WifiInfoModel.instance();
}
