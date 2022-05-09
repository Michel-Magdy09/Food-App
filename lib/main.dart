import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AdminScreen.dart';
import 'HomeScreen.dart';
import 'Insert_Drink.dart';
import 'Insert_Sandwich.dart';
import 'LoginScreen.dart';
import 'NavigationDarwerWidget.dart';
import 'ProviderScreen.dart';
import 'RegisterScreen.dart';
import 'SandwichesDatabase.dart';
import 'Show_User.dart';
import 'UsersDatabase.dart';
import 'drinkDatabase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SandwichDatabase.creatDatabase();
  DrinkDatabase.creatDatabase();
  UsersDatabase.creatDatabase();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Testcart();
      },
      child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          title: 'food app',
          home: Login(),
      )
    );
  }
}
