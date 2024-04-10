// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_travelling_shop/assets/TextFormFieldStardard.dart';
import 'package:project_travelling_shop/main.dart';

import '../assets/ButtonStandard.dart';
import '../model/User.dart';

class ScreenLogin extends StatefulWidget {

  final List<User> listUsers;
  const ScreenLogin({super.key, required this.listUsers});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  
  // Chave para o formulario
  var formKey = GlobalKey<FormState>();
  // Email text
  var txtEmail = TextEditingController();
  // Password text
  var txtPassword = TextEditingController();
  // CheckBox remember me
  var checked = false;

  Future openDialog() => showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      title: Text('Error'),
      content: Text('Password wrong or email not found'),
      actions: [
        TextButton(
          onPressed: (){Navigator.of(context).pop();}, 
          child: Text('Ok')),
      ],
    )
  );


  void loginLoad(){  
    if (formKey.currentState!.validate()) {
      if(listUsers.any((u) => u.email == txtEmail.text && u.password == txtPassword.text)){
        User user;
        user = listUsers.singleWhere((u) => 
          u.email == txtEmail.text && 
          u.password == txtPassword.text
        );
        setState(() {
          Navigator.pushNamed(
            context, 
            'screenListCategory', 
            arguments: user.listTripCategory,
          );
        });
      } else openDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    // Remember me checkBox
                    // 
                    CheckboxListTile(
                      title: Text('Remember me'),
                      value: checked,
                      onChanged:(bool? value) {setState(() {
                        checked = !checked;
                      });
                        
                      },
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      controlAffinity: ListTileControlAffinity.leading,                  
                    ),
                    // 
                    // Button Login
                    // 
                    ButtonStandard(
                      text:'Login',
                      onPressed: loginLoad,
                    ),            
                    // 
                    // Reset password and subscribe
                    // 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: (){
                            
                          }, 
                          // style: flatButtonStyle,
                          child: Text('Reset password'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context, 
                              'screenSubscribe',
                              arguments: listUsers,
                            );
                          },
                          // style: flatButtonStyle,
                          child: Text(
                            'Subscribe',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
 