import 'package:flox/Chits/purchase_chits.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PurchasedChitsScreen extends StatelessWidget {
  const PurchasedChitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> getfunction() async {
      const url =
          "https://chitsoft.in/wapp/api/mobile3/month_chit_api.php?user=123&password=1234";
      final uri = Uri.parse(url);
      try {
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          final responseBody = response.body;
          final jsonresponse = json.decode(responseBody);
          List<dynamic> datas = jsonresponse['Datas'];
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => SelectedChitMonth(
          //           datas: datas,
          //         )));
        }
      } catch (err) {
        print("Error: $err");
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
                leading: Container(),

        backgroundColor: Colors.transparent,
        title: const Text(
          'Purchased Chits',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 27,
              height: 37 / 27,
              color: Colors.white),
        ),
        centerTitle: true,
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
          colliectionofchit(size, 'March', '1', () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SelectedChit()));
            // getfunction();
          }),
          colliectionofchit(size, 'May', '2', () {}),
          colliectionofchit(size, 'July', '5', () {}),
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
                      investors,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.05,
                          height: 31 / 21,
                          color: const Color(0Xff0039DB)),
                    ),
                    Text(
                      'Lakh chit',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.045,
                          height: 22 / 15,
                          color: const Color(0Xff0039DB)),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
