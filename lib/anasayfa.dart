import 'package:flutter/material.dart';
import 'pages/addWords.dart';
import 'pages/b1b2_page.dart';
import 'widgets/denemeex.dart';
import 'pages/a1a2_page.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

int _selectedIndex= 0;

void _navigateBottomBar(int index){
  setState(() {
    _selectedIndex=index;
  });
}

final List<Widget> _pages =[
  A1A2Page(),
  B1B2Page(),
  addWordsPage(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar
        (
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          
          BottomNavigationBarItem(icon: Text('A1-A2'), activeIcon: Text('A1-A2',style:TextStyle(color: Colors.blue),) ,label: ' '),
          BottomNavigationBarItem(icon: Text("B1-B2"), activeIcon: Text('B1-B2',style:TextStyle(color: Colors.blue),),label:' '
            ),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: '')
        ],
      ),
    );

  }
}

class SubjectBox extends StatelessWidget {
  //const SubjectBox({Key? key}) : super(key: key);
  final Color subjectBoxColor;
  final String boxText;
  final String navigationText;
  final String gorselURL;
  SubjectBox(
      this.subjectBoxColor, this.boxText, this.navigationText, this.gorselURL);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, navigationText);
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 10.0, top: 15.0, left: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              gorselURL,
            ),
            fit: BoxFit.cover,
          ),
          //color: subjectBoxColor,
          //border: Border(
          //bottom: BorderSide(width: 30.0, color: Colors.lightBlue.shade900),
          borderRadius: new BorderRadius.all(
            Radius.circular(20),

            // borderRadius: new BorderRadius.only(
            //   topLeft: const Radius.circular(40.0),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: new BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  boxText,
                  style: TextStyle(fontSize: 20),
                ),
              )),
        ),
      ),
    );
  }
}
