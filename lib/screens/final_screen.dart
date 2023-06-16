import 'dart:math';
import 'package:calc/helper/prov.dart';
import 'package:flutter/material.dart';
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
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Consumer<Helper>(builder: (context, data, _) {
                final random =  Random();
                var element = provMdl.quotes[random.nextInt(provMdl.quotes.length)];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.05),
                      Image.asset(
                        "assets/images/love.gif",
                        height: size.height * 0.30,
                      ),
                      SizedBox(height: size.height * 0.04),
                      Text(
                        "You got",
                        style: textStyle,
                      ),
                      Text(
                        "${(provMdl.finalPercentage * 10).round().toString()}%",
                        style: GoogleFonts.coiny(
                            textStyle: const TextStyle(
                                fontSize: 30,
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
                      SizedBox(height: size.height * 0.08),
                      Text(
                        "Quotes:",
                        style: textStyleNew,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(element.toString(),style: textStyleNew,),
                      ),
                      // SizedBox(height: size.height * 0.13),
                    ],
                  ),
                );
              }),
              Positioned(
                bottom: 10,
                right: MediaQuery.of(context).size.width / 7,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: size.width * 0.7,
                    padding: const EdgeInsets.all(4.0),
                    height: size.height * 0.065,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                        color: Colors.redAccent.withOpacity(0.5)),
                    child: Text("Try Again",
                        style: textStyle, textAlign: TextAlign.center),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final textStyle = GoogleFonts.coiny(
      textStyle: const TextStyle(
          fontSize: 30, color: Colors.black, fontWeight: FontWeight.w300));

  final textStyleNew = const TextStyle(
      fontSize: 23, color: Colors.black, fontWeight: FontWeight.w400);
}
