import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'model/User.dart';
import 'view/ScreenAddTrip.dart';
import 'view/ScreenLogin.dart';
import 'view/ScreenModifyItem.dart';
import 'view/ScreenSubscribe.dart';
import 'view/ScreenListTravels.dart';

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
        'screenLogin' :(context) => ScreenLogin(listUsers: listUsers,),
        'screenSubscribe' :(context) => ScreenSubscribe(listUsers: listUsers,),
        'screenListTravels' :(context) => ScreenListTravels(),
        'screenModifyItem' :(context) => ScreenModifyItem(),
        'screenAddTrip' :(context) => ScreenAddTrip(),
      }
    );
  }
}

