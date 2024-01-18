import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_button_type/flutter_button_type.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kelime_kartlari02/pages/etkinlik_sonu.dart';

import '../pages/etkinlik_sonu2.dart';


class kelimeBulmacaSayfasi extends StatefulWidget {
  final String categoryisim;
  kelimeBulmacaSayfasi(this.categoryisim);
  @override
  State<kelimeBulmacaSayfasi> createState() => _kelimeBulmacaSayfasiState();
}

class _kelimeBulmacaSayfasiState extends State<kelimeBulmacaSayfasi> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getWords();
    counterLevel = 0;
  }

  Future<void> getWords() async {
    wordEn = [];
    wordTr = [];
    final CollectionReference myCollection =
        FirebaseFirestore.instance.collection('kelimelerx');
    QuerySnapshot querySnapshot =
        await myCollection.where("category", isEqualTo: widget.categoryisim).get();
    for (var doc in querySnapshot.docs) {
      setState(() {
        wordEn.add(doc.get("en"));
        wordTr.add(doc.get("tr"));
      });
    }
  }

  List<String> wordEn = []; //Elma,Armut,Muz,Kiraz
  List<String> wordTr = [];
  int counterLevel = 0;


  /*
  List<TextEditingController> controllerAnswerList=[];

  final CollectionReference myCollection =
  FirebaseFirestore.instance.collection('kelimelerx');

  final _random = new Random();
  String choosenWordEn = "";
  String choosenWordTr = "";
  int choosenNumber = 0;

  Future<void> getWords() async {
    setState(() {
      controllerAnswerList=[];
    });

    int counterQ = 0;
//////////////////////////////////////
    await myCollection.where("category", isEqualTo: widget.categoryisim).get().then((querySnapshot) {
      for (int i = 0; i < 1; i++) {
        choosenNumber = _random.nextInt(querySnapshot.size);
      }
      ////////////////////////////
      for (var result in querySnapshot.docs) {
        if (counterQ == choosenNumber) {
          print("COUNTER ==>> " + counterQ.toString());
          setState(() {
            choosenWordEn=result['en'].toString();
            choosenWordTr=result['tr'].toString();
            //Elma=4

            //Controller ekleniyor. 1,2,3,4
            //Widget ekliyor.,      1,2,3,4


          });
          break;
        } else {}

        counterQ++;
      }});

////////////////////
  }



   */

/*
  Future<void> deleteData(String wordID) async {
    await FirebaseFirestore.instance
        .collection("kelimelerx")
        .doc(wordID)
        .delete();
  }

 */
  TextEditingController controllerAnswer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return (wordEn.isEmpty || counterLevel >= wordEn.length) ? Container() :
      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 7, 134, 145),
          title: Text(
            "Play Word",
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: Icon(Icons.close))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                //Text(counterLevel.toString()),
                //Text(wordEn[counterLevel]),
                Container(
                    child: Text("'" +
                        wordTr[counterLevel] +
                        "' kelimesinin İngilizce karşılığı nedir?")),
                SizedBox(
                  height: 30,
                ),
                TextFieldContainer(
                  child: TextFormField(
                    controller: controllerAnswer,
                    onEditingComplete: () => TextInput.finishAutofillContext(),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Cevap',
                        hintText: "Doğru cevabı giriniz..."),
                    onChanged: (value) {},
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                FlutterIconButton(
                    buttonText: 'OK',
                    buttonColor: Colors.green,
                    buttonIcon: const Icon(Icons.check),
                    onTap: () {
                      setState(() {
                        counterLevel++;
                        //counterLevel++;
                        if (counterLevel+1 <= wordEn.length) {
                          //counterLevel++;
                          print('counterLevel');
                          print(counterLevel);
                          print('wordEn.length');
                          print(wordEn.length);
                      //choosenWordTr
                      /*
                  int counter=0;
                  for(int i=0;i<wordTr.length;i++){
                    if(controllerAnswerList[i].text==choosenWordEn[i]){
                      counter++;
                    }
                  }

                 */

                      ///////////////////////////////////////////////

                      if (controllerAnswer.text.trim() == wordEn[counterLevel - 1]) {
                        print("Tebrikler doğru bildiniz!");
                        print('counterLevel');
                        print(counterLevel);
                        print('wordEn.length');
                        print(wordEn.length);
                        print(wordEn[counterLevel]);
                        Fluttertoast.showToast(
                          msg: "Tebrikler doğru bildiniz!",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color.fromARGB(255, 173, 255, 177),
                          textColor: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18.0,
                        );
                      } else if (controllerAnswer.text.trim().toUpperCase() ==
                          wordEn[counterLevel - 1].toUpperCase() ||
                          controllerAnswer.text.trim().toLowerCase() ==
                          wordEn[counterLevel - 1].toLowerCase()
                      ) {
                        print("Tebrikler doğru bildiniz!");

                        print('counterLevel');
                        print(counterLevel);
                        print('wordEn.length');
                        print(wordEn.length);
                        print(wordEn[counterLevel]);
                        Fluttertoast.showToast(
                          msg: "Tebrikler doğru bildiniz!",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color.fromARGB(255, 173, 255, 177),
                          textColor: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18.0,
                        );
                      }



                      else {
                        print("Maalesef yanlış bildiniz!");
                        print('counterLevel');
                        print(counterLevel);
                        print('wordEn.length');
                        print(wordEn.length);
                        print(wordEn[counterLevel]);
                        Fluttertoast.showToast(
                          msg:
                              "Maalesef yanlış bildiniz! Doğru cevap '${wordEn[counterLevel - 1]}' olacaktı.",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color.fromARGB(255, 173, 255, 177),
                          textColor: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18.0,
                        );
                      }

                        }


                        if (counterLevel+1 <= wordEn.length){

                          getWords();
                          controllerAnswer.clear();
                        }
                        else
                        {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  EtkinlikSonu(widget.categoryisim)),
                          );
                        }
                      });


/*
                      if (counterLevel != wordEn.length) {
                        getWords();
                        controllerAnswer.clear();
                        print(counterLevel);
                        print(wordEn.length)
                        ;
                      }

 */

                      /*
                      if (counterLevel == wordEn.length){
                        //EtkinlikSonu2(widget.categoryisim);
                        //print('etkinliksonu sayfasına geçildi');
                        Navigator.pushNamed(context, '/');
                        /*
                        AlertDialog alert = AlertDialog(
                          title: Text("My title"),
                          content: Text("This is my message."),
                          actions: [
                            Icon( Icons.close),
                          ],
                        );

                         */
                      }

                      /*
                      if (counterLevel == wordEn.length){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => EtkinlikSonu(widget.categoryisim),
                          ),
                        );
                    }

                       */

                       */
                    }


                      )
              ],
            ),
          ),
        ));
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    required this.child,
  }) : super();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
