import 'package:flutter/material.dart';
import 'package:food_app/UsersDatabase.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'LoginScreen.dart';
import 'ProviderScreen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String? _name;
  String? _email;
  String? _phone;
  String? _password;
  String? _confirmPassword;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool passwordVisible = true;
  bool passwordVisible2 = true;

  Widget errorMessage() {
    return Consumer<Testcart>(builder: (context, model, child) {
      if (model.validData)
        return Text('');
      else
        return Text(
            'Username Is Already Taken',
          style: TextStyle(
            color: Colors.red,
            fontSize: 15.0,
          ),
        );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          key: _globalKey,
          child: SingleChildScrollView(
            child: Container(
              height: 870,
              width: 600,
              //image
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/564x/2d/53/d9/2d53d984dd646611cfc7a08cf5948544.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  //title
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 130, 230, 165),
                    alignment: Alignment.center,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 35,
                        color: Color(0xff001B26),
                      ),
                    ),
                  ),
                  //username
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: const Color(0xff29446B),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Color(0xff4ecf00)),
                         // borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: 'Enter User Name',
                        hintStyle: const TextStyle(fontSize: 20),
                        prefixIcon: const Icon(Icons.account_box,
                            color: Color(0xff001B26)),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'name is required';
                        }
                      },
                      onSaved: (String? value) {
                        _name = value;
                      },
                    ),
                  ),
                  //email
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: const Color(0xff29446B),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Color(0xff4ecf00)),
                          //borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: 'Enter Your Email',
                        hintStyle: const TextStyle(fontSize: 20),
                        prefixIcon: const Icon(Icons.alternate_email,
                            color: Color(0xff001B26)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)) {
                          return 'email is invalid';
                        } else if (value.isEmpty) {
                          return 'email is required';
                        }
                      },
                      onSaved: (String? value) {
                        _email = value;
                      },
                    ),
                  ),
                  //phone
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: const Color(0xff29446B),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Color(0xff4ecf00)),
                          //borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: 'Enter Your Phone Number',
                        hintStyle: const TextStyle(fontSize: 20),
                        prefixIcon:
                        const Icon(Icons.phone, color: Color(0xff001B26)),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (String? value) {
                        if (value!.length < 11) {
                          return 'The number you entered is incorrect';
                        } else if (value.isEmpty) {
                          return 'phone number is required';
                        }
                        //ignore: unrelated_type_equality_checks;
                        else if (value[0] != '0' || value[1] != '1') {
                          return 'The number must start 01';
                        }
                      },
                      onSaved: (String? value) {
                        _phone = value;
                      },
                    ),
                  ),
                  //password
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: const Color(0xff29446B),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Color(0xff4ecf00)),
                            //borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(fontSize: 20),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          )),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: passwordVisible,
                      validator: (String? value) {
                        if (value!.length < 6) {
                          return 'The password you entered is too short';
                        } else if (value.isEmpty) {
                          return 'password number is required';
                        }
                      },
                      onSaved: (String? value) {
                        _password = value;
                      },
                    ),
                  ),
                  //confirm password
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 2, 10, 4),
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: const Color(0xff29446B),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Color(0xff4ecf00)),
                            //borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: 'Enter Password again',
                          hintStyle: const TextStyle(fontSize: 20),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible2
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                passwordVisible2 = !passwordVisible2;
                              });
                            },
                          )),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: passwordVisible2,
                      validator: (String? value) {
                        if (value != _password) {
                          return 'Write the same password';
                        }
                      },
                      onSaved: (String? value) {
                        _confirmPassword = value;
                      },
                    ),
                  ),
                  //Register Button
                  SizedBox(
                    height: 60,
                    child: Consumer<Testcart>(builder: (context, model, child) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_globalKey.currentState!.validate()) {
                            print('hello from form ');
                            String name = _name.toString();
                            String email = _email.toString();
                            String phone = _phone.toString();
                            String password = _password.toString();
                            if (UsersDatabase.isFoundinDatabase(name: name, password: password) == false) {
                              model.changefalse();
                              print(name);
                              print(email);
                              print(phone);
                              print(password);
                              UsersDatabase.insertDatabase(name: name, email: email, password: password, phoneNumber: phone);
                              UsersDatabase.getDate(UsersDatabase.database);
                              setState(() {});
                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const Login()));
                            }
                            else {
                              print("Not valid");
                              model.changefalse();

                            }
                          }

                          _globalKey.currentState!.save();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff29446B),
                        ),
                        child: (const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff001B26),
                          ),
                        )),
                      );
                    }),
                  ),
                  //go to login screen
                  SizedBox(height: 5.0,),
                  Consumer<Testcart>(builder: (context, model, child) {
                    return errorMessage();
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Do You already have an account?',
                        style: TextStyle(color: Color(0xff29446B), fontSize: 17),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const Login()));
                        },
                        child: const Text(
                          'Login',
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
