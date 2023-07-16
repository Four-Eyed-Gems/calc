import 'package:calc/helper/prov.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provMdl = Provider.of<Helper>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: ScreenUtil().screenHeight,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Consumer<Helper>(builder: (context, data, _) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 25.0.h/*size.height * 0.05*/),
                      Image.asset(
                        "assets/images/love.gif",
                        height: 210.0.h/*size.height * 0.30*/,
                      ),
                      SizedBox(height: 30.0.h /*size.height * 0.04*/),
                      Text(
                        "You got",
                        style: textStyle,
                      ),
                      Text(
                        "${(provMdl.finalPercentage).round().toString()}%",
                        style: GoogleFonts.coiny(
                            textStyle: TextStyle(
                                fontSize: 30.sp,
                                color: Colors.red,
                                fontWeight: FontWeight.w300)),
                      ),
                      Text(
                        "Love From Your",
                        style: textStyle,
                      ),
                      Text(
                        "Partner",
                        style: textStyle,
                      ),
                      SizedBox(height: 40.0.h/*size.height * 0.08*/),
                      Text(
                        "Quotes:",
                        style: textStyleNew,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(provMdl.strQuotes.toString(),style: textStyleNew,textAlign: TextAlign.center),
                      ),
                      SizedBox(height: 10.0.h),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 255.0.w/*size.width * 0.7*/,
                          padding: const EdgeInsets.all(4.0),
                          height: 45.0.h/*size.height * 0.065*/,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30.0.r)),
                              color: Colors.redAccent.withOpacity(0.5)),
                          child: Text("Try Again",
                              style: textStyle, textAlign: TextAlign.center),
                        ),
                      )
                      // SizedBox(height: size.height * 0.13),
                    ],
                  ),
                );
              }),
              // SizedBox(height: 30.0.h),
              // InkWell(
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              //   child: Container(
              //     width: 255.0.w/*size.width * 0.7*/,
              //     padding: const EdgeInsets.all(4.0),
              //     height: 45.0.h/*size.height * 0.065*/,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(30.0.r)),
              //         color: Colors.redAccent.withOpacity(0.5)),
              //     child: Text("Try Again",
              //         style: textStyle, textAlign: TextAlign.center),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  final textStyle = GoogleFonts.coiny(
      textStyle:  TextStyle(
          fontSize: 30.sp, color: Colors.black, fontWeight: FontWeight.w300));

  final textStyleNew = TextStyle(
      fontFamily: 'Apercu',
      fontSize: 23.sp, color: Colors.black, fontWeight: FontWeight.w400);
}
