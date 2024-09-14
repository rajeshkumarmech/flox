import 'package:flox/Bottom_Navigation.dart';
import 'package:flox/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewChit extends StatefulWidget {
  const NewChit({super.key});

  @override
  State<NewChit> createState() => _NewChitState();
}

class _NewChitState extends State<NewChit> {
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
              "New Chit Pot",
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
                padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
                child: Container(
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 25),
                        child: Text(
                          "Name your Chit Pot",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xff263238))),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 45, right: 20, top: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xff263238)
                                        .withOpacity(0.4),
                                    width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              labelText: "chit name",
                              labelStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff263238)
                                          .withOpacity(0.4)))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 15),
                        child: Text(
                          "Target Amount",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xff263238))),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 45, right: 20, top: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xff263238)
                                        .withOpacity(0.4),
                                    width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              labelText: "Amount",
                              labelStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff263238)
                                          .withOpacity(0.4)))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 15),
                        child: Text(
                          "Weekly Minimum Contribution",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xff263238))),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 45, right: 20, top: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xff263238)
                                        .withOpacity(0.4),
                                    width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              labelText: "Payment",
                              labelStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff263238)
                                          .withOpacity(0.4)))),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 40, right: 45, left: 45),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xff0067FF),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff0067FF),
                                foregroundColor: Colors.white,
                                textStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18))),
                            child: const Text("Send Request"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
