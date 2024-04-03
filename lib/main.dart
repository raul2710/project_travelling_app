import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'view/ScreenLogin.dart';
import 'view/ScreenModifyItem.dart';
import 'view/ScreenSubscribe.dart';
import 'view/ScreenListTravels.dart';

void main()
{
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp()
      ),
  );
}

//
// MainApp
//
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',
      //
      //ROTAS DE NAVEGAÇÃO
      //
      initialRoute: 'screenLogin',
      routes: {
        'screenLogin' :(context) => ScreenLogin(),
        'screenSubscribe' :(context) => ScreenSubscribe(),
        'screenListTravels' :(context) => ScreenListTravels(),
        'screenModifyItem' :(context) => ScreenModifyItem(),
      }
    );
  }
}
