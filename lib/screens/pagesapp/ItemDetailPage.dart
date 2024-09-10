// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartPage.dart';

class ItemDetailPage extends StatefulWidget {
  final Product item;

  const ItemDetailPage({super.key, required this.item});

  @override
  // ignore: library_private_types_in_public_api
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.item.name),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.amber[200]),
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    // Image.network(widget.item.imageUrl),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image(
                        image: AssetImage(widget.item.imageUrl),
                        height: 350,
                      ),
                    ),
                    Text(widget.item.name,
                        style: const TextStyle(fontSize: 24)),
                    Text('السعر: \$${widget.item.price.toStringAsFixed(2)}'),
                    const Text("data"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon:
                                  const Icon(Icons.keyboard_arrow_up_outlined),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.keyboard_arrow_down_sharp),
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                            ),
                          ],
                        ),
                        Text('$quantity', style: const TextStyle(fontSize: 24)),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text("الكمية المطلوبة  "),
                      ],
                    ),
//add to cart  button
                    GestureDetector(
                      onTap: () {
                        for (int i = 0; i < quantity; i++) {
                          Provider.of<Cart>(context, listen: false)
                              .addItem(widget.item);
                        }
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 40.0),
                        alignment: Alignment.centerRight,
                        child: Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: const Icon(
                            Icons.add_shopping_cart_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     for (int i = 0; i < quantity; i++) {
                    //       Provider.of<Cart>(context, listen: false)
                    //           .addItem(widget.item);
                    //     }
                    //     Navigator.of(context).pop();
                    //   },
                    //   child: const Text('إضافة إلى السلة'),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
//carted
            Positioned(
                bottom: -20,
                left: MediaQuery.of(context).size.width / 2 -
                    28, // Center the button
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(75),
                          topRight: Radius.circular(75),
                          bottomLeft: Radius.circular(75),
                          bottomRight: Radius.circular(75)),
                      color: Color.fromARGB(225, 209, 212, 34),
                    ),
                    width: 80,
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Color.fromARGB(255, 255, 7, 255),
                    ),
                  ),
                )
                // FloatingActionButton(
                //   onPressed: () {
                //   Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (context) => CartPage(),
                //     ),
                //   );
                // },
                //   child: const Icon(Icons.shopping_cart),
                // ),
                ),
          ],
        ));
  }
}
