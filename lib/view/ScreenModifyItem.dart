import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../assets/TextFormFieldStardard.dart';
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
  
  // Border button standard
  double shapeBorderTxtField = 6;
  // Box separate
  double boxSeparateHeight = 20;

  List<Trip> lista = [];

  void saveChanges(Trip trip){
    if (formKey.currentState!.validate()) {
      setState(() {
        // Captura os dados modificados para salvar ou adicionar na lista
        int id = int.parse(txtId.text);
        String travelName = txtTravelName.text;
        String place = txtPlace.text;
        double price = double.parse(txtPrice.text);
        String description = txtDescription.text;

        trip.id = id;
        trip.travelName = travelName;
        trip.place = place;
        trip.price = price;
        trip.description = description;

        Navigator.pop(context);
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    
    Trip trip = ModalRoute.of(context)!.settings.arguments as Trip;
    // FullName input
    txtTravelName = TextEditingController(text: trip.travelName);
    // Email input
    txtId = TextEditingController(text: trip.id.toString());
    // Password input
    txtPlace = TextEditingController(text: trip.place);
    // Confirm your password input
    txtPrice = TextEditingController(text: trip.price.toString());
    // Description
    txtDescription = TextEditingController(text: trip.description);
  
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
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30,),
                    // 
                    // Subtitle
                    // 
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                      'Type the modifications',
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
                          onPressed: (){saveChanges(trip);},
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
 