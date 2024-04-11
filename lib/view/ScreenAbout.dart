import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_travelling_shop/assets/TextInformations.dart';

class ScreenAbout extends StatefulWidget {
  const ScreenAbout({super.key});
  // Declare a field that holds the Todo.
  
  @override
  State<ScreenAbout> createState() => _ScreenAboutState();
}


class _ScreenAboutState extends State<ScreenAbout> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text('Informations'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        //
        // ListView
        //
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
          child : SingleChildScrollView(
            child: Column(
            children: [
              Image.asset('lib/images/logoApp.png'),
              SizedBox(height: 20,),
              TextInformations(
                fullName: 'Raul Tavares Danielli',
                id: '836461',
                aboutMe: 'Olá me chamo Raul tenho 22 anos sou de Ribeirão Preto e estou curso engenharia da computação',
                projectDescription: 'O projeto foi desenvolvido para a matéria de Novas Tecnologias de Informação e'+
                  'Comunicação, coordenada pelo professor Rodrigo Plotze. O aplicativo visa mostrar o conhecimento adquirido na' +
                  ' matéria ao longo do tempo. '+
                  'O tema escolhido surgiu com a vontade de organizar as viagens já feitas ou que deseje fazer. Assim surgiu o aplicativo Travelling,'+
                  ' que tem como objetivo criar listas dinâmicas capazes de colocar lugares que deseja viajar ou que já viajou.'+
                  ' Para isso consta com um "Banco de dados local", há uma variável de lista do tipo usuário que vai atualizando '+
                  'ao inserir um usuário. O usuário é capaz de criar uma lista com o nome na qual deseje. É possível excluir listas e itens da lista '+
                  'presionando por um tempo o item ou lista. Assim também com um clique é capaz de modificar o item, já a lista é necessário clicar na'+
                  ' lupa para pesquisar a lista, assim ao clicar na lista será possível editá-la. Também é possível clicar na parte superior no sinal de certinho,'+
                  ' dentro de uma lista, assim podemos marcar como viagem feita. Outra funcionalidade é de adicionar'+
                  ' itens ou listas, no botão futuante com um mais abaixo na esquerda. E por fim no menu hamburg ao lado se encotra o sobre. Conta com alguns usuários ' +
                  'já adicionados para facilitar os testes.',
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
 