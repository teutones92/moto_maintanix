import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/service/object_box_service.dart';
import 'package:moto_maintanix/views/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ObjectBoxService.init();
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
            home: const Home(),
          );
        },
      ),
    );
  }
}
