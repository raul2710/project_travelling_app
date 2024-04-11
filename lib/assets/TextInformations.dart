import 'package:flutter/material.dart';

class TextInformations extends StatelessWidget {
  const TextInformations({
    super.key,
    required this.fullName,
    required this.id,
    required this.aboutMe,
    required this.projectDescription,
  });

  final String fullName;
  final String id;
  final String aboutMe;
  final String projectDescription;

  Card CustomCard(String text, String title){
    return Card(
        child:Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ) ,
            ),
            // Flexible(
            //   child:,
            // ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  text,
                  textAlign: TextAlign.justify,
                ),
            )
            
          ]
        ), 
      );
            
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomCard(fullName, 'Nome completo'),
          CustomCard(id, 'Id'),
          CustomCard(aboutMe, 'Sobre mim'),
          CustomCard(projectDescription, 'Sobre o projeto'),
        ]
      ),
    );
  }
}