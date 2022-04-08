// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sqlite_from_growing_developer/database_helper.dart';

// ignore: camel_case_types
class myHomePage extends StatefulWidget {
  const myHomePage({Key? key}) : super(key: key);

  @override
  _myHomePageState createState() => _myHomePageState();
}

// ignore: camel_case_types
class _myHomePageState extends State<myHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SQLite practice"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () async {
                int i = await DatabaseHelper.instance.insert({
                  DatabaseHelper.columnName: "sahir jaman",
                });

                print("u inserted value at $i column");
              },
              child: const Text(
                "Insert",
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () async {
                List<Map<String, dynamic>> qureryAll =
                    await DatabaseHelper.instance.queryAll();
                print(qureryAll);
              },
              child: const Text("query"),
              color: Colors.green,
            ),
            FlatButton(
              onPressed: () async{
                int updateId = await DatabaseHelper.instance.update({
                  DatabaseHelper.columnId : 2,
                  DatabaseHelper.columnName: 'Sky yo',
                });
                print(updateId);
              },
              child: const Text("update"),
              color: Colors.pink,
            ),
            FlatButton(
              onPressed: () async{
                int rowsEffected = await DatabaseHelper.instance.delete(1);
                print(rowsEffected);
              },
              child: const Text("delete"),
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

