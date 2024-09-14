import 'dart:ui';

import 'package:flutter/material.dart';

class SelectedChitMonth extends StatelessWidget {
  const SelectedChitMonth({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 4),
                child: displayOfMonthAndOthers(
                  width: width,
                  height: height,
                  month: '12',
                  startdate: '10.07.2024',
                  enddate: '10.07.2024',
                  totalinvestors: '10',
                  brokerage: '4215',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: height * 0.9,
              width: width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    height: height * 0.05,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0Xff0067FF).withAlpha(200),
                    ),
                    child: const Center(
                      child: Text(
                        'Buy',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: dataTableWidget(width: width, height: height),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Updated dataTableWidget function
  Widget dataTableWidget({required double width, required double height}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header row for the table
          SizedBox(
            height: height * 0.1,
            child: Row(
              children: [
                Container(
                  width: width * 0.10,
                  decoration: BoxDecoration(
                    color: const Color(0Xff161E67),
                    borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(15)),
                    border: Border.all(width: 0.5, color: Colors.grey),
                  ),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns:
                      3, // Rotates the text by 270 degrees (vertical)
                      child: Text(
                        'Month',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.034,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width * 0.22,
                  decoration: BoxDecoration(
                    color: const Color(0Xff161E67),
                    border: Border.all(width: 0.5, color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      'Payment',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.034,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.22,
                  decoration: BoxDecoration(
                    color: const Color(0Xff161E67),
                    border: Border.all(width: 0.5, color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      'Dividend',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.034,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.18,
                  decoration: BoxDecoration(
                    color: const Color(0Xff161E67),
                    border: Border.all(width: 0.5, color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      'Prize money',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.034,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.23,
                  decoration: BoxDecoration(
                    color: const Color(0Xff161E67),
                    borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(15)),
                    border: Border.all(width: 0.5, color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      'Comparsion',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.034,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Repeated rows
          for (int i = 1; i <= 12; i++)
            rowOfTable(
              height: height,
              width: width,
              month: '$i',
              payment: '10,000',
              dividend: '0',
              prize: '0',
              comparison: '10,000',
            ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total amount you get = 1,00,000',
                style: TextStyle(
                  color: const Color(0xff263238),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: width * 0.05,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function for table header cells
  Container tableHeaderCell(String label, double width, double fontSizeWidth,
      {bool isLast = false, bool isVertical = false}) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: const Color(0Xff161E67),
        borderRadius: isLast
            ? const BorderRadius.only(topRight: Radius.circular(15))
            : null,
        border: Border.all(width: 0.5, color: Colors.grey),
      ),
      child: Center(
        child: isVertical
            ? RotatedBox(
          quarterTurns: 3, // Rotates the text by 270 degrees (vertical)
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: fontSizeWidth * 0.034,
            ),
            textAlign: TextAlign.center,
          ),
        )
            : Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: fontSizeWidth * 0.034,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Function to display table rows
  SizedBox rowOfTable({
    required double width,
    required double height,
    required String month,
    required String payment,
    required String dividend,
    required String prize,
    required String comparison,
  }) {
    return SizedBox(
      height: height * 0.05,
      child: Row(
        children: [
          tableRowCell(month, width * 0.10, width),
          tableRowCell(payment, width * 0.22, width),
          tableRowCell(dividend, width * 0.22, width),
          tableRowCell(prize, width * 0.18, width),
          tableRowCell(comparison, width * 0.23, width),
        ],
      ),
    );
  }

  // Helper function for table row cells
  Container tableRowCell(String label, double width, double fontSizeWidth) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: fontSizeWidth * 0.034,
          ),
        ),
      ),
    );
  }

  Container displayOfMonthAndOthers({
    required double width,
    required double height,
    required String month,
    required String startdate,
    required String enddate,
    required String totalinvestors,
    required String brokerage,
  }) {
    return Container(
      height: height * 0.40,
      width: width * 0.9,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$month months chit',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: width * 0.08,
              color: Colors.white,
              height: 28 / 30,
              decoration: TextDecoration.underline,
              decorationThickness: 0.5,
              decorationColor: Colors.white,
            ),
          ),
          SizedBox(
            height: width * 0.008,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Chit Amount :',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.05,
                  color: Color(0Xff0D0140),
                ),
              ),
            ],
          ),
          SizedBox(
            height: width * 0.008,
          ),
          Row(
            children: [
              const Icon(
                Icons.currency_rupee_outlined,
                size: 28,
                color: Colors.white,
              ),
              Text(
                '1,00,000',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.055,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: width * 0.008,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start date',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.05,
                        color: Color(0Xff0D0140),
                        decorationThickness: 0.5),
                  ),
                  Text(
                    startdate,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: width * 0.048,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'End date',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: width * 0.05,
                        color: Color(0Xff0D0140),
                        decorationThickness: 0.5),
                  ),
                  Text(
                    enddate,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w200,
                      fontSize: width * 0.048,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: width * 0.008,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Total Investors :',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.052,
                  color: Color(0Xff0D0140),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                totalinvestors,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.052,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: width * 0.008,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Brokerage :',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.052,
                  color: Color(0Xff0D0140),
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.currency_rupee_outlined,
                size: 20,
                color: Colors.white,
              ),
              Text(
                brokerage,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 34 / 20,
                  fontSize: width * 0.052,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: width * 0.008,
          ),
        ],
      ),
    );
  }
}



// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class SelectedChitMonth extends StatelessWidget {
//   const SelectedChitMonth({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double width = size.width;
//     double height = size.height;

//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: const Icon(
//             Icons.close_rounded,
//             size: 35,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/bg.jpeg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: ListView(
//           children: [
//             ClipRect(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 6, sigmaY: 4),
//                 child: displayOfMonthAndOthers(
//                   width: width,
//                   height: height,
//                   month: '12',
//                   startdate: '10.07.2024',
//                   enddate: '10.07.2024',
//                   totalinvestors: '10',
//                   brokerage: '4215',
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               height: height * 0.9,
//               width: width,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(60),
//                   topRight: Radius.circular(60),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   Container(
//                     height: height * 0.05,
//                     width: width * 0.8,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: const Color(0Xff0067FF).withAlpha(200),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Buy',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: dataTableWidget(
//                       width: width,
//                       height: height,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   SizedBox dataTableWidget({
//     required double width,
//     required double height,
//   }) {
//     return SizedBox(
//       height: height * 0.8,
//       width: width,
//       child: Column(
//         children: [
//           SizedBox(
//             height: height * 0.1,
//             child: Row(
//               children: [
//                 Container(
//                     width: width * 0.10,
//                     decoration: BoxDecoration(
//                         color: const Color(0Xff161E67),
//                         borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(15)),
//                         border: Border.all(width: 0.5, color: Colors.grey)),
//                     child: FittedBox(
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: width * 0.02),
//                         child: Column(
//                           children: [
//                             Text(
//                               'M',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.bold,
//                                   height: 0,
//                                   fontSize: width * 0.034),
//                             ),
//                             Text(
//                               'o',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.bold,
//                                   height: 0,
//                                   fontSize: width * 0.034),
//                             ),
//                             Text(
//                               'n',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.bold,
//                                   height: 0,
//                                   fontSize: width * 0.034),
//                             ),
//                             Text(
//                               't',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.bold,
//                                   height: 0,
//                                   fontSize: width * 0.034),
//                             ),
//                             Text(
//                               'h',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.bold,
//                                   height: 0,
//                                   fontSize: width * 0.034),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )),
//                 Container(
//                   width: width * 0.22,
//                   decoration: BoxDecoration(
//                       color: const Color(0Xff161E67),
//                       border: Border.all(width: 0.5, color: Colors.grey)),
//                   child: Center(
//                     child: Text(
//                       'Payment',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.bold,
//                           fontSize: width * 0.034),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: width * 0.22,
//                   decoration: BoxDecoration(
//                       color: const Color(0Xff161E67),
//                       border: Border.all(width: 0.5, color: Colors.grey)),
//                   child: Center(
//                     child: Text(
//                       'Dividend',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.bold,
//                           fontSize: width * 0.034),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: width * 0.18,
//                   decoration: BoxDecoration(
//                       color: const Color(0Xff161E67),
//                       border: Border.all(width: 0.5, color: Colors.grey)),
//                   child: Center(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: width * 0.02),
//                       child: Text(
//                         'Prize money',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.bold,
//                             fontSize: width * 0.034),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: width * 0.23,
//                   decoration: BoxDecoration(
//                       color: const Color(0Xff161E67),
//                       borderRadius: const BorderRadius.only(
//                           topRight: Radius.circular(15)),
//                       border: Border.all(width: 0.5, color: Colors.grey)),
//                   child: Center(
//                     child: Text(
//                       'Comparsion',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.bold,
//                           fontSize: width * 0.034),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           rowoftable(
//               height: height,
//               width: width,
//               month: '1',
//               Payment: '10,000',
//               dividend: '0',
//               prize: '0',
//               Comparsion: '10,000'),
//           rowoftable(
//               height: height,
//               width: width,
//               month: '2',
//               Payment: '10,000',
//               dividend: '0',
//               prize: '0',
//               Comparsion: '10,000'),
//           rowoftable(
//               height: height,
//               width: width,
//               month: '3',
//               Payment: '10,000',
//               dividend: '0',
//               prize: '0',
//               Comparsion: '10,000'),
//           rowoftable(
//               height: height,
//               width: width,
//               month: '4',
//               Payment: '10,000',
//               dividend: '0',
//               prize: '0',
//               Comparsion: '10,000'),
//           rowoftable(
//               height: height,
//               width: width,
//               month: '5',
//               Payment: '10,000',
//               dividend: '0',
//               prize: '0',
//               Comparsion: '10,000'),
//           rowoftable(
//               height: height,
//               width: width,
//               month: '6',
//               Payment: '10,000',
//               dividend: '0',
//               prize: '0',
//               Comparsion: '10,000'),
//           rowoftable(
//               height: height,
//               width: width,
//               month: '7',
//               Payment: '10,000',
//               dividend: '0',
//               prize: '0',
//               Comparsion: '10,000'),
//           rowoftable(
//               height: height,
//               width: width,
//               month: '8',
//               Payment: '10,000',
//               dividend: '0',
//               prize: '0',
//               Comparsion: '10,000'),
//           rowoftable(
//               height: height,
//               width: width,
//               month: '9',
//               Payment: '10,000',
//               dividend: '0',
//               prize: '0',
//               Comparsion: '10,000'),
//           rowoftable(
//               height: height,
//               width: width,
//               month: '10',
//               Payment: '10,000',
//               dividend: '0',
//               prize: '0',
//               Comparsion: '10,000'),
//           rowoftable(
//               height: height,
//               width: width,
//               month: '11',
//               Payment: '10,000',
//               dividend: '0',
//               prize: '0',
//               Comparsion: '10,000'),
//           rowoftable(
//               height: height,
//               width: width,
//               month: '12',
//               Payment: '10,000',
//               dividend: '0',
//               prize: '0',
//               Comparsion: '10,000'),
//          const SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text('Total amount you get = 1,00,000',
//                   style: TextStyle(
//                       color: Color(0xff263238),
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w700,
//                       fontSize: width * 0.05))
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   SizedBox rowoftable(
//       {required double width,
//       required double height,
//       required String month,
//       required String Payment,
//       required String dividend,
//       required String prize,
//       required String Comparsion}) {
//     return SizedBox(
//       height: height * 0.05,
//       child: Row(
//         children: [
//           Container(
//               width: width * 0.10,
//               decoration: BoxDecoration(
//                   border: Border.all(width: 0.5, color: Colors.grey)),
//               child: Center(
//                 child: Text(
//                   month,
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w600,
//                       fontSize: width * 0.03),
//                 ),
//               )),
//           Container(
//             width: width * 0.22,
//             decoration: BoxDecoration(
//                 border: Border.all(width: 0.5, color: Colors.grey)),
//             child: Center(
//               child: Text(
//                 Payment,
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600,
//                     fontSize: width * 0.03),
//               ),
//             ),
//           ),
//           Container(
//             width: width * 0.22,
//             decoration: BoxDecoration(
//                 border: Border.all(width: 0.5, color: Colors.grey)),
//             child: Center(
//               child: Text(
//                 dividend,
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600,
//                     fontSize: width * 0.03),
//               ),
//             ),
//           ),
//           Container(
//             width: width * 0.18,
//             decoration: BoxDecoration(
//                 border: Border.all(width: 0.5, color: Colors.grey)),
//             child: Center(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: width * 0.02),
//                 child: Text(
//                   prize,
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w600,
//                       fontSize: width * 0.03),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             width: width * 0.23,
//             decoration: BoxDecoration(
//                 border: Border.all(width: 0.5, color: Colors.grey)),
//             child: Center(
//               child: Text(
//                 Comparsion,
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w600,
//                     fontSize: width * 0.03),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Container displayOfMonthAndOthers({
//     required double width,
//     required double height,
//     required String month,
//     required String startdate,
//     required String enddate,
//     required String totalinvestors,
//     required String brokerage,
//   }) {
//     return Container(
//       height: height * 0.288,
//       width: width * 0.9,
//       margin: const EdgeInsets.symmetric(horizontal: 15),
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.4),
//         borderRadius: BorderRadius.circular(25),
//         border: Border.all(color: Colors.white, width: 0.5),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             '$month months chit',
//             style: TextStyle(
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w700,
//               fontSize: width * 0.08,
//               color: Colors.white,
//               height: 28 / 30,
//               decoration: TextDecoration.underline,
//               decorationThickness: 0.5,
//               decorationColor: Colors.white,
//             ),
//           ),
//           SizedBox(
//             height: width * 0.008,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 'Chit Amount :',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.bold,
//                   fontSize: width * 0.05,
//                   color: Color(0Xff0D0140),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: width * 0.008,
//           ),
//           Row(
//             children: [
//               const Icon(
//                 Icons.currency_rupee_outlined,
//                 size: 28,
//                 color: Colors.white,
//               ),
//               Text(
//                 '1,00,000',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: width * 0.055,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: width * 0.008,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Start date',
//                     style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         fontSize: width * 0.05,
//                         color: Color(0Xff0D0140),
//                         decorationThickness: 0.5),
//                   ),
//                   Text(
//                     startdate,
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w300,
//                       fontSize: width * 0.048,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'End date',
//                     style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         fontSize: width * 0.05,
//                         color: Color(0Xff0D0140),
//                         decorationThickness: 0.5),
//                   ),
//                   Text(
//                     enddate,
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w200,
//                       fontSize: width * 0.048,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(
//             height: width * 0.008,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 'Total Investors :',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: width * 0.052,
//                   color: Color(0Xff0D0140),
//                 ),
//               ),
//               const SizedBox(width: 5),
//               Text(
//                 totalinvestors,
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: width * 0.052,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: width * 0.008,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 'Brokerage :',
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: width * 0.052,
//                   color: Color(0Xff0D0140),
//                 ),
//               ),
//               const SizedBox(width: 5),
//               const Icon(
//                 Icons.currency_rupee_outlined,
//                 size: 20,
//                 color: Colors.white,
//               ),
//               Text(
//                 brokerage,
//                 style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   height: 34 / 20,
//                   fontSize: width * 0.052,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: width * 0.008,
//           ),
//         ],
//       ),
//     );
//   }
// }
