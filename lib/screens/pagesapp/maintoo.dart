import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'CartPage.dart';
import 'homepage.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => Cart(),
//       child: const homepages(),
//     ),
//   );
// }

// ignore: camel_case_types
class homepages extends StatelessWidget {
  const homepages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
