import 'package:flutter/material.dart';

import '../listeler.dart';
import '../widgets/boxContainer.dart';
import '../widgets/row_with_boxes.dart';
class A1A2Page extends StatelessWidget {
  const A1A2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      body: SafeArea(
        child: (SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Colors.cyan,
                height: 20,
              ),

              RowBox(liste1,'   Basics'),

              RowBox(listefruits,'   Fruits and Vegetables'),


              RowBox(listehouse,'   House'),

              RowBox(listeSayi,'   Numbers'),
              //RowBox(liste1,'   Art'),


              boxContainer( subjectBoxColor: Colors.orange,
                  navigationText:'/learningpagea1',
                  gorselx:'images/a1vocabulary.png'),

              boxContainer( subjectBoxColor: Colors.orange,
                  navigationText:'/learningpagea2',
                  gorselx:'images/a2vocabulary.png'),
            ],
          ),
        )),
      ),
    );
  }
}
