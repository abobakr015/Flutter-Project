import 'package:flutter/material.dart';
import 'package:pronew/animation/classImasges.dart';
import 'package:pronew/screens/page_started.dart';
import 'package:pronew/screens/pagesapp/CartPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<Image>(
          create: (context) => Strimdata().streamImage(),
          initialData: const Image(
            image: AssetImage('images/1.jpg'),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: pagestarted(),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
