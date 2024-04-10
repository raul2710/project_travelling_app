import 'package:flutter/material.dart';

class TextFormFieldStardard extends StatelessWidget {
  const TextFormFieldStardard({
    super.key,
    this.controller,
    this.labelText,
    this.onPressed,
    this.validator,
    this.validatorMessage,
    this.obscureText = false,
  });

  final VoidCallback ?onPressed;
  final VoidCallback ?validator;
  final TextEditingController ?controller;
  final String ?labelText;
  final String ?validatorMessage;
  final bool obscureText;

  InputDecoration txtDecorationLoginAndSubscribe(){
    double shapeBorderTxtField = 10;
      return InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(234, 199, 199, 199),
        floatingLabelStyle: TextStyle(
          color: Color.fromARGB(185, 145, 145, 145),
          fontSize: 20,
          // Colocar uma borda nas linhas
        ),
        labelText: labelText,
        border: OutlineInputBorder( 
          borderRadius: BorderRadius.all(Radius.circular(shapeBorderTxtField)),
        ),
      );
  }
  
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TextFormField(
      controller: controller,
      decoration: txtDecorationLoginAndSubscribe(),
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
      ),
     );
    
    
  }
}


  // InputDecoration txtDecorationLoginAndSubscribe(label){
  //     return InputDecoration(
  //       filled: true,
  //       fillColor: Color.fromARGB(178, 253, 253, 253),
  //       floatingLabelStyle: TextStyle(
  //         color: const Color.fromARGB(255, 255, 255, 255),
  //         fontSize: 20,
  //         // Colocar uma borda nas linhas
  //       ),
  //       labelText: label,
  //       labelStyle: MaterialStateTextStyle.resolveWith(
  //           (Set<MaterialState> states) {
  //             final Color color = states.contains(MaterialState.error)
  //                 ? Theme.of(context).colorScheme.error
  //                 : Color.fromARGB(255, 255, 255, 255);
  //             return TextStyle(color: Color.fromRGBO(0, 0, 0, 0.753), letterSpacing: 1.3,);
  //           },
  //         ),
  //       border: OutlineInputBorder( 
  //         borderRadius: BorderRadius.all(Radius.circular(shapeBorderTxtField)),
  //       ),
  //     );
  //   }