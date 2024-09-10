import 'package:flutter/material.dart';
import 'package:pronew/auths/page_login.dart';
import 'package:provider/provider.dart';
import 'CartPage.dart';
import 'ItemListPage.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final List<String> categories = [
    'العصائر',
    'الفروج',
    "صندويش",
    "سمك",
    "بيتزا",
    "مشروبات غازية",
    "فطائر",
    "حلويات",
    "مناسف",
    "غربي",
  ];
  final Map<String, List<Product>> items = {
    'مناسف': [
      Product(name: 'كبسة', price: 10.0, imageUrl: 'images/كبسة.jpg'),
      Product(
          name: 'منسف اردني', price: 14.0, imageUrl: 'images/منسف اردني.jpg'),
      Product(
          name: 'خاروف مكتف', price: 40.0, imageUrl: 'images/خاروف مكتف.jpg'),
    ],
    'غربي': [
      Product(
          name: 'شاورما إيطالي', price: 5.0, imageUrl: 'images/شاورما دبل.jpg'),
      Product(name: 'سوشي', price: 9.0, imageUrl: 'images/سوشي.jpg'),
      Product(name: 'موزاريلا', price: 6.0, imageUrl: 'images/موزاريلا.jpg')
    ],
    'حلويات': [
      Product(name: 'شعيبيات', price: 5.0, imageUrl: 'images/حلويات.jpg'),
      Product(name: 'نابلسية', price: 5.0, imageUrl: 'images/نابلسية.jpg'),
      Product(name: 'كنافة', price: 9.0, imageUrl: 'images/كنافة.jpg'),
      Product(name: 'كيك', price: 6.0, imageUrl: 'images/كيك.jpg'),
      Product(name: 'عوامة', price: 8.0, imageUrl: 'images/عوامة.jpg'),
      Product(
          name: 'خلاوة الجبن', price: 8.0, imageUrl: 'images/حلاوة بجبن.jpg'),
    ],
    'فطائر': [
      Product(name: 'زعتر ', price: 5.0, imageUrl: 'images/زعتر.jpg'),
      Product(name: 'جبنة', price: 9.0, imageUrl: 'images/جبنة.jpg'),
      Product(name: 'محمرة', price: 6.0, imageUrl: 'images/محمرة.jpg'),
      Product(name: 'لحم بعجين', price: 8.0, imageUrl: 'images/لحم بعجين.jpg'),
    ],
    'مشروبات غازية': [
      Product(name: 'سفنتي ', price: 5.0, imageUrl: 'images/سفنتي.jpg'),
      Product(name: 'كراش ', price: 9.0, imageUrl: 'images/كراش.jpg'),
      Product(
          name: 'مشروب طاقة', price: 6.0, imageUrl: 'images/مشروب طاقة.jpg'),
    ],
    'بيتزا': [
      Product(
          name: 'الفصول الاربعة',
          price: 5.0,
          imageUrl: 'images/بيتزا الفصول الربعة.jpg'),
      Product(
          name: 'بيتزا جبنة', price: 9.0, imageUrl: 'images/بيتزا جبنة.jpg'),
      Product(name: 'بيتزا لحم', price: 6.0, imageUrl: 'images/بيتزا لحمة.jpg'),
      Product(
          name: 'بيتزا يويو', price: 8.0, imageUrl: 'images/بيتزا يويو.jpg'),
    ],
    'سمك': [
      Product(name: 'سمك مشوي', price: 5.0, imageUrl: 'images/مشوي.jpg'),
      Product(name: 'سمك سلور', price: 9.0, imageUrl: 'images/سمك.jpg'),
      Product(name: 'سمك مقلي', price: 6.0, imageUrl: 'images/مقلي.jpg'),
      Product(name: 'سمك مدخن', price: 8.0, imageUrl: 'images/مدخن.jpg'),
      Product(name: 'سمك على الفحم', price: 7.0, imageUrl: 'images/عالفحم.jpg')
    ],
    'العصائر': [
      Product(
          name: 'عصير برتقال', price: 5.0, imageUrl: 'images/عصير برتقال.jpg'),
      Product(name: 'عصير تفاح', price: 6.0, imageUrl: 'images/عصير تفاح.jpg'),
      Product(name: 'عصير مانجو', price: 7.0, imageUrl: 'images/مانجو.jpg')
    ],
    'صندويش': [
      Product(name: 'شاورما ', price: 5.0, imageUrl: 'images/شاورما.jpg'),
      Product(
          name: 'شاورما دبل', price: 6.0, imageUrl: 'images/شاورما دبل.jpg'),
      Product(name: 'برجر ', price: 7.0, imageUrl: 'images/برجر.jpg'),
      Product(name: 'برجر دبل', price: 5.0, imageUrl: 'images/برجر دبل.jpg'),
      Product(name: 'برجر جبنة', price: 8.0, imageUrl: 'images/برجر جبنة.jpg'),
      Product(name: 'فلافل ', price: 3.0, imageUrl: 'images/فلافل.jpg'),
    ],
    'الفروج': [
      Product(name: 'فروج مشوي', price: 20.0, imageUrl: 'images/فروج مشوي.jpg'),
      Product(name: 'فروج مقلي', price: 15.0, imageUrl: 'images/فروج مقلي.jpg'),
    ],
  };

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return const pagelogin();
            }));
          },
          icon: const Icon(Icons.output),
        ),
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
            padding: const EdgeInsets.only(
                top: 195, left: 10, right: 10, bottom: 10),
            itemCount: categories.length,
            itemBuilder: (ctx, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ItemListPage(
                    category: categories[index],
                    items: items[categories[index]] ?? [],
                  ),
                ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.white60,
                    title: Center(
                      child: Text(
                        categories[index],
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Image(
                        image: AssetImage('images/${categories[index]}.jpg'),
                        fit: BoxFit.cover),
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

          Container(
            padding: const EdgeInsets.only(top: 65),
            height: 175,
            decoration: BoxDecoration(
              color: Colors.amber[100],
            ),
          ),

//مكان عرض الصور
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              height: 175,
              decoration: const BoxDecoration(
                color: Colors.black45,
                // border: Border.all(color: Colors.black)
              ),
              alignment: Alignment.topCenter,
              child: Consumer<Image>(
                builder: (context, value, child) {
                  return value;
                },
              ),
            ),
          ),
//التنقل لليمين بين الصور
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(top: 65),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 50,
                color: Colors.black,
              ),
            ),
          ),

//التنقل لليسار بين الصور
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 65),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_left_outlined,
                size: 50,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
