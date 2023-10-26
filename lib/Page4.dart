import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'page5.dart';
class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  TextEditingController _email=new TextEditingController();
  TextEditingController _password=new TextEditingController();

  final key = GlobalKey<FormState>();
  Future login(String Email,String Password)
  async {
    final FirebaseAuth auth= await FirebaseAuth.instance;
    try{
      await auth.signInWithEmailAndPassword(
          email: Email, password: Password)
          .then((value){
        print("Logined with $Email");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>FifthScreen()));
      }).onError((error, stackTrace) {
        // Scaffold.of(context).showSnackBar(SnackBar(content: Text("Password do not match"),duration: Duration(seconds: 4),));
      });
    }catch(e){
      throw Exception(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Form(key: key,
      child: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: Stack(children: [
                Image(image: NetworkImage("https://cdn.pixabay.com/photo/2023/08/11/06/12/boy-8182923_640.jpg")),
                Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: Container(height: 500,width: 390,
                    child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                   child: Column(children: [
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(left: 70,top: 10),
                           child: Text("Log in",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 10),
                           child: Text("to Your Account",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                         ),
                       ],
                     ),
                     Container(height: 40,),
                     Text("Enter Email",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                     Container(height: 70,width: 400,
                       child: TextFormField(
                         controller: _email,
                         decoration: InputDecoration(
                             hintText: 'Email',
                             labelText: 'Enter Your Email',
                             prefixIcon: Icon(Icons.mail,color: Colors.green,),
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(30))),
                         validator: (val) => val!.length == 0 ? "Enter Email" : null,
                       ),
                     ),
                     Container(height: 20,),
                     Text("Enter Email",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                     Container(height: 70,width: 400,
                       child: TextFormField(
                         controller: _password,
                         decoration: InputDecoration(
                             hintText: 'Email',
                             labelText: 'Enter Your Password',
                             prefixIcon: Icon(Icons.lock,color: Colors.green,),
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(30))),
                         validator: (val) => val!.length == 0 ? "Enter Email" : null,
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 180),
                       child: Text("Forgot password",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green),),
                     ),
                     Container(height: 70,width: 280,child: Card(color: Colors.green,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                     child: TextButton(onPressed: (){
                       if (key.currentState!.validate()){
                         login(_email.text.trim(),
                             _password.text.trim());}
                       }
                     ,child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),),
                     ),
                     )
                   ],), ),
                  ),
                )
              ],),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
