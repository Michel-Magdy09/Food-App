import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import 'Drinks.dart';
import 'NavigationDarwerWidget.dart';
import 'Sandwich.dart';
import 'SandwichesDatabase.dart';
import 'drinkDatabase.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    const urlImage =
        'https://i.pinimg.com/564x/49/ef/07/49ef0704f06cc5c91bd8ead3ae9490eb.jpg';
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: NavigationDrawerWidget(),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.grey,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                // Text(
                //   '',
                //   style: TextStyle(
                //       color: Color(0xFF29446B),
                //       fontSize: 45,
                //       fontWeight: FontWeight.w400),
                // )
              ],
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(urlImage), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                buildRoundedCardhome(),
                buildRoundedCardmeal(),
                buildRoundedCarddrink(),
              ],
            ),
          ),

          // bottomNavigationBar: BottomNavigationBar(
          //   type: BottomNavigationBarType.fixed,
          //   items: const [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: 'Home',
          //       backgroundColor: Colors.blue,
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.shopping_cart),
          //       label: 'Cart',
          //       backgroundColor: Colors.blue,
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.info_rounded),
          //       label: 'About us',
          //       backgroundColor: Colors.blue,
          //     ),
          //   ],
          // ),
        ));
  }

  Widget buildRoundedCardhome() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.deepOrange,
        margin: const EdgeInsets.fromLTRB(20, 24, 16, 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
              image: const NetworkImage(
                  'https://i.pinimg.com/564x/c4/35/3b/c4353b59aa54969ad9560a769d7092c7.jpg'),
              height: 180,
              fit: BoxFit.cover,
            ),
            const Text(
              "Home",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 60),
            )
          ],
        ),
      );

  //meal widget
  Widget buildRoundedCardmeal() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.deepOrange,
        shadowColor: Colors.red,
        elevation: 10,
        margin: const EdgeInsets.fromLTRB(50, 40, 50, 10),
        // distance between cards and screen

        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.red],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const Sandwich(),
                  ),
                ),
                // the Meals button *********************************************
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 85, 85, 10),
                      child: Text(
                        "Meals",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 85, 0, 10),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  //Drink widget
  Widget buildRoundedCarddrink() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.deepOrange,
        shadowColor: Colors.red,
        elevation: 10,
        margin: const EdgeInsets.fromLTRB(50, 40, 50, 20),
        // distance between cards and screen

        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.green],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const Drinks(),
                  ),
                ),
                // the condition of drinks button *********************************************
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 85, 85, 10),
                      child: Text(
                        "Drinks",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 85, 0, 10),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
