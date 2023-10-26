import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'Page4.dart';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({super.key, required this.email, required this.password});
  String email;
  String password;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  File? Img;

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        Img = File(pickedImage.path);
      });
    }
  }
DateTime timeBackPressed = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: ()async{
      final difference = DateTime.now().difference(timeBackPressed);
      final isExitWarning = difference >= Duration(seconds: 2);
      timeBackPressed = DateTime.now();
      if (isExitWarning){
        final message = "Press back again to Exit";
        Fluttertoast.showToast(msg:message,fontSize:18);

        return false;
      }
      else{Fluttertoast.cancel();
        return true;
      }
    //   final value =await
    //   showDialog<bool>(context: context, builder: (context) {
    //     return AlertDialog(
    //       title: Text("Alert"),
    //       content: Text("Do You Want To Exit"),
    //       actions: [
    //         ElevatedButton(onPressed: ()=>Navigator.of(context).pop(false),
    //             child: Text("No")),
    //         ElevatedButton(onPressed: ()=>Navigator.of(context).pop(true),
    //             child: Text("Exit")),
    //       ],
    //     );
    //   });
    //   if(value!= null){
    //     return Future.value(value);
    //   }else{
    //     return Future.value(value);
    //   }
     },
      child: Scaffold(
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: InkWell(
                    onTap: (){_openImagePicker();},
                    child: CircleAvatar(
                        radius: 50,
                        child:ClipOval(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child:  Img != null
                                ? Image.file(
                              Img!,
                              fit: BoxFit.cover,
                            )
                                : Image.network(
                              'https://cdn.pixabay.com/photo/2023/04/11/15/48/flower-7917595_640.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                  ),
                ),
              ]),
              Row(
                children: [
                  Text(
                    'Hey!\n${widget.email}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Stream:${widget.password}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 150,
                        child: Card(
                          color: Colors.teal,
                          elevation: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 150,
                        child: Card(
                          color: Colors.teal,
                          elevation: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 150,
                        child: Card(
                          color: Colors.teal,
                          elevation: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 150,
                        child: Card(
                          color: Colors.teal,
                          elevation: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 150,
                        child: Card(
                          color: Colors.teal,
                          elevation: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CarouselSlider(items:
                 [ Container(height: 100,width: 400,child: Card(color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),),
                   Container(height: 100,width: 400,child: Card(color: Colors.blueGrey,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),),
                   Container(height: 100,width: 400,child: Card(color: Colors.greenAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),),
                   Container(height: 100,width: 400,child: Card(color: Colors.yellowAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),),
                   Container(height: 100,width: 400,child: Card(color: Colors.orangeAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),),)],
                  options: CarouselOptions(
                   autoPlayInterval: Duration(seconds: 2),
                    autoPlay: true,

                  )),
TextButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>Page4()));
}, child: Text("Next Page"))
            ],
          ),
        ),
      ),
    );
  }
}
