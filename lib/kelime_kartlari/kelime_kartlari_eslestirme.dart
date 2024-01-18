import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'kelime_bulmaca.dart';

class KelimeKartlari extends StatefulWidget {
  //const KelimeKartlari({Key? key}) : super(key: key);
  final String categoryName;
  KelimeKartlari(this.categoryName);

  @override
  State<KelimeKartlari> createState() => stateKelimeKartlari();
}

class stateKelimeKartlari extends State<KelimeKartlari> {
  //const KelimeKartlari({Key? key}) : super(key: key);

  /*final CollectionReference myCollection =
  FirebaseFirestore.instance.collection('kelimelerx').doc('3tJp5Q0jCQverOirlykD').collection('renkler');*/

  Future<void> getQuestionFirebase() async {
    wordEn = [];
    wordTr = [];
    final CollectionReference myCollection =
        FirebaseFirestore.instance.collection('kelimelerx');
    QuerySnapshot querySnapshot = await myCollection
        .where("category", isEqualTo: widget.categoryName)
        .get();
    for (var doc in querySnapshot.docs) {
      setState(() {
        wordEn.add(doc.get("en"));
        wordTr.add(doc.get("tr"));
      });
    }
  }

  FlutterTts flutterTts = FlutterTts();

  void textToSpeech(String text) async {
    await flutterTts.setLanguage("en-us");
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
    //await flutterTts.setPitch(text);
  }

  List<String> wordEn = []; //Elma,Armut,Muz,Kiraz
  List<String> wordTr = []; //Apple,11,Banana,222

  List<String> pairingWordEn = [];
  List<String> pairingWordTr = [];

  List<Color> colorstr = [
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50
  ];
  List<Color> colorsen = [
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50,
    Colors.green.shade50
  ];

  List<int> indeksNumbers = [];
  List<int> selectionndeksNumbers = [];
  void pairingMethod() {
    setState(() {
      indeksNumbers = List.generate(wordTr.length, (index) => index);
      indeksNumbers..shuffle();

      for (int i = 0; i < wordTr.length; i++) {
        selectionndeksNumbers.add(indeksNumbers[i]);
      }

      for (int i = 0; i < wordTr.length; i++) {
        pairingWordEn.add(wordEn[selectionndeksNumbers[i]]);
      }
      selectionndeksNumbers.shuffle();
      for (int i = 0; i < wordTr.length; i++) {
        pairingWordTr.add(wordTr[selectionndeksNumbers[i]]);
      }
    });
  }

  void resultPairingMethod() {
    if (wordEn[wordTr.indexOf(trSelection)] == enSelection) {
      setState(() {
        colorsen[selectionenNumber] = Colors.grey;
        colorstr[selectiontrNumber] = Colors.grey;
      });
    } else {
      for (int i = 0; i < wordTr.length; i++) {
        setState(() {
          if (colorsen[i] != Colors.grey) {
            colorsen[i] = Colors.green.shade50;
          }
          if (colorstr[i] != Colors.grey) {
            colorstr[i] = Colors.green.shade50;
          }
        });
      }
    }
    setState(() {
      selectionSide = -1;
    });
  }
  //

  String trSelection = "";
  String enSelection = "";
  int selectiontrNumber = -1;
  int selectionenNumber = -1;
  int selectionSide = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuestionFirebase();
    counterLevel = 0;
    visibleButtonPairing = false;
    visiblePageWordCard = true;
    visiblePagePairingCard = false;
    visibleKelimeBul = false;
    visibleButtonPlayWord = false;
    visibleEtkinlikSonu = false;
  }

  int counterLevel = 0;
  bool visibleButtonPairing = false;
  bool visiblePageWordCard = true;
  bool visiblePagePairingCard = false;
  bool visibleKelimeBul = false;
  bool visibleButtonPlayWord = false;
  bool visibleEtkinlikSonu = false;

  @override
  Widget build(BuildContext context) {
    return wordEn.isEmpty
        ? Container()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Visibility(
                    visible: visiblePageWordCard,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        GestureDetector(
                          onTap: () {
                            textToSpeech(wordEn[counterLevel]);
                          },
                          child: Icon(
                            Icons.volume_up_rounded,
                            color: Colors.grey,
                            size: 24.0,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff80AA51),
                          ),
                          height: 300,
                          margin: EdgeInsets.all(40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                wordEn[counterLevel],
                                style: TextStyle(fontSize: 25),
                              ),
                              /*
                        Center(
                          child: ListTile(

                              title:  Text( wordEn[counterLevel], style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
                              trailing:  Icon(Icons.volume_up),
                              onTap: () => textToSpeech(wordEn[counterLevel],)
                          ),
                        ),

                         */

                              SizedBox(height: 50),
                              Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                height: 0.1,
                              ),
                              SizedBox(height: 50),
                              Text(
                                wordTr[counterLevel],
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (counterLevel - 1 != -1) {
                                    counterLevel--;
                                    visibleButtonPairing = false;
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Icon(Icons.arrow_back, size: 50),
                              ),

                              /*Container(
                            color: Colors.grey,
                            height: 90,
                            width: 50,
                            margin: EdgeInsets.all(30),
                            child: Icon(Icons.arrow_circle_left),
                          )
                          */
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (counterLevel + 1 != wordEn.length) {
                                    counterLevel++;
                                    if (counterLevel + 1 == wordEn.length) {
                                      visibleButtonPairing = true;
                                    }
                                  }
                                });
                              },
                              //child:
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Icon(Icons.arrow_forward, size: 50),
                              ),
                              /*  Container(
                              color: Colors.grey,
                              height: 90,
                              width: 50,
                              margin: EdgeInsets.all(30),
                              child: Icon(Icons.arrow_circle_right))
                            */
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Visibility(
                            visible: visibleButtonPairing,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  pairingMethod();
                                  visiblePageWordCard = false;
                                  visiblePagePairingCard = true;
                                });
                              },
                              child: Container(
                                color: Color(0xff80AA51),
                                height: 25,
                                width: 200,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Eşleştirme",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ))
                      ],
                    )),
                Visibility(
                  visible: visiblePagePairingCard,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: 150,
                                  height:
                                      MediaQuery.of(context).size.height - 60,
                                  child: ListView.builder(
                                      itemCount: wordTr.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (colorstr[index] !=
                                                    Colors.grey) {
                                                  setState(() {
                                                    for (int i = 0;
                                                        i < wordTr.length;
                                                        i++) {
                                                      if (colorstr[i] !=
                                                          Colors.grey) {
                                                        colorstr[i] = Colors
                                                            .green.shade50;
                                                      }
                                                    }
                                                    colorstr[index] =
                                                        Colors.amber.shade50;
                                                    trSelection =
                                                        pairingWordTr[index];
                                                    if (selectionSide == -1) {
                                                      selectionSide = 0;
                                                      selectiontrNumber = index;
                                                    }
                                                    if (selectionSide == 1) {
                                                      selectionSide = 0;
                                                      selectiontrNumber = index;
                                                      resultPairingMethod();
                                                    }
                                                  });
                                                }
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    (wordTr.length + 3.5),
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: colorstr[index],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                      textAlign:
                                                          TextAlign.center,
                                                      pairingWordTr[index]),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        );
                                      })),
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                  width: 150,
                                  height:
                                      MediaQuery.of(context).size.height - 60,
                                  child: ListView.builder(
                                      itemCount: wordTr.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (colorsen[index] !=
                                                    Colors.grey) {
                                                  setState(() {
                                                    for (int i = 0;
                                                        i < wordTr.length;
                                                        i++) {
                                                      if (colorsen[i] !=
                                                          Colors.grey) {
                                                        colorsen[i] = Colors
                                                            .green.shade50;
                                                      }
                                                    }
                                                    colorsen[index] =
                                                        Colors.amber.shade50;
                                                    enSelection =
                                                        pairingWordEn[index];
                                                    if (selectionSide == -1) {
                                                      selectionSide = 1;
                                                      selectionenNumber = index;
                                                    }
                                                    if (selectionSide == 0) {
                                                      selectionSide = 1;
                                                      selectionenNumber = index;

                                                      resultPairingMethod();
                                                    }
                                                  });
                                                }
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    (wordTr.length + 3.5),
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: colorsen[index],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      style: TextStyle(
                                                          fontSize: 17),
                                                      textAlign:
                                                          TextAlign.center,
                                                      pairingWordEn[index]),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        );
                                      })),
                            ],
                          ),
                          /*
                    Container(
                      height: 75,
                      width: 300,
                      color: Colors.amber[100],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(trSelection),
                          Text(enSelection),
                        ],
                      ),
                    ),

                     */

                          TextButton(
                            child: Text('Diğer etkinliğe geç'),
                            onPressed: () {
                              setState(() {
                                print('Pressed');
                                visibleKelimeBul = true;
                                visiblePagePairingCard = false;
                              });
                            },
                          ),
                          /*
                    Visibility(
                        visible: visibleButtonPlayWord,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              pairingMethod();
                              visiblePagePairingCard = false;
                              visibleKelimeBul = true;
                            });
                          },
                          child: Container(
                            color: Color(0xff80AA51),
                            height: 10,
                            width: 200,
                            child: Text(
                              textAlign: TextAlign.center,
                              "play word kelime bul",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ))

                     */
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: visibleKelimeBul,
                  child: Center(
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child:
                                  kelimeBulmacaSayfasi(widget.categoryName)))),
                ),
              ],
            ),
          );
  }
}
