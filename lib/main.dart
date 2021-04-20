import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/components/esp_touch_smartconfig.dart';
import 'views/home/home_view.dart';
import 'core/helpers/permissions.dart';
import 'core/models/wifi_info/wifi_info_model.dart';
import 'core/helpers/theme.dart';
import 'views/wifi_info/wifi_info_view.dart';

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
