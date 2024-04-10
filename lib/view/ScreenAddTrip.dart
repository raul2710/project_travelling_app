import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../assets/TextFormFieldStardard.dart';
import '../model/Trip.dart';

class ScreenAddTrip extends StatefulWidget {
  const ScreenAddTrip({super.key});
  // Declare a field that holds the Todo.
  
  @override
  State<ScreenAddTrip> createState() => _ScreenAddTripState();
}


class _ScreenAddTripState extends State<ScreenAddTrip> {
  
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

    void addTravel(){
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
      }
    }

    // Validador se as senhas são iguais
    // validator: (value){
    //                     if (value!.isEmpty) {
    //                       return 'Type your password';
    //                     }
    //                     else if(value != txtPassword.text){
    //                       return 'Type the same password';
    //                     }
    //                     return null;
    //                   }

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
                      'Add a travel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30,),
                    // 
                    // Subtitile
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
                    // 
                    // Input travel name
                    // 
                    TextFormFieldStardard(
                      controller: txtTravelName,
                      labelText: 'Travel name',
                      validatorMessage: 'Type some name',
                    ),
                    // 
                    // Input id
                    // 
                    TextFormFieldStardard(
                      controller: txtId,
                      labelText: 'Travel id',
                      validatorMessage: 'Type some id',
                    ),
                    // 
                    // Input price
                    // 
                    TextFormFieldStardard(
                      controller: txtPlace,
                      labelText: 'Travel name',
                      validatorMessage: 'Type some name',
                    ),
                    // 
                    // Input price
                    // 
                    TextFormFieldStardard(
                      controller: txtPrice,
                      labelText: 'Travel price',
                      validatorMessage: 'Type some price',
                    ),
                    // 
                    // Input description
                    // 
                    TextFormFieldStardard(
                      controller: txtDescription,
                      labelText: 'Travel description',
                      validatorMessage: 'Type some description',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [                   
                        ElevatedButton(
                          child: Text(
                            'Save',
                          ),
                          onPressed:(){
                            addTravel();
                          },
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
 