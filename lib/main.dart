import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wifi/components/esp_touch_smartconfig.dart';
import 'package:wifi/views/home/home_view.dart';
import 'package:wifi/views/wifi_info/components/wifi_info_list.dart';
import 'helpers/permissions.dart';
import 'models/wifi_info/wifi_info_model.dart';
import 'helpers/theme.dart';
import 'views/wifi_info/wifi_info_view.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getPermissions();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WifiInfoModel()),
        ],
        child: MaterialApp(
          title: '',
          theme: myTheme,
          home: HomeView(),
          routes: {
            WifiInfoView.routeName: (context) => WifiInfoView(),
            EspTouchSmartConfigWidget.routeName: (context) =>
                EspTouchSmartConfigWidget(),
          },
        ));
  }
}
