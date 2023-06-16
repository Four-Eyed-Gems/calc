import 'package:calc/helper/prov.dart';
import 'package:calc/screens/final_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  TextEditingController name = TextEditingController();
  TextEditingController pName = TextEditingController();

  bool nameBool = false;
  bool pNameBool = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: [
              Image(image: const AssetImage("assets/images/propose.png"),
                height: size.height / 2.5,
              ),
              SizedBox(height: size.height / 18),
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
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.013),
                      //  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: nameBool ? Colors.red : Colors.blue,width: 1.8),
                          color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      child:  TextField(
                        controller: name,
                        onChanged: (value){
                          if(name.text.isNotEmpty){
                            setState(() {
                              nameBool = false;
                            });
                          }
                        },
                        style: inputTextStyle,
                        decoration:   InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Name...',
                          hintStyle: inputTextStyle,
                          contentPadding: EdgeInsets.all(10.0)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: nameBool ? Text('ENTER YOUR NAME',style: GoogleFonts.coiny(
                        color: Colors.red
                      )) : Container(),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text('Your Partner Name',style: textStyle,),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Container(
                      height: size.height / 18,
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.012),
                      decoration: BoxDecoration(
                          border: Border.all(color: pNameBool ? Colors.red : Colors.blue,width: 1.8),
                          color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      // decoration: Style.decoration,
                      child:  TextField(
                        controller: pName,
                        style: inputTextStyle,
                        onChanged: (value){
                          if(pName.text.isNotEmpty){
                            setState(() {
                              pNameBool = false;
                            });
                          }
                        },
                        decoration:   InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Partner Name...',
                            hintStyle: inputTextStyle,
                            contentPadding: const EdgeInsets.all(10.0)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: pNameBool ? Text('ENTER YOUR NAME',style: GoogleFonts.coiny(
                          color: Colors.red
                      )) : Container(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              InkWell(
                onTap: () async {
                  if(name.text.isNotEmpty && pName.text.isNotEmpty){
                    if(name.text.length <= 2 || name.text.contains(" ")){
                      flutterToast("Enter name more than 2 Characters...");
                    }
                    else if(pName.text.length <= 2 || pName.text.contains(" ")){
                      flutterToast("Enter Partner Name more than 2 Characters...");
                    }
                    else{
                      await Provider.of<Helper>(context,listen: false).helper(name.text.toString().toLowerCase(),pName.text.toString().toLowerCase());
                      await Provider.of<Helper>(context,listen: false).getQuotes();
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => const FinalScreen())));
                    }
                  }
                  else{
                    if(name.text.isEmpty){
                      setState(() {
                        nameBool = true;
                      });
                    }
                    if(pName.text.isEmpty){
                      setState(() {
                        pNameBool = true;
                      });
                    }
                  }
                },
                child: Container(
                  height: size.height * 0.09,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                      boxShadow: [
                        BoxShadow(
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
      )
  );

  final inputTextStyle = GoogleFonts.coiny(
      textStyle: const TextStyle(
        color: Colors.black,
      )
  );



}
