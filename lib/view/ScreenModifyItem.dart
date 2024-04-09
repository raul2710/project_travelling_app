// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/Trip.dart';

class ScreenModifyItem extends StatefulWidget {
  //final Trip trip;
  const ScreenModifyItem({super.key});
  // Declare a field that holds the Todo.
  
  @override
  State<ScreenModifyItem> createState() => _ScreenModifyItemState();
}
class _ScreenModifyItemState extends State<ScreenModifyItem> {
  
  var formKey = GlobalKey<FormState>();
  var status = false;
  
  // Border button standard
  double shapeBorderTxtField = 6;
  // Box separate
  double boxSeparateHeight = 20;

  List<Trip> lista = [];

  @override
  Widget build(BuildContext context) {
    
    Trip trip = ModalRoute.of(context)!.settings.arguments as Trip;

    // FullName input
    var txtTravelName = TextEditingController(text: trip.travelName);
    // Email input
    var txtId = TextEditingController(text: trip.id.toString());
    // Password input
    var txtPlace = TextEditingController(text: trip.place);
    // Confirm your password input
    var txtPrice = TextEditingController(text: trip.price.toString());
    // Description
    var txtDescription = TextEditingController(text: trip.description);

    InputDecoration txtDecorationLoginAndSubscribe(label){
      return InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(178, 253, 253, 253),
        floatingLabelStyle: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 20,
          // Colocar uma borda nas linhas
        ),
        labelText: label,
        labelStyle: MaterialStateTextStyle.resolveWith(
            (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Color.fromARGB(255, 255, 255, 255);
              return TextStyle(color: Color.fromRGBO(0, 0, 0, 0.753), letterSpacing: 1.3,);
            },
          ),
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
                    // 
                    // App Name Title
                    // 
                    Text(
                      'Modify the trip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30,),
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
                          return 'Type a name of travel';
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
                          return 'Type an id of travel';
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
                          return 'Type a place';
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
                          return 'Type a price of travel';
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
                          return 'Type some description';
                        }
                        return null;
                      }
                    ),
                    SizedBox(height: boxSeparateHeight,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [                   
                        ElevatedButton(
                          child: Text(
                            'Save',
                          ),
                          onPressed:(){

                            if (formKey.currentState!.validate()) {
                              setState(() {
                                // Captura os dados modificados para salvar ou adicionar na lista
                                int id = int.parse(txtId.text);
                                String travelName = txtTravelName.text;
                                String place = txtPlace.text;
                                double price = double.parse(txtPrice.text);
                                String description = txtDescription.text;

                                //final trip = Trip(id, travelName, place, price, description);
                                trip.id = id;
                                trip.travelName = travelName;
                                trip.place = place;
                                trip.price = price;
                                trip.description = description;

                                // listTravels.add(trip);

                                Navigator.pop(context);
                              });
                
                            } else {
                              // Erro na validação
                            }
                            
                          }, /*saveChanges()*/
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
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
 