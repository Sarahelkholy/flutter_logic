import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  const SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  List<Map> gifts = [
    {"image": "assets/animals/cow.png", "title": "cow"},
    {"image": "assets/animals/deer.png", "title": "deer"},
    {"image": "assets/animals/giraffe.png", "title": "giraffe"},
    {"image": "assets/animals/lion.png", "title": "lion"},
    {"image": "assets/animals/pingeon.png", "title": "pingeon"},
    {"image": "assets/animals/rat.png", "title": "rat"},
    {"image": "assets/animals/tiger.png", "title": "tiger"},
    {"image": "assets/animals/white-tiger.png", "title": "white tiger"},
  ];

  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.builder(
          itemCount: gifts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: .6,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Stack(
                children: [
                  selectedIndex == index
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,

                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  Column(
                    children: [
                      Image.asset(
                        gifts[index]["image"],
                        height: selectedIndex == index ? 110 : 100,
                        width: 400,
                      ),
                      SizedBox(height: 10),
                      Text(
                        gifts[index]["title"].toString().toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  selectedIndex == index
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
