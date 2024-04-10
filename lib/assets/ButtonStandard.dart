import 'package:flutter/material.dart';

class ButtonStandard extends StatelessWidget {
  const ButtonStandard({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;
    
  InputDecoration txtDecorationLoginAndSubscribe(label){
    return InputDecoration(
      filled: true,
      fillColor: Colors.white24,
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // <-- match_parent
      
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          )  
        ),           
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 36,
            color: Colors.black,
          ),
        ),
      ),
    ); 
  }
}

