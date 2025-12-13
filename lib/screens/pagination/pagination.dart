import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  List<int> items = [];
  final ScrollController scrollController = ScrollController();
  int currentPage = 1;
  bool isLoading = false;
  final limit = 20;
  final maxPages = 3;

  Future<void> _fetchItems(int page) async {
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 1));
    final start = (page - 1) * limit;
    final newItems = List.generate(limit, (index) => start + index);
    setState(() {
      items.addAll(newItems);
      setState(() => isLoading = false);
    });
  }

  @override
  void initState() {
    _fetchItems(currentPage);

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !isLoading &&
          currentPage < maxPages) {
        _fetchItems(currentPage++);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text('Item $index'));
              },
            ),
          ),

          if (isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoActivityIndicator(color: Colors.red, radius: 15),
            ),

          if (!isLoading && currentPage == maxPages)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("No More Data"),
            ),
        ],
      ),
    );
  }
}
