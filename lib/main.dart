import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'model/User.dart';
import 'view/ScreenAbout.dart';
import 'view/ScreenAddTrip.dart';
import 'view/ScreenListCategory.dart';
import 'view/ScreenLogin.dart';
import 'view/ScreenModifyItem.dart';
import 'view/ScreenSearchTrip.dart';
import 'view/ScreenSearchTripCategory.dart';
import 'view/ScreenSubscribe.dart';
import 'view/ScreenListTrip.dart';
import 'view/ScreenViewTrip.dart';

List<User> listUsers = User.loadUserList();

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
        'screenLogin' :(context) => ScreenLogin(listUsers:listUsers),
        'screenSubscribe' :(context) => ScreenSubscribe(),
        'screenListTravels' :(context) => ScreenListTravels(),
        'screenModifyItem' :(context) => ScreenModifyItem(),
        'screenAddTrip' :(context) => ScreenAddTrip(),
        'screenViewTrip' :(context) => ScreenViewTrip(),
        'screenSearchTrip' :(context) => ScreenSearchTrip(),
        'screenListCategory' :(context) => ScreenListCategory(),
        'screenSearchTripCategory' :(context) => ScreenSearchTripCategory(),
        'screenAbout' :(context) => ScreenAbout(),
      }
    );
  }
}

