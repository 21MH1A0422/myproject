import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproject/page3.dart';
import 'page2.dart';


class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  // String Email='';
  // String Password='';
  // String Confirmpassword='';

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _confirmpassword = new TextEditingController();
  final key = GlobalKey<FormState>();
  Future signup(String _email,String _password, String _confirmpassword)
  async {
    final FirebaseAuth auth= await FirebaseAuth.instance;
    try{
      await auth.signInWithEmailAndPassword(
          email: _email, password: _password)
          .then((value){
            print("Logined with $_email");
      }).onError((error, stackTrace) {
        print("Wrong Password");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdScreen(email: _email, password: _password)));
      });
    }catch(e){
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(backgroundColor: Colors.greenAccent,),backgroundColor: Colors.greenAccent,
    body: Form(key: key,
      child: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Center(
          child: Container(height: 650,width: 370,
          child: Card(color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Column(children: [
            Text(
              'SignUp',
              style:
              TextStyle(fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
            SizedBox(height: 30,),
            Text(
              'Enter Email',
              style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(height: 70,width: 300,
              child: TextFormField(
                controller: _email,
                decoration: InputDecoration(prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    labelText: 'Enter Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                validator: (val) =>
                val!.length == 0 ? "Enter Email" : null,
                // validator: (val) {
                //   if (val!.isEmpty){
                //     return "please Enter Your Email";
                //   }else{
                //     return null;
                //   }
                // },
                // onSaved: (val){
                //   setState(() {
                //     _email=val! as TextEditingController;
                //   });
                // },
              ),
            ),
            Text(
              'Enter Password',
              style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(height: 70,width: 300,
              child: TextFormField(
                controller: _password,
                decoration: InputDecoration(prefixIcon: Icon(Icons.remove_red_eye),
                    hintText: 'Password',
                    labelText: 'Enter Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                validator: (val) =>
                val!.length == 0 ? "Enter Password" : null,
              ),
            ),
            Text("Confirm Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Container(height: 70,width: 300,
              child: TextFormField(
                controller: _confirmpassword,
                decoration: InputDecoration(prefixIcon: Icon(Icons.remove_red_eye_outlined),
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                validator: (val) =>
                val!.length == 0 ? "Enter Password" : null,
              ),
            ),
            Container(height: 20,),
            Container(height: 60,width: 160,
            child: Card(color: Colors.tealAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
           child: TextButton(onPressed: ()async{
if (key.currentState!.validate()){
  signup(_email.text.trim(),
      _password.text.trim(),
    _confirmpassword.text.trim()
  );
  Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondScreen()));
}
           },child: Text("Sign Up",style: TextStyle(color: Colors.black,
               fontSize: 20,
               fontWeight: FontWeight.bold),),), ),
            )
          ],),
          ),
          ),
        ),
      ),
    ),);
  }
}


