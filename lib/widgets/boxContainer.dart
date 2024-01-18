import 'package:flutter/material.dart';

class boxContainer extends StatelessWidget {
  //const SubjectBox({Key? key}) : super(key: key);
  final Color? subjectBoxColor;
  final String? navigationText;
  final String? gorselx;
  final String? appbarname;
  boxContainer({
      this.subjectBoxColor,  this.navigationText, this.gorselx,this.appbarname});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, navigationText!);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Container(
          width: MediaQuery.of(context).size.width-10,
          height: 180,
          margin: EdgeInsets.only(right: 10.0, top: 15.0, left: 5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(gorselx!),

              /*NetworkImage(
                gorselx!,
              ),

               */
              fit: BoxFit.cover,
            ),
            //color: subjectBoxColor,
            //border: Border(
            //bottom: BorderSide(width: 30.0, color: Colors.lightBlue.shade900),
            border: Border.all(
              color:Colors.grey,
            ),
            borderRadius: new BorderRadius.all(
              Radius.circular(20),

              // borderRadius: new BorderRadius.only(
              //   topLeft: const Radius.circular(40.0),
            ),
          ),

        ),
      ),
    );
  }
}
