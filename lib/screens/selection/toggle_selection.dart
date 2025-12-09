import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSelection extends StatefulWidget {
  const ToggleSelection({super.key});

  @override
  State<ToggleSelection> createState() => _ToggleSelectionState();
}

class _ToggleSelectionState extends State<ToggleSelection> {
  bool isFollowed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/image.png'),
                    radius: 120,
                  ),
                  Positioned(
                    bottom: -20,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFollowed = !isFollowed;
                        });
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                        child: isFollowed
                            ? Icon(
                                CupertinoIcons.check_mark,
                                color: Colors.white,
                              )
                            : Icon(CupertinoIcons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
