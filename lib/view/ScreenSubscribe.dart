// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_travelling_shop/model/Trip.dart';
import 'package:project_travelling_shop/model/TripCategory.dart';

import '../assets/ButtonStandard.dart';
import '../assets/TextFormFieldStardard.dart';
import '../model/User.dart';

class ScreenSubscribe extends StatefulWidget {
  const ScreenSubscribe({super.key});
  //print(listUser.toString());
  @override
  State<ScreenSubscribe> createState() => _ScreenSubscribeState();
}
class _ScreenSubscribeState extends State<ScreenSubscribe> {
  // Chave para o formulario
  var formKey = GlobalKey<FormState>();

  List<User> listUsers = [];

  // FullName input
  var txtFullName = TextEditingController();
  // Email input
  var txtEmail = TextEditingController();
  // Password input
  var txtPassword = TextEditingController();
  // Confirm your password input
  var txtConfirmPassword = TextEditingController();

  Future openDialog(String error) => showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      title: Text('Error'),
      content: Text(error),
      actions: [
        TextButton(
          onPressed: (){Navigator.of(context).pop();}, 
          child: Text('Ok')),
      ],
    )
  );

  void saveUser(){
    if (formKey.currentState!.validate()) {
      if(listUsers.any((u) => u.email == txtEmail.text)){
        // Error email already subscribed
        openDialog('Email already subscribe');
      } else if(txtPassword.text != txtConfirmPassword.text){
        // Password different
        openDialog('Different password typed');
      } else{
        setState(() {
          final String fullName = txtFullName.text;
          final String email = txtEmail.text;
          final String password = txtPassword.text;

          List<TripCategory> listTripsEmpty = [];

          final User user = User(fullName, email, password, listTripsEmpty);
          listUsers.add(user);
          
          Navigator.pop(context);
        });
      }
    }
  }

  // validator: (value){
  //                       if (value!.isEmpty) {
  //                         return 'Type your password';
  //                       }
  //                       else if(value != txtPassword.text){
  //                         return 'Type the same password';
  //                       }
  //                       return null;
  //                     }

  @override
  Widget build(BuildContext context) {

    listUsers = ModalRoute.of(context)!.settings.arguments as List<User>;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
            'lib/images/background_login.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        child: Padding( 
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
          child: SingleChildScrollView(        
            child: Center(            
              child: Form(    
                key: formKey,             
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  
                  children: [
                    // 
                    // App Name Title
                    // 
                    Text(
                      'Travelling',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 50,),
                    // 
                    // Subtitle
                    // 
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                      'Sign-up',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // 
                    // Full name content input
                    // 
                    TextFormFieldStardard(
                      controller: txtFullName,
                      labelText: 'Fullname',
                      validatorMessage: 'Type your fullname',
                    ),
                    // 
                    // Email content input
                    // 
                    TextFormFieldStardard(
                      controller: txtEmail,
                      labelText: 'Email',
                      validatorMessage: 'Type your email',
                    ),
                    // 
                    // Password content input
                    // 
                    TextFormFieldStardard(
                      controller: txtPassword,
                      obscureText: true,
                      labelText: 'Password',
                      validatorMessage: 'Type your password',
                    ),
                    // 
                    // Password confirm content input
                    //
                    TextFormFieldStardard(
                      controller: txtConfirmPassword,
                      obscureText: true,
                      labelText: 'Confirm your password',
                      validatorMessage: 'Type the same password',
                    ),
                    SizedBox(height: 10,),
                    // 
                    // Button subscribe
                    // 
                    ButtonStandard(
                      text:'Subscribe',
                      onPressed: saveUser,
                    ), 
                    //
                    // Google and facebook buttons
                    // 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [                   
                        IconButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'https://www.facebook.com/?locale=pt_BR');
                          }, 
                          icon: Image.asset('lib/images/icons/google_logo.png'),
                          iconSize: 50,
                        ),
                        IconButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'https://www.facebook.com/?locale=pt_BR');
                          }, 
                          icon: Image.asset('lib/images/icons/facebook_logo.png'),
                          iconSize: 50,
                        ),
                        OutlinedButton(
                          onPressed: () {Navigator.pop(context);}, 
                          child: Text('Back'),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                          )
                        ),
                      ],                  
                    ),
                  ]  
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
 