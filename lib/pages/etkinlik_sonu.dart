import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EtkinlikSonu extends StatefulWidget {
  final String catname;
  EtkinlikSonu(this.catname);

  @override
  State<EtkinlikSonu> createState() => _EtkinlikSonuState();
}

class _EtkinlikSonuState extends State<EtkinlikSonu> {
  final CollectionReference myCollection =
      FirebaseFirestore.instance.collection('kelimelerx');

  @override
  Widget build(BuildContext context) {
    return
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
                  child: Text(
                'Tebrikler! Tüm bu kelimeleri öğrendin.',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              )),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder(
                  stream: myCollection
                      .where("category", isEqualTo: widget.catname)
                      .snapshots(),
                  builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Veriler yüklenene kadar bir yüklenme gösterebilirsiniz.
                    }

                    if (snapshot.hasError) {
                      return Text('Veriler alınamıyor: ${snapshot.error}');
                    }

                    if (!snapshot.hasData) {
                      return Text('Veri yok');
                    }

                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        final data = document.data() as Map<String, dynamic>;
                        return Row(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              margin: EdgeInsets.all(3),
                              padding: EdgeInsets.all(10),
                              color: Color(0xff80AA51),
                              width: 150,
                              child: Container(
                                child: Text(data["en"]),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(3),
                              padding: EdgeInsets.all(10),
                              color: Color(0xff80AA51),
                              width: 150,
                              child: Container(
                                child: Text(data["tr"]),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        );
                      }).toList(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
