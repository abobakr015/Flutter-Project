import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final TextEditingController addressController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              printInvoice(context);
            },
            icon: const Icon(Icons.print),
          ),
          const Padding(padding: EdgeInsets.only(right: 20))
        ],
        title: const Text('القائمة'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                  'المبلغ الإجمالي: \$${cart.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text('عدد المنتجات: ${cart.items.length}',
                  style: const TextStyle(fontSize: 20)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(cart.items[index].name),
                  trailing:
                      Text('\$${cart.items[index].price.toStringAsFixed(2)}'),
                ),
              ),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'أدخل عنوانك',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (addressController.text.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('تم الإرسال'),
                          content: const Text('تم إرسال طلبك بنجاح!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                Provider.of<Cart>(context, listen: false)
                                    .clear();
                                Navigator.of(context).pop();
                              },
                              child: const Text('موافق'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('خطأ'),
                          content: const Text('يرجى إدخال العنوان!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: const Text('موافق'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Row(
                    children: [
                      Text(
                        'إرسال ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<Cart>(context, listen: false).clear();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 9, 9)),
                  child: const Row(
                    children: [
                      Text(
                        'حذف  ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.delete_sweep,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void printInvoice(BuildContext context) async {
    final cart = Provider.of<Cart>(context, listen: false);
    final pdf = pw.Document();
    final arabicFont =
        await PdfGoogleFonts.amiriRegular(); // استخدام الخط العربي

    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Padding(
            padding: pw.EdgeInsets.all(32.0),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text(
                    'الفاتورة',
                    style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                        font: arabicFont),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  '  المبلغ الاجمال\$${cart.totalAmount.toStringAsFixed(2)}',
                  style: pw.TextStyle(fontSize: 20, font: arabicFont),
                  textDirection: pw.TextDirection.rtl,
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  'عدد المنتجات ${cart.items.length}',
                  style: pw.TextStyle(fontSize: 20, font: arabicFont),
                  textDirection: pw.TextDirection.rtl,
                ),
                pw.SizedBox(height: 20),
                pw.Divider(),
                pw.SizedBox(height: 20),
                pw.Text(
                  'تفاصيل المنتجات',
                  style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold,
                      font: arabicFont),
                  textDirection: pw.TextDirection.rtl,
                ),
                pw.ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, index) {
                    return pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 4.0),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(cart.items[index].name,
                              style:
                                  pw.TextStyle(fontSize: 16, font: arabicFont),
                              textDirection: pw.TextDirection.rtl),
                          pw.Text(
                              '\$${cart.items[index].price.toStringAsFixed(2)}',
                              style:
                                  pw.TextStyle(fontSize: 16, font: arabicFont)),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}

class Cart with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items => _items;

  double get totalAmount => _items.fold(0.0, (sum, item) => sum + item.price);

  void addItem(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void clear() {
    _items = [];
    notifyListeners();
  }
}

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => Cart(),
//       child: const CartPage(),
//     ),
//   );
// }














// ====================




// // ignore: file_names
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // ignore: unused_import
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);
//     final TextEditingController addressController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           // Icon(Icons.print),
//           IconButton(
//             onPressed: () {
//               const printed().printInvoice();
//             },
//             icon: const Icon(Icons.print),
//           ),
//           const Padding(padding: EdgeInsets.only(right: 20))
//         ],
//         title: const Text('القائمة'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Text(
//                   'المبلغ الإجمالي: \$${cart.totalAmount.toStringAsFixed(2)}',
//                   style: const TextStyle(fontSize: 20)),
//             ),
//             const SizedBox(height: 10),
//             Center(
//               child: Text('عدد المنتجات: ${cart.items.length}',
//                   style: const TextStyle(fontSize: 20)),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: cart.items.length,
//                 itemBuilder: (ctx, index) => ListTile(
//                   title: Text(cart.items[index].name),
//                   trailing:
//                       Text('\$${cart.items[index].price.toStringAsFixed(2)}'),
//                 ),
//               ),
//             ),
//             TextField(
//               controller: addressController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'أدخل عنوانك',
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     if (addressController.text.isNotEmpty) {
//                       showDialog(
//                         context: context,
//                         builder: (ctx) => AlertDialog(
//                           title: const Text('تم الإرسال'),
//                           content: const Text('تم إرسال طلبك بنجاح!'),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(ctx).pop();
//                                 Provider.of<Cart>(context, listen: false)
//                                     .clear();
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text('موافق'),
//                             ),
//                           ],
//                         ),
//                       );
//                     } else {
//                       showDialog(
//                         context: context,
//                         builder: (ctx) => AlertDialog(
//                           title: const Text('خطأ'),
//                           content: const Text('يرجى إدخال العنوان!'),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(ctx).pop();
//                               },
//                               child: const Text('موافق'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                   child: const Row(
//                     children: [
//                       Text(
//                         'إرسال ',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       Icon(
//                         Icons.check,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Provider.of<Cart>(context, listen: false).clear();
//                     Navigator.of(context).pop();
//                   },
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 255, 9, 9)),
//                   child: const Row(
//                     children: [
//                       Text(
//                         'حذف  ',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       Icon(
//                         Icons.delete_sweep,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Product {
//   final String name;
//   final double price;
//   final String imageUrl;

//   Product({required this.name, required this.price, required this.imageUrl});
// }

// class Cart with ChangeNotifier {
//   List<Product> _items = [];

//   List<Product> get items => _items;

//   double get totalAmount => _items.fold(0.0, (sum, item) => sum + item.price);

//   void addItem(Product product) {
//     _items.add(product);
//     notifyListeners();
//   }

//   void clear() {
//     _items = [];
//     notifyListeners();
//   }
// }

// // Navigator.of(context).push(
// //                 MaterialPageRoute(
// //                   builder: (context) => CartPage(),

// // void main() {
// //   runApp(MyApp());
// // }

// // ignore: camel_case_types
// class printed extends StatelessWidget {
//   const printed({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('تصدير فاتورة كملف PDF'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               printInvoice(); // استدعاء الدالة المرتبطة بالطباعة
//             },
//             child: Text('تصدير كملف PDF'),
//           ),
//         ),
//       ),
//     );
//   }
//   Future<void> printInvoice() async {
    
//   final pdf = pw.Document();
//   pdf.addPage(
//     pw.Page(
//       build: (context) {
//         return pw.Center(
//           child: pw.Column(
//             children: [
//               pw.Text(
//                 'المبلغ الإجمالي: \$${cart.totalAmount.toStringAsFixed(2)}',
//                 style: const pw.TextStyle(fontSize: 20),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text(
//                 'عدد المنتجات: ${cart.items.length}',
//                 style: const pw.TextStyle(fontSize: 20),
//               ),
//             ],
//           ),
//         );
//       },
//     ),
//   );

//   // استمر في تنفيذ باقي الكود...
// }



// //   Future<void> printInvoice() async {
// //     final pdf = pw.Document();
// //     pdf.addPage(
// //       pw.Page(
// //         build: (context) {
// //           return pw.Center(
// //             child: 
// //             pw.Text("printed"), // يمكنك تعديل هذا النص
// //           );
// //         },
// //       ),
// //     );

// //     await Printing.layoutPdf(
// //       onLayout: (format) async => pdf.save(),
// //     );
// //   }
// }
