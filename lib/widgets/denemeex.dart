import 'package:flutter/material.dart';

class denmekart extends StatelessWidget {
  final String baslik;
  final String imagex;
  final String navigasyon;
  denmekart(this.baslik, this.imagex, this.navigasyon);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, navigasyon);
            },
            child: Container(
              width: 140,
              height: 140,
              margin: EdgeInsets.only(right: 10.0, top: 15.0, left: 5),

              decoration: BoxDecoration(
                color: Colors.amber,
                //border: Border.all(color: Colors.blueAccent),
                borderRadius: new BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    image:  DecorationImage(


                        image: AssetImage(
                          imagex
                          //imagePath.toString()
                          //'images/money.png',

                        ),
                      /*
                      NetworkImage(
                        networkimage,
                      ),

                       */
                      //fit: BoxFit.cover,
                        fit: BoxFit.fitHeight
                    ),
                    //border: Border.all(color: Colors.blueAccent),
                    borderRadius: new BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, navigasyon);
            },
            child: Container(
              width: 150,
              margin: EdgeInsets.only(right: 10.0, top: 15.0, left: 5),
              child: Text(
                baslik,
                style: TextStyle(fontSize: 15),textAlign: TextAlign.center,
              ),
            ),),
        ]);
  }
}
