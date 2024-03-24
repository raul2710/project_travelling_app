// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ScreenSubscribe extends StatefulWidget {
  const ScreenSubscribe({super.key});

  @override
  State<ScreenSubscribe> createState() => _ScreenSubscribeState();
}

class _ScreenSubscribeState extends State<ScreenSubscribe> {
  
  // Chave para o formulario
  var formKey = GlobalKey<FormState>();
  var status = false;

  // Email text
  var txtEmail = TextEditingController();
  // Password text
  var txtPassword = TextEditingController();

    // final nome =  ModalRoute.of(context)!.settings.arguments;

  @override
  Widget build(BuildContext context) {
    
    // final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    //   // primary: Colors.black87,
    //   minimumSize: Size(88, 36),
    //   padding: EdgeInsets.symmetric(horizontal: 16),
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(2)),
    //   ),
    // );
    
    final TextStyle styleToTextForm = TextStyle(
      
    );

    bool _checked = false;
    return Scaffold(
      
      body: Padding( 
        
        padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: SingleChildScrollView(
          
          child: Form(
            key: formKey,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [
                // 
                // Icone
                // 
                Icon(
                  Icons.sentiment_satisfied,
                  size: 120,
                  color: Colors.amber.shade200,
                ),
                // 
                // Email content text
                // 
                TextFormField(
                  controller: txtEmail,

                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe um valor';
                    }
                    return null;
                  },
                ),
                
                SizedBox(height: 30,),
                // 
                // Password content text
                // 
                TextFormField(
                  controller: txtPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if (value!.isEmpty) {
                      return 'Type a password';
                    }
                    return null;
                  }
                ),
                TextFormField(
                  controller: txtPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm your password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if (value!.isEmpty) {
                      return 'Type a password';
                    }
                    return null;
                  }
                ),
                // 
                // Remember me checkBox
                // 
                CheckboxListTile(
                  title: Text('Remember me'),
                  value: _checked,
                  onChanged:(bool? value) {
                    value = !_checked;
                  },
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  controlAffinity: ListTileControlAffinity.leading,                  
                ),
                // 
                // Button Login
                // 
                SizedBox(
                  width: double.infinity, // <-- match_parent
                  
                  child: OutlinedButton(
                  // style: flatButtonStyle,
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    ),

                    onPressed: (){
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          var v1 = txtEmail.text;
                          var v2 = txtPassword.text;
                          // var msg = 'Tudo certo por enquanto \n email: $v1 \n Senha: $v2';
                        });

                      } else {
                        // Erro na validação
                      }
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                ),
                

                
                // 
                // Reset password and subscribe
                // 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: null , 
                      // style: flatButtonStyle,
                      child: Text('Reset password'),
                    ),
                    TextButton(
                      onPressed: null,
                      // style: flatButtonStyle,
                      child: Text('Inscrever'),
                    ),
                  ],
                ),
                // 
                // Google and facebook buttons
                // 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    
                    IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, 'https://www.facebook.com/?locale=pt_BR');
                      }, 
                      icon: Icon(Icons.videogame_asset),
                      iconSize: 100,
                      ),
                  ],                  
                ),
              ]  
            ),
          ),
        ),
      ),
    );
  }
}
 