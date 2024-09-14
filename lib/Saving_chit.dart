import 'package:flox/Bottom_Navigation.dart';
import 'package:flox/HomePage.dart';
import 'package:flox/New_chit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavingChit extends StatefulWidget {
  const SavingChit({super.key});

  @override
  State<SavingChit> createState() => _SavingChitState();
}


class _SavingChitState extends State<SavingChit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpeg"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomnavbar()));
              },
              child: const ImageIcon(
                AssetImage("assets/cross.png"),
                color: Colors.white,
                size: 24,
              ),
            ),
            title: Text(
              "Saving Chit Fund",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 23.66,
                color: Colors.white,
              )),
            ),
            centerTitle: true,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: ImageIcon(
                  AssetImage("assets/Notification.png"),
                  color: Colors.white,
                  size: 24,
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 25),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewChit()));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "+New Chit Pot",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff2514A6),
                                    fontSize: 15.58)),
                          ),
                          const Image(image: AssetImage("assets/play.png"))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 15),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "House Deposit Pot",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2514A6),
                                  fontSize: 15.58)),
                        ),
                        const Image(image: AssetImage("assets/play.png"))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 15),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kids School Admission Pot",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff2514A6),
                                  fontSize: 15.58)),
                        ),
                        const Image(image: AssetImage("assets/play.png"))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
