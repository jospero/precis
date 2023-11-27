import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/resources.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  int id = 0;
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'favouriteScreen');
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'homePage');
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        leadingWidth: 40,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: SizedBox(
            height: 45,
            width: 350,
            child: TextFormField(
              onTap: () {
                setState(() {
                  isOn = true;
                });
              },
              showCursor: isOn,
              decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.all(10),
                fillColor: (Get.isDarkMode)
                    ? Colors.grey.shade700
                    : Colors.grey.shade200,
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.grey),
                hintText: 'Recherche',
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide:
                      const BorderSide(width: 0, color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide:
                      const BorderSide(width: 0, color: Colors.transparent),
                ),
              ),
            ),
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor:
            (Get.isDarkMode) ? Colors.grey.shade800 : Colors.white12,
        elevation: 0,
        bottomOpacity: 0.0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: 'category',
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: viewCategory
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(
                                  (id == viewCategory.indexOf(e)) ? 6 : 0),
                              backgroundColor: MaterialStateProperty.all(
                                (id == viewCategory.indexOf(e))
                                    ? Colors.red
                                    : (Get.isDarkMode)
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade200,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                id = viewCategory.indexOf(e);
                                isOn = false;
                              });
                            },
                            child: Padding(
                              padding:
                                  EdgeInsets.all((e['id'] == 1) ? 7 : 13.0),
                              child: Row(
                                children: [
                                  Text(
                                    e['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: (id == viewCategory.indexOf(e))
                                          ? Colors.white
                                          : (Get.isDarkMode)
                                              ? Colors.white
                                              : Colors.grey.shade700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: (id == 0)
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                      itemCount: AllProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 5 / 9,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              crossAxisCount: 2),
                      itemBuilder: (context, i) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed('DetailPage',
                                      arguments: AllProducts[i]);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (Get.isDarkMode)
                                        ? Colors.grey.shade800
                                        : Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: (Get.isDarkMode)
                                            ? Colors.grey.shade900
                                            : Colors.grey.shade200,
                                        offset: const Offset(1, 2),
                                        blurRadius: 20,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(
                                      40,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 150,
                                        width: 200,
                                        child: Hero(
                                          tag: AllProducts[i].name,
                                          child: Image.asset(
                                            AllProducts[i].image,
                                            semanticLabel: AllProducts[i].name,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        AllProducts[i].name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w800,
                                          color: (Get.isDarkMode)
                                              ? Colors.white
                                              : Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                bottom: 5,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.download)),
                                    IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.book_online))
                                  ],
                                )),
                          ],
                        );
                      },
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () {
                      setState(() {
                        AllProducts;
                      });
                      return Future.delayed(const Duration(seconds: 1));
                    },
                    child: ListView.builder(
                        itemCount: AllProducts.length,
                        padding: const EdgeInsets.all(20),
                        itemBuilder: (context, i) {
                          return (AllProducts[i].id == id)
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        'DetailPage',
                                        arguments: AllProducts[i]);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: (Get.isDarkMode)
                                                ? Colors.grey.shade900
                                                : Colors.grey.shade200,
                                            offset: const Offset(1, 2),
                                            blurRadius: 8)
                                      ],
                                      borderRadius: BorderRadius.circular(30),
                                      color: (Get.isDarkMode)
                                          ? Colors.grey.shade800
                                          : Colors.white,
                                    ),
                                    height: 120,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: ListTile(
                                      leading: Transform.scale(
                                          scale: 1.6,
                                          child: Hero(
                                              tag: AllProducts[i].name,
                                              child: Image.asset(
                                                  AllProducts[i].image))),
                                      isThreeLine: true,
                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 8.0),
                                        child: Text(
                                          AllProducts[i].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0,
                                                        horizontal: 10),
                                                child: Text(
                                                  AllProducts[i].category,
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: 2,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              ElevatedButton(
                                                autofocus: false,
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                    Colors.red.shade500,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed('DetailPage',
                                                          arguments:
                                                              AllProducts[i]);
                                                },
                                                child: const Text(
                                                  'Order Now',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text('⭐️ 5.4'),
                                              Text('⏰ 5-10 min'),
                                              SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox();
                        }),
                  ),
          )
        ],
      ),
    );
  }
}
