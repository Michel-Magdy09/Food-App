import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AboutUs.dart';
import 'CartScreen.dart';
import 'HomeScreen.dart';


class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color:  Colors.grey[700],
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 50.0),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
                size: 32,
              ),
              title: const Text("Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              hoverColor: Colors.white30,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () {
                const Home();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 30,
              ),
              title: const Text("The Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              hoverColor: Colors.white30,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const Cart()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(
                Icons.info_rounded,
                color: Colors.white,
                size: 30,
              ),
              title: const Text("About Us",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              hoverColor: Colors.white30,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const Aboutus(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20.0),
              child: const Divider(
                color: Colors.black,
                height: 5.0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 30,
              ),
              title: const Text("Log Out",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              hoverColor: Colors.white30,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () {
                const Home();
              },
            )
          ],
        ),
      ),
    );
  }
}
