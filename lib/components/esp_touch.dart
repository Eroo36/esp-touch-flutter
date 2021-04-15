// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:esptouch_flutter/esptouch_flutter.dart';

// class EspTouchButtonWidget extends StatelessWidget {
//   final String ssid;
//   final String bssid;
//   final String password;
//   final ESPTouchPacket packet;
//   const EspTouchButtonWidget(
//       {Key key, this.ssid, this.bssid, this.password, this.packet})
//       : super(key: key);

//   executeEsptouch(bool bool) {
//     final task = ESPTouchTask(
//         ssid: ssid, bssid: bssid, password: password, packet: packet);
//     final stream = task.execute();
//     final sub = stream.listen((r) {
//       print('IP: ${r.ip} MAC: ${r.bssid}');
//     }, onError: (err) {
//       print('Error: ' + err);
//     }, onDone: () {
//       print('Done connection');
//     });
//     if (!bool) {
//       sub.cancel();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             executeEsptouch(true);
//           },
//           child: Text('Start Connection'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             executeEsptouch(false);
//           },
//           child: Text('Cancel Connection'),
//         ),
//       ],
//     );
//   }
// }
