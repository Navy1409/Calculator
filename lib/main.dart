import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("CALCULATOR",style: TextStyle(color: Colors.orangeAccent),),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black
            ),
            child: Column(
              children: [
                Container(),
                Container(),
                Column(
                  children: [
                    Row(),
                    Row(),
                    Row(),
                    Row(),
                    Row(),
                  ],
                ),
              ],
            ),
          ) ,
        ),
      ),),
    );
  }
}
