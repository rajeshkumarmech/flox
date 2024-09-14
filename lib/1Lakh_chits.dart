import 'package:flutter/material.dart';
import 'Selected_chit_month.dart';

class Onelakhchits extends StatelessWidget {
  const Onelakhchits({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          '1 Lakh CHITS',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 27,
              height: 37 / 27,
              color: Colors.white),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.close_rounded,
            size: 35,
            color: Colors.white,
          ),
        ),
        actions: const [
          Icon(
            Icons.notifications_sharp,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(children: [
          colliectionofchit(size, 'March', '10', () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SelectedChitMonth()));
          }),
          colliectionofchit(size, 'May', '10', () {}),
          colliectionofchit(size, 'July', '10', () {}),
        ]),
      ),
    );
  }

  GestureDetector colliectionofchit(
      Size size, String monthname, String investors, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height / 8,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$monthname Chit',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.065,
                      height: 33 / 22,
                      color: const Color(0Xff0D0140)),
                ),
                Row(
                  children: [
                    Text(
                      'Total Investors : ',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.045,
                          height: 22 / 15,
                          color: const Color(0Xff0D0140)),
                    ),
                    Text(
                      investors,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.05,
                          height: 31 / 21,
                          color: const Color(0Xff0039DB)),
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 2,
                              color: Color.fromARGB(255, 128, 122, 122),
                            )
                          ]),
                      child: Center(
                        child: Image.asset('assets/arrow.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
