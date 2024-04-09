
import 'package:flutter/material.dart';

class FormsTextField extends StatefulWidget {
  // Opcional colocar ? text
  final TextEditingController controller;

  const FormsTextField({super.key, 
    required this.controller 
  });

  @override
  State<FormsTextField> createState() => _FormsTextFieldState();
 
} 

class _FormsTextFieldState extends State<FormsTextField>{
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: txtDecorationLoginAndSubscribe('Travel title'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Type a name of travel';
        }
        return null;
      },
    );


  }
}