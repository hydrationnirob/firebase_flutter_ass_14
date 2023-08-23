import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ScoreScen extends StatefulWidget {
  const ScoreScen({Key? key}) : super(key: key);


  @override
  State<ScoreScen> createState() => _ScoreScenState();
}

class _ScoreScenState extends State<ScoreScen> {

  String? Team1="";
  String? Team2 = "";
  String? Team2Score = "";
  String? Team1Score = "";
  String? Time = "";
  String? TotalTime = "";

  void documentReference() async {
    final Docref= FirebaseFirestore.instance.collection('Football').doc('7Of7JvwWn4aNXHUBMvI6');
    Docref.get().then((DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
         Team1= data['Team1'];
          Team2= data['Team2'];
         Team2Score= data['Team2Score'];
         Team1Score= data['Team1Score'];
         Time= data['RunTime'];
         TotalTime= data['TotalTime'];
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pakistan vs India'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                width: double.infinity,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network('https://www.thesportsdb.com/images/media/team/badge/bnq8fu1639684513.png', width: 50, height: 50),
                     Text(
                      "$Team1 vs $Team2",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.network('https://www.thesportsdb.com/images/media/team/badge/4x1akh1597935271.png', width: 50, height: 50),
                  ],
                ),
              ),
            ),
             Text(
              "$Team1Score - $Team2Score",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
             Text(
              "Time : $Time Min",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
             Text(
              'Total Time : $TotalTime MIn',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
