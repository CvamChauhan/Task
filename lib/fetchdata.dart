import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  _FetchDataState createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  List items = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/pincode_master.json');
    final data = await json.decode(response);
    // print(response);
    setState(() {
      items = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'DATABASE',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Load Data'),
              onPressed: readJson,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(items[index]["pincode"].toString()),
                          Text(items[index]["state_code"]),
                          Text(items[index]["city"]),
                          Text(items[index]["state"]),
                          Text(items[index]["route"]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
