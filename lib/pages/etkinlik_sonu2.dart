import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EtkinlikSonu2 extends StatefulWidget {
  final String categoryisim;
  EtkinlikSonu2(this.categoryisim);

  @override
  State<EtkinlikSonu2> createState() => _EtkinlikSonu2State();
}

class _EtkinlikSonu2State extends State<EtkinlikSonu2> {
  @override
  void initState() {
    super.initState();
    getWords();
  }


  Future<void> getWords() async {
    wordEn = [];
    wordTr = [];
    final CollectionReference myCollection =
        FirebaseFirestore.instance.collection('kelimelerx');
    QuerySnapshot querySnapshot = await myCollection
        .where("category", isEqualTo: widget.categoryisim)
        .get();
    for (var doc in querySnapshot.docs) {
      setState(() {
        wordEn.add(doc.get("en"));
        wordTr.add(doc.get("tr"));
      });
    }
  }

  List<String> wordEn = [];
  List<String> wordTr = [];




  @override
  Widget build(BuildContext context) {
    return
      //wordEn.isEmpty?Container():
    //wordTr.isEmpty?Container():
      Scaffold(
      appBar: (AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.red,
            ),
            onPressed: () {
              //Navigator.pop(context, true);
              Navigator.pushNamed(context, '/');
            },
          )
        ],
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                'Tebrikler! Tüm bu kelimeleri öğrendin.',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: wordEn.length,
                      itemBuilder: (context, index) {
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(10),
                              color: Color(0xff80AA51),
                              width: 150,
                              child: Container(
                                child: Text(wordEn[index]),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(10),
                              color: Color(0xff80AA51),
                              width: 150,
                              child: Container(
                                child: Text(wordTr[index]),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
