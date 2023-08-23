import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ScoreScen.dart';
import 'ScoreScen2.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? Team1;
  String? Team2 ;
  String? Team3 ;
  String? Team4 ;


  void documentReference() async {
    final Docref= FirebaseFirestore.instance.collection('Football').doc('7Of7JvwWn4aNXHUBMvI6');
    final Docref2= FirebaseFirestore.instance.collection('Football').doc('Wayl5adcgVQpDBd14ict');

    Docref.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      Team1= data['Team1'];
      Team2= data['Team2'];
      setState(() {});

    },

        onError: (e) => print("Error getting document: $e"),
    );


    Docref2.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      Team3= data['Team1'];
      Team4= data['Team2'];
      setState(() {});

    },

      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    documentReference();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: const Text('Live Score'),
          backgroundColor: Colors.red,

      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScoreScen()),
                  );
                },
                child: ListTile(
                  leading: Image.network('https://www.thesportsdb.com/images/media/team/badge/ep080d1597861076.png'),
                  title:  Text("$Team1 vs $Team2",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text("1st T20I"),
                  trailing: const Text("Live",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),



          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScoreScen2()),
                  );
                },
                child: ListTile(
                  leading: Image.network('https://www.thesportsdb.com/images/media/team/badge/4x1akh1597935271.png'),
                  title:  Text("$Team3 vs $Team4",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text("1st T20I"),
                  trailing: const Text("Live",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),



          ),
        ],
      ),
    );
  }
}
