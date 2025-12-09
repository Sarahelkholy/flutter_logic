import 'package:flutter/material.dart';
import 'package:flutter_logic/screens/attachment%20and%20images/upload_image.dart';
import 'package:flutter_logic/screens/attachment%20and%20images/upload_multi_images.dart';
import 'package:flutter_logic/screens/selection/image_selection.dart';
import 'package:flutter_logic/screens/selection/multi_selection.dart';
import 'package:flutter_logic/screens/selection/single_selection.dart';
import 'package:flutter_logic/screens/selection/toggle_selection.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  List<Widget> pages = [
    /// selection
    SingleSelection(),
    ImageSelection(),
    ToggleSelection(),
    MultiSelection(),

    /// attachments and images
    UploadImage(),
    UploadMultiImages(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  controller.jumpToPage(selectedIndex - 1);
                });
              },
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  controller.jumpToPage(selectedIndex + 1);
                });
              },
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: Colors.black),
                child: Row(
                  children: [
                    Text(
                      'Next Page',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
