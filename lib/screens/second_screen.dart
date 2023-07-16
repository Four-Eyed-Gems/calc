import 'package:calc/helper/prov.dart';
import 'package:calc/screens/final_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    print(size.height / 2.5);
    return Scaffold(
      body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: [
              Image(image: const AssetImage("assets/images/propose.png"),
                height: 280.0.h,
              ),
              SizedBox(height: 40.0.h),
              Padding(
                padding: EdgeInsets.all(10.0.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0.r),
                        child: Text('Your Name',style: textStyle,),
                      ),
                      SizedBox(height: 5.0.h),
                      Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 10.0.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: nameBool ? Colors.red : Colors.blue,width: 1.8),
                            color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
                        child:  TextField(
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("([a-zA-Z]+).*"))],
                          controller: name,
                          cursorColor: Colors.white,
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
                            //contentPadding: EdgeInsets.all(10.0)
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 5.0.w),
                        child: nameBool ? Text('ENTER YOUR NAME',style: GoogleFonts.coiny(
                          color: Colors.red
                        )) : Container(),
                      ),
                      SizedBox(height: 12.h),
                      Padding(
                        padding: EdgeInsets.all(6.0.w),
                        child: Text('Your Partner Name',style: textStyle,),
                      ),
                      SizedBox(height: 5.0.h),
                      Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 10.0.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: nameBool ? Colors.red : Colors.blue,width: 1.8),
                            color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
                        child:  TextField(
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("([a-zA-Z]+).*"))],
                          cursorColor: Colors.white,
                          controller: pName,
                          style: inputTextStyle,
                          onChanged: (value){
                            if(pName.text.isNotEmpty){
                              setState(() {
                                pNameBool = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Partner Name...',
                              hintStyle: inputTextStyle,
                            //  contentPadding: const EdgeInsets.all(10.0)
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 5.0.w),
                        child: pNameBool ? Text('ENTER YOUR PARTNER NAME',style: GoogleFonts.coiny(
                            color: Colors.red
                        )) : Container(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0.h/*size.height * 0.03*/),
              InkWell(
                onTap: () async {
                  if(name.text.isNotEmpty && pName.text.isNotEmpty){
                    if(name.text.length <= 2){
                      flutterToast("Enter name more than 2 Characters...");
                    }
                    else if(pName.text.length <= 2){
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
                  height: 65.0.h/*size.height * 0.09*/,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0.r,
                        offset: Offset(5,5)
                      ),]
                  ),
                  child: Icon(Icons.favorite_outlined,color: Colors.red,size: 35.h /*size.height * 0.05*/),
                ),
              )
            ],
          )
      ),
    );
  }
  final textStyle = GoogleFonts.coiny(
      textStyle: TextStyle(
        fontSize: 25.sp,
        color: Colors.black,
        fontWeight: FontWeight.w300
      )
  );

  final inputTextStyle = GoogleFonts.coiny(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 14.sp
      )
  );



}
