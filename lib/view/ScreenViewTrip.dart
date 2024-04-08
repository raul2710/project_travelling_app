import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/Trip.dart';

class ScreenViewTrip extends StatefulWidget {
  const ScreenViewTrip({super.key});
  // Declare a field that holds the Todo.
  
  @override
  State<ScreenViewTrip> createState() => _ScreenViewTripState();
}
class _ScreenViewTripState extends State<ScreenViewTrip> {
  
  var formKey = GlobalKey<FormState>();
  var status = false;
  
  // Border button standard
  double shapeBorderTxtField = 6;
  // Box separate
  double boxSeparateHeight = 20;

  @override
  Widget build(BuildContext context) {
    
    List<Trip> listTravels = ModalRoute.of(context)!.settings.arguments as List<Trip>;

    // FullName input
    var txtTravelName = TextEditingController();
    // Email input
    var txtId = TextEditingController();
    // Password input
    var txtPlace = TextEditingController();
    // Confirm your password input
    var txtPrice = TextEditingController();
    // Description
    var txtDescription = TextEditingController();

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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

                                final Trip tripAdd = Trip(id, travelName, place, price, description, false);
                                
                                listTravels.add(tripAdd);

                                Navigator.pop(context);
                              });
                
                            } else {
                              // Erro na validação
                            }
                            
                          }, /*saveChanges()*/
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                var v1 = txtDescription.text;
                                var v2 = txtDescription.text;
                                
                                Navigator.pop(context);

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
 