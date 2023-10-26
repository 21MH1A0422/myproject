import 'package:flutter/material.dart';
import 'package:myproject/page6.dart';
class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  List<Widget>li = <Widget>[settings(), location(), menu(), profile()];
  int Index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: li[Index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Index,
        onTap: (idx) {
          setState(() {
            Index = idx;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        items: const[
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "settings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined), label: "location"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "menu"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "profile")
        ],
      ),
      // SingleChildScrollView(scrollDirection: Axis.vertical,
      //   child: Column(
      //     children: [
      //       Container(
      //         child: Stack(children: [
      //           Image(image: NetworkImage("https://cdn.pixabay.com/photo/2023/08/11/06/12/boy-8182923_640.jpg")),
      //           Padding(
      //             padding: const EdgeInsets.only(top: 100),
      //             child: Center(
      //               child: Container(height: 1000,width: 390,
      //                 child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      //                   child: Column(children: [
      //                     Padding(
      //                       padding: const EdgeInsets.only(top: 30),
      //                       child: Container(height: 200,width: 370,
      //                         child: Card(color: Colors.green,
      //                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      //                         ),
      //                       ),
      //                     )
      //
      //                   ],), ),
      //               ),
      //             ),
      //           )
      //         ],),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            child: Stack(children: [
              Image(image: NetworkImage("https://cdn.pixabay.com/photo/2023/08/11/06/12/boy-8182923_640.jpg")),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Container(height: 1000,width: 390,
                    child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(height: 200,width: 370,
                            child: Card(color: Colors.green,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                        ),
                        Row(children: [
                          Container(height: 100,width: 100,
                            child: Card(color: Colors.green,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),),Container(width: 14,),
                          Container(height: 100,width: 100,
                            child: Card(color: Colors.green,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),),Container(width: 14,),
                          Container(height: 100,width: 100,
                            child: Card(color: Colors.green,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),),
                        ],),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SixthPage()));
                        }, child: Text("NEXT"))
                      ],), ),
                  ),
                ),
              )
            ],),
          ),
        ],
      ),
    ),);
  }
}
class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

      ],),
    );
  }
}
class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

      ],),
    );
  }
}
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

      ],),
    );
  }
}




