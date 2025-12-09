import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

List<String> types = [
  "News",
  "Health",
  "Cooking",
  "Entertainment",
  "Sport",
  "Football",
  "Tech",
  "Flutter",
  "Ai",
  "Trending",
  "Fashion & Dressing",
  "LifeStyle",
];

Set<String> selectedTypes = {};

class _MultiSelectionState extends State<MultiSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
        child: Column(
          children: [
            Text(
              'What do you like?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 15,
              children: List.generate(types.length, (index) {
                final type = types[index];
                final isSelected = selectedTypes.contains(
                  type,
                ); // You can manage selection state as needed
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedTypes.remove(type);
                      } else {
                        selectedTypes.add(type);
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              }),
            ),

            Column(
              children: [
                SizedBox(height: 40),
                Text(
                  'Selected Types:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  selectedTypes.join(', '),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
