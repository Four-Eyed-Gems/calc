import 'package:calc/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/prov.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  bool isShowSignInDialog = false;

  bool term = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          SvgPicture.asset('assets/images/start-screen-img.svg'),
          Text(
            'Love',
            textAlign: TextAlign.center,
            style: textStyle
          ),
          Text(
            'Calculator',
            textAlign: TextAlign.center,
            style: textStyle
          ),
          SizedBox(height: 50.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  bool? boolValue = prefs.getBool('boolValue');
                  boolValue != null && boolValue ?
                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const SecondScreen()))) :
                  showDialog(ScreenUtil().screenHeight.h);
                },
                child: Container(
                  height: 55.0.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  decoration:  BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(16.w)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: const Offset(0, 3),
                          blurRadius: 8.r,
                        ),
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Container(
                         child: Text(
                          "Explore Now",
                          style: GoogleFonts.coiny(color: Colors.white,fontSize: 17.0.sp),
                       )),
                       SizedBox(width: 8.w),
                       const Icon(Icons.arrow_forward_ios_outlined,color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
       //  SizedBox(height: 25.h,)
        ],
      ),
    );
  }

  final textStyle = GoogleFonts.coiny(
      textStyle: TextStyle(fontSize: 50.sp, color: Colors.red));

  showDialog(double size){
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 24.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(40.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, 30),
                      blurRadius: 60.w,
                    ),
                    BoxShadow(
                      color: Colors.black45,
                      offset: const Offset(0, 30),
                      blurRadius: 60.w,
                    ),
                  ],
                ),
                child: StatefulBuilder(
                    builder: (context,menuState) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                Text(
                                  "Terms & Conditions",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.close)
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.w),
                              child: const Text(
                                "Love Calculator is dedicated to safeguarding the privacy of its users. We don't ask our users for any permissions, and our application doesn't have any age-restricted content.We do not collect any personal information from our users, such as their name, address, or phone number. Additionally, we don't gather any private data, such financial or medical information.We do not share any user data with third parties, except as required by law or as necessary to provide our services. We may disclose user data if we believe it is necessary to protect the rights, property, or safety of Love Calculator, our users, or others.Our application does not contain any age-restricted content.If you have any questions or concerns about our privacy policy, please contact us at foureyedgems@gmail.com",
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.leading,
                                    title:  const Text('Accept Terms & Conditions',style: TextStyle(
                                        color: Colors.black
                                    ),),
                                    onChanged: (value){
                                      menuState((){
                                        term = value!;
                                      });
                                    },
                                    value: term,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0.h),
                            InkWell(
                              onTap: () async {
                                if(term){
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setBool('boolValue', true);
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const SecondScreen())));
                                }
                                else{
                                  flutterToast("Please accept terms & conditions");
                                }
                              },
                              child: Container(
                                height: 55.h,
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: const Offset(0, 3),
                                        blurRadius: 8.w,
                                      ),
                                    ]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                     Text(
                                      "Continue",
                                      style: TextStyle(color: Colors.white,fontSize: 18.0.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        // if (anim.status == AnimationStatus.reverse) {
        //   tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        // } else {
        //   tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        // }

        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: anim, curve: Curves.easeInOut),
          ),
          // child: FadeTransition(
          //   opacity: anim,
          //   child: child,
          // ),
          child: child,
        );
      },
    );
  }
}
