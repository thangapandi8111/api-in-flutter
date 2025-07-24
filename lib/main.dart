import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // start
  List<dynamic> data = [];

  Future<void> fetchData() async {
    final res = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    print(res.statusCode);
    setState(() {
      data = jsonDecode(res.body)['data'];
    });
  }

  Future<void> addData() async {
    final res = await http.post(
      Uri.parse('https://api.restful-api.dev/objects'),
      headers : {"Content-Type": "application/json"},
        body: jsonEncode({
        "name": "realme",
     
      }),
    );
    print(res.statusCode);
      print(res.body.toString());
  }


  @override
  void initState() {
    super.initState();
    // fetchData();
    addData();
  }

  // end

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('API in Flutter')),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(data[index]['avatar']),
              ),
              title: Text(
                data[index]['first_name'] + ' ' + data[index]['last_name'],
              ),
              subtitle: Text(data[index]['email']),
            );
          },
        ),
      ),
    );
  }
}
// https://reqres.in/api/users?page=1