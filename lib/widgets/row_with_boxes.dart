import 'package:flutter/material.dart';
import 'package:kelime_kartlari02/widgets/denemeex.dart';

import 'package:kelime_kartlari02/kartbilgileri.dart';

import '../listeler.dart';

class RowBox extends StatelessWidget {
  final List listeadi;
  final String rowName;
  RowBox(this.listeadi, this.rowName);
  //const RowBox({Key? key}) : super(key: key);

  @override


  Widget build(BuildContext context){
    return Column(

      children: [
        Container(
          margin: EdgeInsets.only(top:5),
          color: Color(0xFFECECEC),
          height: 23,
          width: MediaQuery.of(context).size.width,
          child: Text(
            rowName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          color: Color(0xFFECECEC),
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listeadi.length,
              itemBuilder: (context, index){
              return denmekart(listeadi[index].containerName,listeadi[index].containerImageURL,listeadi[index].containerNavigasyon);
              }
          ),
        ),
      ],
    );
  }
  }
