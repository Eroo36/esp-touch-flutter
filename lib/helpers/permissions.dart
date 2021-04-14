import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

Future<String?> getPermissions() async {
  if (Platform.isAndroid) {
    var status = await Permission.location.status;
    if (status.isDenied || status.isRestricted) {
      if (await Permission.location.request().isGranted) {
        print('granted');
      }
    }
  }
}
