import 'package:flutter/material.dart';

import '../listeler2.dart';

class LearningPage extends StatelessWidget {

  List<String> lerningpagelist ;
  String appbarname;

  LearningPage(this.lerningpagelist,this.appbarname);

  List<Widget> getTextWidgets() {
    List<Widget> _widgets = [];
    for(int i=0;i<lerningpagelist.length;i++) {
      _widgets.add(
          Container(
            padding: EdgeInsets.all(8),
              child: Text(lerningpagelist[i],textAlign: TextAlign.left,))
      );
    }
    return _widgets;
  }


/*
  List<Widget> getTextWidgets() {
    List<Widget> _widgets = [];
    for(int i=0;i<listephrasalverbs.length;i++) {
      _widgets.add(
          Text(listephrasalverbs[i])
      );
    }
    return _widgets;
  }

 */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appbarname),),

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: getTextWidgets(),
            crossAxisAlignment: CrossAxisAlignment.start
        ),
      ),

      /*Container(
        height: 300,
        width: MediaQuery.of(context).size.width,

          child: Text(listephrasalverbs as String),
      ),

       */
    );
  }
}
