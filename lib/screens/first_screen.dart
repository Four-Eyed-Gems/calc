import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:calc/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

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
          Stack(
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
                top: 13.0,
                right: 5.0,
                left: 5.0,
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SecondScreen()
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_forward_ios,size: 35.0,color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  final textStyle = GoogleFonts.coiny(
      textStyle: const TextStyle(fontSize: 50, color: Colors.red));

}
