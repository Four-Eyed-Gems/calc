import 'package:calc/screens/final_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  TextEditingController name = TextEditingController();
  TextEditingController pName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              Image(image: AssetImage("assets/images/propose.png"),
                height: size.height / 2.5,
              ),
              SizedBox(height: size.height / 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text('Your Name',style: textStyle,),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Container(
                      height: size.height / 18,
                      //  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 1.8),
                          color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      // decoration: Style.decoration,
                      child:  TextField(
                        controller: name,
                        style: const TextStyle(color: Colors.black),
                        decoration:  const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Name...',
                          hintStyle: TextStyle(
                              color: Colors.black),
                          contentPadding: EdgeInsets.all(10.0)
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text('Your Partner Name',style: textStyle,),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Container(
                      height: size.height / 18,
                      //  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue,width: 1.8),
                          color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      // decoration: Style.decoration,
                      child:  TextField(
                        controller: pName,
                        style: const TextStyle(color: Colors.black),
                        decoration:  const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Partner Name...',
                            hintStyle: TextStyle(
                                color: Colors.black),
                            contentPadding: EdgeInsets.all(10.0)
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              InkWell(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: ((context) => FinalScreen())));
                },
                child: Container(
                  height: size.height * 0.09,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(5,5)
                      ),]
                  ),
                  child: Icon(Icons.favorite_outlined,color: Colors.red,size: size.height * 0.05),
                ),
              )
            ],
          )
      ),
    );
  }
  final textStyle = GoogleFonts.coiny(
      textStyle: const TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w300
      ));


}
