import 'package:calc/screens/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset('assets/images/start-screen-img.svg'),
          const SizedBox(height: 20.0),
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
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                //  prefs.setString('name',response["user"]["name"]);
                  bool? boolValue = prefs.getBool('boolValue');
                  boolValue != null && boolValue ?
                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const SecondScreen()))) :
                  showDialog(size);
                },
                child: Container(
                  height: size.height * 0.08,
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 3),
                          blurRadius: 8,
                        ),
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const[
                       Text(
                        "Explore Now",
                        style: TextStyle(color: Colors.white,fontSize: 18.0),
                      ),
                       SizedBox(width: 8),
                       Icon(Icons.arrow_forward_ios_outlined,color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
         SizedBox(height: size.height / 30,)
         /* Stack(
            children: [
              Container(
                height: size.height / 8,
                width: size.width / 5,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(60)
                  )
                ),
                padding: const EdgeInsets.only(left: 7.0,right: 7.0),
              ),
              Positioned(
                top: size.height * 0.005,
                right: size.height * 0.010,
                left: size.height * 0.010,
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SecondScreen()
                      ),
                    );
                  },
                  child:  CircleAvatar(
                    radius: size.height / 24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_forward_ios,size: size.height / 24,color: Colors.black),
                  ),
                ),
              ),
            ],
          ),*/
        ],
      ),
    );
  }

  final textStyle = GoogleFonts.coiny(
      textStyle: const TextStyle(fontSize: 50, color: Colors.red));

  showDialog(Size size){
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
                // height: MediaQuery.of(context).size.height / 1.5,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, 30),
                      blurRadius: 60,
                    ),
                    const BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 30),
                      blurRadius: 60,
                    ),
                  ],
                ),
                child: StatefulBuilder(
                    builder: (context,menuState) {
                      return SingleChildScrollView(
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                Text(
                                  "Terms & Conditions",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
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
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                "Love Calculator is dedicated to safeguarding the privacy of its users. We don't ask our users for any permissions, and our application doesn't have any age-restricted content.We do not collect any personal information from our users, such as their name, address, or phone number. Additionally, we don't gather any private data, such financial or medical information.We do not share any user data with third parties, except as required by law or as necessary to provide our services. We may disclose user data if we believe it is necessary to protect the rights, property, or safety of Love Calculator, our users, or others.Our application does not contain any age-restricted content.If you have any questions or concerns about our privacy policy, please contact us at foureyedgems@gmail.com",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CheckboxListTile(
                                    controlAffinity: ListTileControlAffinity.leading,
                                    title:  const Text('Accept Terms & Conditions',style: TextStyle(
                                        color: Colors.blue
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
                            const SizedBox(height: 20.0),
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
                                height: size.height * 0.08,
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 3),
                                        blurRadius: 8,
                                      ),
                                    ]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:const [
                                     Text(
                                      "Continue",
                                      style: TextStyle(color: Colors.white,fontSize: 18.0),
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
