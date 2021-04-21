// import 'package:esptouch_flutter/esptouch_flutter.dart';
import 'package:esptouch_smartconfig/esp_touch_result.dart';
import 'package:esptouch_smartconfig/esptouch_smartconfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core_shelf.dart';

class EspTouchSmartConfigWidget extends StatefulWidget {
  static const routeName = '/esp-touch';

  const EspTouchSmartConfigWidget({
    Key? key,
  }) : super(key: key);
  @override
  _EspTouchSmartConfigWidgetState createState() =>
      _EspTouchSmartConfigWidgetState();
}

class _EspTouchSmartConfigWidgetState extends State<EspTouchSmartConfigWidget> {
  late Stream<ESPTouchResult>? _stream;

  void retryLoad() {
    var wifiInfoModel = Provider.of<WifiInfoModel>(context, listen: false);
    setState(() {
      _stream = EsptouchSmartconfig.run(
          wifiInfoModel.wifiName!,
          wifiInfoModel.wifiBSSID!,
          wifiInfoModel.password,
          '1',
          wifiInfoModel.isBroadcast!);
    });
  }

  @override
  Widget build(BuildContext context) {
    var wifiInfoModel = Provider.of<WifiInfoModel>(context, listen: false);
    _stream = EsptouchSmartconfig.run(
        wifiInfoModel.wifiName!,
        wifiInfoModel.wifiBSSID!,
        wifiInfoModel.password,
        '1',
        wifiInfoModel.isBroadcast!);

    return Scaffold(
      appBar: AppBar(
        title: Text('Logs'),
      ),
      body: Container(
        child: StreamBuilder<ESPTouchResult>(
            stream: _stream,
            builder: (context, AsyncSnapshot<ESPTouchResult> snapshot) {
              if (snapshot.hasError) {
                // return error(context, 'Error in StreamBuilder');
                print('haserror');
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: Text('Error: ${snapshot.hasError}'),
                );
              }
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  print('active : ' + snapshot.data.toString());
                  return statusBox('active : ', snapshot);
                case ConnectionState.none:
                  print('nonoe');
                  return statusBox('none', snapshot);
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    print('done has data: ' + snapshot.data.toString());
                    return statusBox('done has data: ', snapshot);
                  } else {
                    print('done no data / timed out');
                    return Column(
                      children: [
                        statusBox('done no data / timed out', snapshot),
                        Center(
                            child: ElevatedButton(
                                onPressed: retryLoad, child: Text('Retry')))
                      ],
                    );
                  }
                case ConnectionState.waiting:
                  print('waiting');
                  return Column(
                    children: [
                      statusBox('waiting ', snapshot),
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    ],
                  );
              }
            }),
      ),
    );
  }
}

Widget statusBox(String? title, AsyncSnapshot<ESPTouchResult> snapshot) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Text('Connection state: $title ${snapshot.data ?? ''.toString()}'),
  );
}
