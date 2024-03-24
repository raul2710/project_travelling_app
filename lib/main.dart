import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'view/ScreenLogin.dart';
import 'view/ScreenSubscribe.dart';

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
      initialRoute: 't1',
      routes: {
        't1' :(context) => ScreenLogin(),
        't2' :(context) => ScreenSubscribe(),
        // 't3' :(context) => ScreenLogin(),
        // 't4' :(context) => ScreenLogin(),
      }
    );
  }
}

