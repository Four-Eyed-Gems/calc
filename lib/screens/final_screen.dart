import 'package:calc/helper/prov.dart';
import 'package:calc/screens/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provMdl = Provider.of<Helper>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Consumer<Helper>(
              builder: (context,data,_) {
                return Column(
                  children: [
                    SizedBox(height: size.height * 0.05),
                    Image.asset("assets/images/love.gif",height: size.height * 0.30,),
                    SizedBox(height: size.height * 0.04),
                    Text("You got",style: textStyle,),
                    Text("${(provMdl.final_percentage * 10).round().toString()}%",style: GoogleFonts.coiny(
                        textStyle: const TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.w300
                        )),
                    ),
                    Text("Love From Your",style: textStyle,),
                    Text("Partner",style: textStyle,),
                    SizedBox(height: size.height * 0.1),
                    Text("Quotes:",style: textStyleNew,),
                    //Text("FCUK AND FLY",style: textStyleNew,),
                    SizedBox(height: size.height * 0.13),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => SecondScreen())));
                      },
                      child: Container(
                        width: size.width * 0.7,
                        padding: EdgeInsets.all(4.0),
                        height: size.height * 0.065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.redAccent.withOpacity(0.5)
                        ),
                        child:   Text("Try Again",style: textStyle,textAlign: TextAlign.center),
                      ),
                    )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
  final textStyle = GoogleFonts.coiny(
      textStyle: const TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.w300
      ));

  final textStyleNew =  const TextStyle(
          fontSize: 23,
          color: Colors.black,
        fontWeight: FontWeight.w400
      );
}
