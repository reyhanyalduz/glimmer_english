import 'package:flutter/material.dart';
import 'package:kelime_kartlari02/widgets/boxContainer.dart';
import 'package:kelime_kartlari02/widgets/row_with_boxes.dart';
import '../listeler.dart';
import '../widgets/denemeex.dart';

class B1B2Page extends StatelessWidget {
  const B1B2Page({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: (SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Colors.cyan,
                height: 20,
              ),


              RowBox(listehospitalb,'   Hospital'),
              RowBox(listetechnologyb,'   Technology'),
              boxContainer( subjectBoxColor: Colors.orange,
                  navigationText:'/learningpagephrasalverbs',
                  gorselx:'images/phrasalverbs.png'),
              RowBox(liste2,'   Art'),
            ],
          ),
        )),
      ),
    );
  }
}
