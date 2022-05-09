import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'HomeScreen.dart';


class Aboutus extends StatefulWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text('ABOUT US'),
            ),
            actions:  const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                child: Icon(Icons.info_rounded),
              ),
            ],
            leading: IconButton(icon: const Icon(Icons.arrow_back_outlined), onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const Home(),
              ),
            ),),
            backgroundColor: const Color(0x50f06060),
          ),
          body: Column(
            children: const [

            ],
          )
      ),
    );
  }
}


