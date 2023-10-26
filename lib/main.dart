import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myproject/page1.dart';

import 'page2.dart';
import 'signup page.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: FirstScreen()
    //   StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
    // builder: (context,snapshot){
    //   if (snapshot.hasData){
    //     return SecondScreen();
    //   }
    //   else {
    //     return Signuppage();
    //   }
    // },),
    );
  }
}
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
      child: Column(
        children: [Container(height: 50,),
          Center(
            child: Container(height: 400,width: 358,
              child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Stack(children: [Container(height: 500,width: 400,
                  child: Center(
                    child: ClipRRect(borderRadius: BorderRadius.circular(30),
                      child: Image(fit: BoxFit.cover,
                          image: NetworkImage("https://img.freepik.com/premium-photo/concrete-library-interior_670147-33565.jpg?size=626&ext=jpg")),
                    ),
                  ),
                ),

     Center(child: Container(height: 500,width: 410,child: Padding(
                 padding: const EdgeInsets.only(top: 100,left: 170),
                 child: Text('𝓽𝓱𝓮 𝓹𝓵𝓪𝓬𝓮 𝔀𝓱𝓮𝓻𝓮 𝔂𝓸𝓾 𝓬𝓪𝓷 Find \n𝔂𝓸𝓾𝓻𝓼𝓮𝓵𝓯',style: TextStyle(fontSize: 40,color: Colors.black),),
     ),
     )
     )
                ],),
              ),
            ),
          ),

       Padding(
         padding: const EdgeInsets.only(top: 50),
         child: Container(height: 160,width: 380,
           child: Card(color: Colors.white60,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
             child: Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(height: 65,width: 150,
                   child: Card(color: Colors.blueGrey,
                     shadowColor: Colors.black,elevation: 40,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                   child: Center(child: TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));},
                     child: Text("Login",style: TextStyle(fontSize: 35,color: Colors.black)
                     ),
                   )
                   ),
                 ),
                 ),
                 Container(height: 65,width: 150,
                   child: Card(color: Colors.blueGrey,
                     shadowColor: Colors.black,elevation: 40,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                   child: Center(child: TextButton(
                     onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Signuppage()));},
                     child: Text("Sign Up",style: TextStyle(fontSize: 35,color: Colors.black)
                     ),
                   )
                   ),
                 ),
                 ),
               ],
             ),
           ),
         ),
       )
        ],
      ),
    ),
    );
  }
}
