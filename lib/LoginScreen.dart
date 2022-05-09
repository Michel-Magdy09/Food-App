import 'package:flutter/material.dart';
import 'package:food_app/UsersDatabase.dart';
import 'HomeScreen.dart';
import 'RegisterScreen.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool passwordVisible = true;
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          key: _globalKey,
          child:  SingleChildScrollView(
            child: Container(
              height: 870,
              width: 600,
              //image
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/564x/2d/53/d9/2d53d984dd646611cfc7a08cf5948544.jpg"
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  //title
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 130, 220, 165),
                    alignment: Alignment.center,
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 35,
                        color: Color(0xff001B26),
                      ),
                    ),
                  ),
                  //user name
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 100, 20, 2),
                    child: TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                        fillColor: const Color(0xff29446B),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2,color: Color(0xff4ecf00)),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: 'Enter User Name',
                        hintStyle: const TextStyle(fontSize: 20),
                        prefixIcon: const Icon(Icons.account_box, color: Color(0xff001B26)),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  //password
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 15, 20, 35),
                    child: TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                          fillColor: const Color(0xff29446B),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2,color: Color(0xff4ecf00)),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(fontSize: 20),
                          suffixIcon: IconButton(
                            icon: Icon(
                                passwordVisible? Icons.visibility:
                                Icons.visibility_off ),
                            onPressed: (){
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          )
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: passwordVisible,
                    ),
                  ),
                  //login button
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: (){
                        if(_globalKey.currentState!.validate())
                        {
                          setState(() {});
                          if(UsersDatabase.validData(name: _name.text, password: _password.text))
                          {
                            print('YESSs');
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const Home()));
                          }
                        }
                        _globalKey.currentState!.save();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff29446B),
                      ),
                      child: (
                          const Text(
                            'Login',
                            style:
                            TextStyle(
                              fontSize: 15,
                              color: Color(0xff001B26),
                            ),
                          )
                      ),
                    ),
                  ),
                  //return to register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Do not have an account?',
                        style: TextStyle(
                            color: Color(0xff29446B),
                            fontSize: 17
                        ),
                      ),
                      TextButton(onPressed: (){

                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const Register()));

                      },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Color(0xff29446B),
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
