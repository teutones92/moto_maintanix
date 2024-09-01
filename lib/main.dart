import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/service/app_version_service/app_version_service.dart';
import 'package:moto_maintanix/service/notifications_service/notifications_service.dart';
import 'package:moto_maintanix/service/object_box_service/object_box_service.dart';
import 'package:moto_maintanix/views/landing_view/landing_view.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await ObjectBoxService.init();
  await NotificationService.init();
  await AppVersionService.getAppVersion();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: CustomMultiBlocsProvider.providers,
      child: BlocBuilder<ThemeX, ThemeMode>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeState,
            darkTheme: ThemeX.darkTheme,
            theme: ThemeX.lightTheme,
            home: const LandingView(),
          );
        },
      ),
    );
  }
}
