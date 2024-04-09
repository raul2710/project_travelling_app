// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_travelling_shop/model/Trip.dart';

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
  // Border button standard
  double shapeBorderTxtField = 6;
  // Box separate
  double boxSeparateHeight = 20;

  // FullName input
  var txtFullName = TextEditingController();
  // Email input
  var txtEmail = TextEditingController();
  // Password input
  var txtPassword = TextEditingController();
  // Confirm your password input
  var txtConfirmPassword = TextEditingController();

  var _checked = false;
    // final nome =  ModalRoute.of(context)!.settings.arguments;

  @override
  Widget build(BuildContext context) {
    listUsers = ModalRoute.of(context)!.settings.arguments as List<User>;

    double shapeBorderTxtField = 6;
    InputDecoration txtDecorationLoginAndSubscribe(label){
      return InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(167, 255, 255, 255),
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
                    SizedBox(height: boxSeparateHeight,),

                    TextFormField(
                      controller: txtFullName,
                      
                      decoration: txtDecorationLoginAndSubscribe('Full name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Type your full name';
                        }
                        return null;
                      },
                    ),
                  
                    SizedBox(height: boxSeparateHeight,),
                    // 
                    // Password content text
                    // 
                    TextFormField(
                      controller: txtEmail,
                      decoration: txtDecorationLoginAndSubscribe('Email'),
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Type an email';
                        }
                        return null;
                      }
                    ),
                    SizedBox(height: boxSeparateHeight,),

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
                    SizedBox(height: boxSeparateHeight,),
                    TextFormField(
                      controller: txtConfirmPassword,
                      obscureText: true,
                      decoration: txtDecorationLoginAndSubscribe('Consfirm your password'),
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Type your password';
                        }
                        else if(value != txtPassword.text){
                          return 'Type the same password';
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
                      onChanged:(bool? value) {
                        setState(() {
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
                            if(listUsers.any((u) => u.email == txtEmail.text)){
                              //erro
                            } else{
                              setState(() {
                                final String fullName = txtFullName.text;
                                final String email = txtEmail.text;
                                final String password = txtPassword.text;

                                List<Trip> listTripsEmpty = [];

                                final User user = User(fullName, email, password, listTripsEmpty);
                                listUsers.add(user);
                                
                                Navigator.pop(context);
                              });
                            }
                          } else {
                            // Erro na validação
                          }
                        },
                        child: Text(
                          'Subscribe',
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),               
                    //
                    // Google and facebook buttons
                    // 
                    SizedBox(height: boxSeparateHeight,),
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
 