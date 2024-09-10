import 'package:flutter/material.dart';
import 'package:pronew/auths/emails.dart';
import 'package:pronew/auths/page_login.dart';

// ignore: camel_case_types
class createaccount extends StatefulWidget {
  const createaccount({super.key});

  @override
  State<createaccount> createState() => _createaccountState();
}

// ignore: camel_case_types
class _createaccountState extends State<createaccount> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _username = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  var visibilty = const Icon(Icons.visibility);
  // ignore: non_constant_identifier_names
  var visibility_off = const Icon(Icons.visibility_off);
  // ignore: non_constant_identifier_names
  var stata_icon = const Icon(Icons.visibility);
  // ignore: non_constant_identifier_names
  var stata_icon2 = const Icon(Icons.visibility);
  bool pris = true;
  bool pris2 = true;
  EmailPasswordStore checkemail = EmailPasswordStore();

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
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

  // @override
  // void dispose() {
  //   super.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _username.dispose();
  //   _confirmpasswordController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 750,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/backgrong.jpg"),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 75, right: 5, left: 5),
                  child: Text(
                    "Let's go \n Create a new account .",
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
//username text fild
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: TextFormField(
                        controller: _username,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.perm_identity_rounded),
                            hintText: "Username",
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
                            fillColor: Colors.grey[300],
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
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
//confirm password text fild
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: TextFormField(
                        controller: _confirmpasswordController,
                        obscureText: pris2,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            hintText: "confirm password",
                            fillColor: Colors.grey[300],
                            suffixIcon: IconButton(
                                onPressed: () {
                                  if (pris2 == true) {
                                    setState(() {
                                      stata_icon2 = visibility_off;
                                      pris2 = false;
                                    });
                                  } else if (pris2 == false) {
                                    setState(() {
                                      stata_icon2 = visibilty;
                                      pris2 = true;
                                    });
                                  }
                                },
                                icon: stata_icon2),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                        } else if (_confirmpasswordController.text.isEmpty ||
                            _confirmpasswordController.text !=
                                _passwordController.text) {
                          _showSnackbar(context, 'Confirm The Password!');
                        } else if (_confirmpasswordController.text !=
                            _passwordController.text) {
                          _showSnackbar(context,
                              'The Password Confirmation field must not be left blank! ,\nGuys confirm Password!');
                        } else if (_username.text != _passwordController.text) {
                          _showSnackbar(context, 'Please Enter Your Username!');
                        } else if (checkemail.checkEmailPassword(
                                    _emailController.text.toString().trim(),
                                    _passwordController.text
                                        .toString()
                                        .trim()) ==
                                false &&
                            _passwordController.text ==
                                _confirmpasswordController.text) {
                          checkemail.addEmailPassword(
                              _emailController.text.trim(),
                              _passwordController.text.trim());
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return const pagelogin();
                          }));
                          _showSnackbargreen(
                              context, 'Create Account Successful');
                        } else {
                          _showSnackbar(context, 'Invaled Email Or Password');
                          // print(checkemail.checkEmailPassword(
                          //         _emailController.text.toString(),
                          //         _passwordController.text.toString()) ==
                          //     true);
                        }
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        //text button login
                        child: Center(
                          // onTap: () {
                          //   // login();
                          //   //مؤقت

                          //   Navigator.of(context)
                          //       .push(MaterialPageRoute(builder: (context) {
                          //     return const pagelogin();
                          //   }));
                          // },
                          child: Text(
                            "Create account",
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
                    Container(
                      width: 300,
                      height: 20,
                      margin: const EdgeInsets.only(top: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Do you already have an account?  ",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              //go to create account page
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const pagelogin();
                              }));
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Color.fromARGB(255, 177, 48, 194),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
