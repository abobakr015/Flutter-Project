// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pronew/auths/createaccount.dart';
import 'package:pronew/auths/emails.dart';
import 'package:pronew/screens/page_started.dart';
import 'package:pronew/screens/pagesapp/maintoo.dart';

// ignore: camel_case_types
class pagelogin extends StatefulWidget {
  const pagelogin({super.key});

  @override
  State<pagelogin> createState() => _pageloginState();
}

// ignore: camel_case_types
class _pageloginState extends State<pagelogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var visibilty = const Icon(Icons.visibility);
  // ignore: non_constant_identifier_names
  var visibility_off = const Icon(Icons.visibility_off);
  // ignore: non_constant_identifier_names
  var stata_icon = const Icon(Icons.visibility);
  bool pris = true;
  EmailPasswordStore checkemail = new EmailPasswordStore();
  // Future login() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim());
  // }
  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showSnackbargreen(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // void _validateInputs(BuildContext context) {
  //   final email = _emailController.text;
  //   final password = _passwordController.text;

  //   if (email.isEmpty || !email.contains('@')) {
  //     _showSnackbar(context, 'Invalid email address');
  //   } else if (password.isEmpty || password.length < 6) {
  //     _showSnackbar(context, 'Password must be at least 6 characters');
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 820,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/backgrong.jpg"),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100, right: 5, left: 5),
                  child: Text(
                    "Let's go \n Traveling arround the world.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
//email text fild
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            hintText: "email",
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
//password text fild
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: pris,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            hintText: "password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  if (pris == true) {
                                    setState(() {
                                      stata_icon = visibility_off;
                                      pris = false;
                                    });
                                  } else if (pris == false) {
                                    setState(() {
                                      stata_icon = visibilty;
                                      pris = true;
                                    });
                                  }
                                },
                                icon: stata_icon),
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1))),
                      ),
                    ),
//forget passsword
                    Container(
                      margin: const EdgeInsets.only(bottom: 15, right: 30),
                      alignment: Alignment.topRight,
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
//text button login
                    GestureDetector(
                      onTap: () {
                        // _validateInputs(context);
                        // login();
                        //مؤقت
                        if (_emailController.text.isEmpty ||
                            !_emailController.text.contains('@')) {
                          _showSnackbar(context, 'Invalid email address');
                        } else if (_passwordController.text.isEmpty ||
                            _passwordController.text.length < 6) {
                          _showSnackbar(context,
                              'Password must be at least 6 characters');
                        } else if (checkemail.checkEmailPassword(
                                _emailController.text.toString().trim(),
                                _passwordController.text.toString().trim()) ==
                            true) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return const homepages();
                          }));
                          _showSnackbargreen(context, 'Login Successful');
                        } else {
                          _showSnackbar(context, 'Invaled Email Or Password');
                          // print(checkemail.checkEmailPassword(
                          //         _emailController.text.toString(),
                          //         _passwordController.text.toString()) ==
                          //     true);
                          // SnackBar(content: )
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (context) {
                          //   return const homepages();
                          // }));
                        }
                        // print(checkemail.checkEmailPassword(
                        //     _emailController.text.toString().trim(),
                        //     _passwordController.text.toString().trim()));
                      },
                      child: Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                                color: Colors.pink[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
//text button login with google
                    Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: GestureDetector(
                            onTap: () {
                              // login With google();
                              //مؤقت
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const pagestarted();
                              }));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Login With Google ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Image(
                                  image: AssetImage("images/googleimage.jpg"),
                                  width: 25,
                                ),
                              ],
                            )),
                      ),
                    ),

                    Container(
                      width: 300,
                      height: 50,
                      margin: const EdgeInsets.only(top: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: const Text(
                              "Don't have an account?  ",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              //go to create account page
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const createaccount();
                              }));
                            },
                            child: const Text(
                              "Create Account ",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
