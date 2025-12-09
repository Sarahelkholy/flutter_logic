import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  XFile? selectedImage;

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      selectedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            // image container
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: selectedImage == null
                  ? null
                  : Image.file(File(selectedImage!.path), fit: BoxFit.contain),
            ),
            SizedBox(height: 40),
            // upload button
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    selectedImage != null ? "Chaneg image" : "Upload Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // delete button
            if (selectedImage != null)
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImage = null;
                  });
                },
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Delet Image",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
