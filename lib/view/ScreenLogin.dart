// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_travelling_shop/main.dart';

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
  var status = false;
  
  var shapeBorderTxtField = 6.0;

  // Email text
  var txtEmail = TextEditingController();
  // Password text
  var txtPassword = TextEditingController();
  var _checked = false;
    // final nome =  ModalRoute.of(context)!.settings.arguments;

  @override
  Widget build(BuildContext context) {

    InputDecoration txtDecorationLoginAndSubscribe(label){
      return InputDecoration(
        filled: true,
        fillColor: Colors.white24,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(shapeBorderTxtField)),
        ),
      );
    }

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
                    // Email content text
                    // 
                    TextFormField(
                      controller: txtEmail,
                      
                      decoration: txtDecorationLoginAndSubscribe('Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe um valor';
                        }
                        return null;
                      },
                    ),
                    
                    SizedBox(height: 30,),
                    // 
                    // Password content text
                    // 
                    TextFormField(
                      controller: txtPassword,
                      obscureText: true,
                      decoration: txtDecorationLoginAndSubscribe('Password'),
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Type a password';
                        }
                        return null;
                      }
                    ),
                    // 
                    // Remember me checkBox
                    // 
                    CheckboxListTile(
                      title: Text('Remember me'),
                      value: _checked,
                      onChanged:(bool? value) {setState(() {
                        _checked = !_checked;
                      });
                        
                      },
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      controlAffinity: ListTileControlAffinity.leading,                  
                    ),
                    // 
                    // Button Login
                    // 
                    SizedBox(
                      width: double.infinity, // <-- match_parent
                      
                      child: OutlinedButton(
                      // style: flatButtonStyle,
                      
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          )  
                        ),           
                        onPressed: (){
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
                                    'screenListTravels', 
                                    arguments: user,
                                  );
                                });
                              } else {
                                
                              }

                          } else {
                            // Erro na validação
                            // senha e usuario errados
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
 