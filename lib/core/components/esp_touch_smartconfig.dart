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

  @override
  void initState() {
    var wifiInfoModel = Provider.of<WifiInfoModel>(context, listen: false);
    _stream = EsptouchSmartconfig.run(
        wifiInfoModel.wifiName!,
        wifiInfoModel.wifiBSSID!,
        wifiInfoModel.password,
        '1',
        wifiInfoModel.isBroadcast!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                return Container();
              }
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  print('active : ' + snapshot.data.toString());
                  return Container(
                    child: Text(snapshot.data.toString()),
                  );
                case ConnectionState.none:
                  print('nonoe');
                  return Container(
                    child: Text(snapshot.data.toString()),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    print('done has data: ' + snapshot.data.toString());
                    return Container(
                      child: Text(snapshot.data.toString()),
                    );
                  } else {
                    print('done no data');
                    return Container(
                      child: Text(snapshot.data.toString()),
                    );
                  }
                case ConnectionState.waiting:
                  print('waiting: ' + snapshot.data.toString());
                  return Container(
                    child: Text(snapshot.data.toString()),
                  );
              }
            }),
      ),
    );
  }
}
