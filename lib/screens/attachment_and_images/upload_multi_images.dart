import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImages extends StatefulWidget {
  const UploadMultiImages({super.key});

  @override
  State<UploadMultiImages> createState() => _UploadMultiImagesState();
}

class _UploadMultiImagesState extends State<UploadMultiImages> {
  List<XFile?> selectedImages = [null, null, null];

  Future<void> _pickImages() async {
    final List<XFile> pickedImages = await ImagePicker().pickMultiImage(
      limit: 3,
    );

    for (int i = 0; i < 3; i++) {
      selectedImages[i] = i < pickedImages.length ? pickedImages[i] : null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            // image container
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(selectedImages.length, (index) {
                  final image = selectedImages[index];
                  return Container(
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: image == null ? null : Image.file(File(image.path)),
                  );
                }),
              ),
            ),

            SizedBox(height: 40),
            // upload button
            GestureDetector(
              onTap: _pickImages,
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Upload Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
