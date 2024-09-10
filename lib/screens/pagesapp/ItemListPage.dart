import 'package:flutter/material.dart';
import 'CartPage.dart';
import 'ItemDetailPage.dart';

class ItemListPage extends StatelessWidget {
  final String category;
  final List<Product> items;

  const ItemListPage({super.key, required this.category, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.amber[100]),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            padding: const EdgeInsets.all(10),
            itemCount: items.length,
            itemBuilder: (ctx, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ItemDetailPage(item: items[index]),
                ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.white60,
                    title: Center(
                      child: Text(
                        items[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Image(
                      image: AssetImage(items[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
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
                    color: Colors.white,
                  ),
                  width: 80,
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Color.fromARGB(255, 255, 7, 255),
                  ),
                ),
              )),
        ],
      ),

//       ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (ctx, index) => ListTile(
      // leading: const Image(
      //   image: AssetImage("images/download.jpg"),
      //   width: 50,
      //   height: 50,
      // ),
// //مؤقت
//           //Image.network(items[index].imageUrl, width: 50, height: 50),
//           title: Text(items[index].name),
//           onTap: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => ItemDetailPage(item: items[index]),
//             ));
//           },
//         ),
//       ),
    );
  }
}
