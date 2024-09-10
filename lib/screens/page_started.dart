import 'package:flutter/material.dart';
import 'package:pronew/auths/page_login.dart';

// ignore: camel_case_types
class pagestarted extends StatefulWidget {
  const pagestarted({super.key});

  @override
  State<pagestarted> createState() => _Pagestarted();
}

class _Pagestarted extends State<pagestarted> {
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
                  image: AssetImage("images/backgrong.jpg"), fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 200),
                  child: const Text(
                    "Hi , Welcome to \n My App",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 114, 37, 27)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 300),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return const pagelogin();
                      }));
                    },
                    icon: const Icon(
                      Icons.arrow_circle_right,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
