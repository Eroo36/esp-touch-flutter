// import 'package:esptouch_flutter/esptouch_flutter.dart';
import 'package:flutter/material.dart';

class WifiInfoModel extends ChangeNotifier {
  String? _wifiName = '';
  String? _wifiBSSID = '';
  String? _wifiIP = '';
  String _password = '';
  bool? _isBroadcast = true;
  // ESPTouchPacket _packet = ESPTouchPacket.broadcast;

  String? get wifiName => _wifiName;
  String? get wifiBSSID => _wifiBSSID;
  String? get wifiIP => _wifiIP;
  String get password => _password;
  bool? get isBroadcast => _isBroadcast;

  // ESPTouchPacket get packet => _packet;

  void setWifiName(String? wifiName) {
    _wifiName = wifiName;
    notifyListeners();
  }

  void setWifiBSSID(String? wifiBSSID) {
    _wifiBSSID = wifiBSSID;
    notifyListeners();
  }

  void setWifiIP(String? wifiIP) {
    _wifiIP = wifiIP;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  // void setPacket(ESPTouchPacket packet) {
  //   _packet = packet;
  //   notifyListeners();
  // }

  void setPacket(bool isBroadcast) {
    _isBroadcast = isBroadcast;
    notifyListeners();
  }

  WifiInfoModel();
  WifiInfoModel.instance();
}
