import 'package:flutter/material.dart';

class SixthPage extends StatefulWidget {
  const SixthPage({super.key});

  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  //final massage= SnackBar(content: Text("hello there I'm SAIKIRAN "),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Builder(builder: (context)=>ElevatedButton(onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("HEllo there"),duration: Duration(seconds: 10),));
      },
          child: Text("Click Here")),),
    ),);
  }
}
