// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import '../assets/TextFormFieldStardard.dart';
// import '../model/Trip.dart';

// class ScreenAddTrip extends StatefulWidget {
//   const ScreenAddTrip({super.key});
//   // Declare a field that holds the Todo.
  
//   @override
//   State<ScreenAddTrip> createState() => _ScreenAddTripState();
// }


// class _ScreenAddTripState extends State<ScreenAddTrip> {
  
//   @override
//   Widget build(BuildContext context) {
//     // FullName input
//     var txtTravelName = TextEditingController();
//     // Email input
//     var txtId = TextEditingController();
//     // Password input
//     var txtPlace = TextEditingController();
//     // Confirm your password input
//     var txtPrice = TextEditingController();
//     // Description
//     var txtDescription = TextEditingController();

//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//             'lib/images/background_login.jpg',
//             ),
//             fit: BoxFit.fill,
//           ),
//         ),
//         alignment: Alignment.center,
//         child: Padding( 
//           padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
//           child: SingleChildScrollView(        
//             child: Center(            
//               child: Form(    
//                 key: formKey,             
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
                  
//                   children: [
//                     // 
//                     // App Name Title
//                     // 
//                     Text(
//                       'Add a travel',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 30,),
//                     // 
//                     // Subtitile
//                     // 
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                       'Trip name',
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     // 
//                     // Input travel name
//                     // 
//                     TextFormFieldStardard(
//                       controller: txtTravelName,
//                       labelText: 'Travel name',
//                       validatorMessage: 'Type some name',
//                     ),
//                     // 
//                     // Input id
//                     // 
//                     TextFormFieldStardard(
//                       controller: txtId,
//                       labelText: 'Travel id',
//                       validatorMessage: 'Type some id',
//                     ),
//                     // 
//                     // Input price
//                     // 
//                     TextFormFieldStardard(
//                       controller: txtPlace,
//                       labelText: 'Travel name',
//                       validatorMessage: 'Type some name',
//                     ),
//                     // 
//                     // Input price
//                     // 
//                     TextFormFieldStardard(
//                       controller: txtPrice,
//                       labelText: 'Travel price',
//                       validatorMessage: 'Type some price',
//                     ),
//                     // 
//                     // Input description
//                     // 
//                     TextFormFieldStardard(
//                       controller: txtDescription,
//                       labelText: 'Travel description',
//                       validatorMessage: 'Type some description',
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [                   
//                         ElevatedButton(
//                           child: Text(
//                             'Save',
//                           ),
//                           onPressed:(){
//                             addTravel();
//                           },
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: Text(
//                             'Back',
//                           ),
//                         ),
//                       ],                  
//                     ),
//                   ]  
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
 