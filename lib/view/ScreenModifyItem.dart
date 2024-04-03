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

  List<Trip> lista = [];

  var _checked = false;
    // final nome =  ModalRoute.of(context)!.settings.arguments;

  @override
  Widget build(BuildContext context) {

    final trip = ModalRoute.of(context)!.settings.arguments;

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
                    // 
                    // Input travel name
                    // 
                    TextFormField(
                      controller: txtTravelName,
                      
                      decoration: txtDecorationLoginAndSubscribe('Travel title'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Type your full name';
                        }
                        return null;
                      },
                    ),
                  
                    SizedBox(height: boxSeparateHeight,),
                    // 
                    // Input id
                    // 
                    TextFormField(
                      controller: txtId,

                      decoration: txtDecorationLoginAndSubscribe('Id trip'),
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Type an id trip';
                        }
                        return null;
                      }
                    ),
                    SizedBox(height: boxSeparateHeight,),
                    // 
                    // Input price
                    // 
                    TextFormField(
                      controller: txtPlace,
                      
                      decoration: txtDecorationLoginAndSubscribe('Place'),
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Type a password';
                        }
                        return null;
                      }
                    ),
                    SizedBox(height: boxSeparateHeight,),
                    TextFormField(
                      controller: txtPrice,
                      
                      decoration: txtDecorationLoginAndSubscribe('Price'),
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Type your password';
                        }
                        return null;
                      }
                    ),
                    SizedBox(height: boxSeparateHeight,),
                    // 
                    // Input description
                    // 
                    TextFormField(
                      controller: txtDescription,
                      
                      decoration: txtDecorationLoginAndSubscribe('Description'),
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
                    // Button Login
                    // 
                    //
                    // Google and facebook buttons
                    // 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [                   
                        ElevatedButton(
                          onPressed:(){

                            if (formKey.currentState!.validate()) {
                              setState(() {
                                var v1 = txtDescription.text;
                                var v2 = txtDescription.text;

                                // Captura os dados modificados para salvar ou adicionar na lista
                                int id = int.parse(txtId.text);
                                String travelName = txtTravelName.text;
                                String place = txtPlace.text;
                                double price = double.parse(txtPrice.text);
                                String description = txtDescription.text;

                                final trip = Trip(id, travelName, place, price, description);

                                lista.add(trip);

                                Navigator.pushNamed(context, 'screenListTravels');
                              });
                
                            } else {
                              // Erro na validação
                            }
                            
                          }, /*saveChanges()*/
                          child: Text(
                            'Save',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                var v1 = txtDescription.text;
                                var v2 = txtDescription.text;
                                Navigator.pushNamed(context, 'screenListTravels');
                              });
                            } else {
                              // Erro na validação
                            }
                          },
                          child: Text(
                            'Back',
                          ),
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
 