// store list in sharedpref without duplicate element

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefList extends StatefulWidget {
  const SharedPrefList({super.key});

  @override
  State<SharedPrefList> createState() => _SharedPrefListState();
}

class _SharedPrefListState extends State<SharedPrefList> {
  TextEditingController controller = TextEditingController();
  List<String> list = [];

  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    initPref();
  }

  Future<void> initPref() async {
    prefs = await SharedPreferences.getInstance();
    showList();
  }

  Future<void> addList() async {
    String newItem = controller.text.trim();
  
  if (newItem.isNotEmpty && !list.contains(newItem)) {
    setState(() {
      list.add(newItem);
      controller.clear();
      prefs.setStringList('items', list);
    });
  }else{
    controller.clear();
  }
  }

  Future<void> showList() async {
    setState(() {
      list = prefs.getStringList('items') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    print('list = ${list}');
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  fillColor: Colors.amber,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            ElevatedButton(
                onPressed: () async {
                  await addList();
                },
                child: Text("add")),
            ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.red,
                  title: Text(list[index]),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
