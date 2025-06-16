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
  Future<void> fetchData() async {
    final res = await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // end

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('API in Flutter'),),
      ),);
  }
}
// https://reqres.in/api/users?page=1