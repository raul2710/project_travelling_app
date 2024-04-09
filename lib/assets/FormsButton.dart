
import 'package:flutter/material.dart';

class FormsButton extends StatefulWidget {
  // Opcional colocar ? text
  final String text;

  const FormsButton({super.key, 
    required this.text 
  });

  @override
  State<FormsButton> createState() => _FormsButtonState();
 
} 

class _FormsButtonState extends State<FormsButton>{


  @override
  Widget build(BuildContext context) {
    return Text('teste');
  }
}