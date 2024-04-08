// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//
// TELA PRINCIPAL
// Stateful = stf + TAB
class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  var texto = 'Calculadora';
  var resultado = '';

  //Atributos para leitura dos valores dos Campos de Texto
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  //
  // MÉTODOS
  //

  //Método para criar o botão dinâmicamente
  Widget criarBotao(operacao) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          double v1 = double.parse(txtValor1.text);
          double v2 = double.parse(txtValor2.text);
          double s = 0;
          switch (operacao) {
            case '+':
              s = v1 + v2;
              break;
            case '-':
              s = v1 - v2;
              break;
            case '*':
              s = v1 * v2;
              break;
            case '/':
              s = v1 / v2;
              break;
          }
          resultado = 'Resultado: $s';
          //
          // EXIBIR o resultado em uma Caixa de Diálogo
          //
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(resultado),
              duration: Duration(seconds: 3),
            ),
          );
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(85, 60),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
      ),
      //Aparência
      child: Text(
        operacao,
        style: TextStyle(
          fontSize: 26,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        //Espaçamento com o mesmo valor nas 4 extremidades
        //padding: const EdgeInsets.all(50.0),
        padding: const EdgeInsets.fromLTRB(30, 80, 30, 50),
        child: Column(
          children: [
            Center(
              child: Text(
                texto,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // CAMPO DE TEXTO
            TextField(
              //Associar o atributo
              controller: txtValor1,

              style: TextStyle(fontSize: 36),
              decoration: InputDecoration(
                labelText: 'Valor 1',
                labelStyle: TextStyle(fontSize: 22),
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),

            SizedBox(
              height: 30,
            ),

            // CAMPO DE TEXTO
            TextField(
              controller: txtValor2,
              style: TextStyle(fontSize: 36),
              decoration: InputDecoration(
                labelText: 'Valor 2',
                labelStyle: TextStyle(fontSize: 22),
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                criarBotao('+'),
                criarBotao('-'),
                criarBotao('*'),
                criarBotao('/'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  txtValor1.clear();
                  txtValor2.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(180, 60),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue.shade900,
              ),
              //Aparência
              child: Text(
                'limpar',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
