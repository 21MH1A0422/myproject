import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'page3.dart';
import 'signup page.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController Email = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  Future signup(String Email,String Password)
  async {
    final FirebaseAuth auth= await FirebaseAuth.instance;
    try{
      await auth.signInWithEmailAndPassword(
          email: Email, password: Password)
          .then((value){
        print("Logged with $Email");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdScreen(email: Email, password: Password)));
      }).onError((error, stackTrace) {
      // Scaffold.of(context).showSnackBar(SnackBar(content: Text("Password do not match"),duration: Duration(seconds: 4),));
      });
    }catch(e){
      throw Exception(e);
    }
  }
  String selectedoption = "";
  bool? isSelected = false;
  bool? box = true;
  bool isChanged = false;
  List<String> study = [
    "B.tech",
    "Intermediate",
    "Diploma",
    "10th"
  ];
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.orangeAccent.shade200,
      body: Center(
        child: Container(height: 700,width: 370,
        child: Card(color: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Stack(
                      children:[ Center(child: Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl9HooEISbZJr1ljmhn4RB_twrjlqEOFVgVg&usqp=CAU"))),
                  Padding(
                    padding: const EdgeInsets.only(top: 50,left: 46),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text("𝔹𝕠𝕠𝕜",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.orangeAccent),),
                          ),
                          Text("𝕊",style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.orangeAccent),),
                          Text("\n𝕥𝕠𝕣𝕖",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.orangeAccent),),
                        ],
                      ),
                    ),
                  )]),
                  Text(
                    'Login',
                    style:
                    TextStyle(fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,shadows: []),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    'Enter Email',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(height: 70,width: 300,
                    child: TextFormField(cursorColor: Colors.black,autocorrect: true,autofocus: true,
                      controller: Email,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Enter Your Email',isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                      validator: (val) => val!.length == 0 ? "Enter Email" : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      'Enter Password',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(height: 70,width: 300,
                    child: TextFormField(
                      controller: Password,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Enter Your Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))
                      ),
                      validator: (val) =>
                          val!.length == 0 ? "Enter your Password" : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: DropdownMenu(
                      dropdownMenuEntries:
                          study!.map<DropdownMenuEntry<String>>((val) {
                        return DropdownMenuEntry(value: val, label: val);
                      }).toList(),
                      onSelected: (select) {
                        setState(() {
                          isSelected = select as bool?;
                        });
                      },
                    ),
                  ),

                  Container(height: 55,width: 150,
                    child: Card(color: Colors.orangeAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          onPressed: () {
                             if (_key.currentState!.validate()) {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ThirdScreen(
                              //             username: Email.text,
                              //             Select: Password.text)));
                             signup(Email.text.trim(),
                                 Password.text.trim());}
                            // Future<void> createuser() async{
                            //   FirebaseAuth.instance.createUserWithEmailAndPassword(
                            //       email: _username.text.trim(),
                            //       password: _Stream.text.trim());
                            // }
                            // createuser();
                            // _Stream.clear();
                            // _username.clear();
                          },
                          child: Text('Login',style: TextStyle(color: Colors.black,fontSize: 20),)),
                    ),
                  ),
                  Row(
                    children: [SizedBox(width: 60,),
                      Text("Don't have an account?",style: TextStyle(color: Colors.blueGrey),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Signuppage()));
                      }, child: Text("Signup here",style: TextStyle(color: Colors.blueGrey),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
          ),
      ),
    );
  }
}
