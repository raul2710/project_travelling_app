// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project_travelling_shop/model/User.dart';

import '../model/Trip.dart';

class ScreenModifyItem extends StatefulWidget {
  const ScreenModifyItem({super.key});

  @override
  State<ScreenModifyItem> createState() => _ScreenModifyItemState();
}
class _ScreenModifyItemState extends State<ScreenModifyItem> {
  
  // Chave para o formulario
  var formKey = GlobalKey<FormState>();
  var status = false;
  
  // Border button standard
  double shapeBorderTxtField = 6;
  // Box separate
  double boxSeparateHeight = 20;

  List<Trip> lista = [];
  Trip trip = content;

  // FullName input
  var txtTravelName = TextEditingController();
  // Email input
  var txtId = TextEditingController();
  // Password input
  var txtPlace = TextEditingController();
  // Confirm your password input
  var txtPrice = TextEditingController();
  // 
  var txtDescription = TextEditingController();

  var _checked = false;
    // final nome =  ModalRoute.of(context)!.settings.arguments;

  @override
  Widget build(BuildContext context) {

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
                      'Modify the trip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 50,),
                    // 
                    // 
                    // 
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                      'Trip name',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: boxSeparateHeight,),
                    TextFormField(
                      controller: txtTravelName,
                      
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
                      controller: txtDescription,
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
                      controller: txtDescription,
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
                      controller: txtDescription,
                      obscureText: true,
                      decoration: txtDecorationLoginAndSubscribe('Consfirm your password'),
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Type your password';
                        }
                        else if(value != txtDescription.text){
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
                        _checked = true;
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
                            setState(() {
                              var v1 = txtDescription.text;
                              var v2 = txtDescription.text;
                              // var msg = 'Tudo certo por enquanto \n email: $v1 \n Senha: $v2';
                            });
              
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [                   
                        ElevatedButton(
                          onPressed: /*saveChanges()*/
                            lista.,
                          child: Text(
                            'Save',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'screenListTravels');
                          },
                          child: Text(
                            'Back',
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'https://www.facebook.com/?locale=pt_BR');
                          }, 
                          icon: Image.asset('lib/images/icons/facebook_logo.png'),
                          iconSize: 50,
                        ),
                        OutlinedButton(
                          onPressed: () {Navigator.pushNamed(context, 'screenLogin');}, 
                          child: Text('Voltar'),
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
 