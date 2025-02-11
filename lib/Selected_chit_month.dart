import 'dart:math';

import 'package:flox/Pots/sliderTooltip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedChitMonth extends StatefulWidget {
  const SelectedChitMonth({super.key});

  @override
  State<SelectedChitMonth> createState() => _SelectedChitMonthState();
}

class _SelectedChitMonthState extends State<SelectedChitMonth> {
  double _currentSliderValue = 0; // Initial value of the slider
  bool _isOverlayVisible = false;
String? Name;
  double? amount;
  void _toggleOverlay() {
    setState(() {
      _isOverlayVisible = !_isOverlayVisible;
    });
  }

  void _showWithdrawBottomSheet() {
    if (_currentSliderValue > 6) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Allow height to be controlled
        backgroundColor: Colors.transparent, // Remove the default background
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width, // Full width
            height: 185, // Fixed height
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20), // Rounded top corners
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16), // Padding from the top
                Padding(
                  padding: const EdgeInsets.only(left: 60, top: 30),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/gpay.png'),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 120, top: 30),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/phonepe.png'),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // Show a message if weeks are 6 or less
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('For withdraw, the number of due should be greater than 6.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _showAddFundBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow height to be controlled
      backgroundColor: Colors.transparent, // Remove the default background
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width, // Full width
          height: 185, // Fixed height
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20), // Rounded top corners
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16), // Padding from the top
              Padding(
                padding: const EdgeInsets.only(left: 60, top: 30),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/gpay.png'),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 120, top: 30),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/phonepe.png'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
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
              actions: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isOverlayVisible = !_isOverlayVisible;
                    });
                  },
                  child: Icon(
                    Icons.edit_document,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
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
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff17B9ff)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 20),
                              child: Text(
                                "Target Amount:",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.white),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 20, left: 10),
                              child: Text(
                                "Total Months : 10",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 23, top: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.currency_rupee_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "10000",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.75,
                                        color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Start Date : 16/10/2024",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                "End Date : 16/10/2025",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SliderTheme(
                            data: SliderThemeData(
                              thumbColor: Colors.white,
                              activeTrackColor:
                                  Color.fromARGB(255, 13, 27, 139),
                              // Visible color for active track
                              inactiveTrackColor: Color(0xffD9D9D9),
                              // Visible color for inactive track
                              trackHeight: 15,
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 12),
                            ),
                            child: Slider(
                              value: _currentSliderValue,
                              min: 0,
                              max: 30,
                              // Ensure this matches the maximum value
                              divisions: 30,
                              // Number of discrete divisions
                              onChanged: (value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: calculateTooltipPosition1(), right: 10),
                          child: SliderTooltip(
                            sliderValue: _currentSliderValue,
                            thumbWidth: 24, // Adjust based on your thumb size
                          ),
                        ),
                        SizedBox(height: 7,),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Text("You Won Auction on 5th Month",style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white)),),
                      ),
                      SizedBox(height: 10,)
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Stack(children: [
                        Image.asset("assets/progress_bar.png"),
                        Positioned(
                          top: 60,
                          left: 60,
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: CustomPaint(
                              painter: CircularProgressBarPainter(
                                progress: _currentSliderValue /
                                    30, // Example progress value
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 148,
                          left: 113,
                          child: Icon(
                            Icons.currency_rupee_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                            top: 145,
                            left: 135,
                            child: Text(
                              "30000",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 23,
                                      color: Colors.white)),
                            )),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Contribution Amount : 10000",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: _showAddFundBottomSheet,
                      child: Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff0067FF), Color(0xff090F26)],
                          ),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(20),
                            right: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Add Fund",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 14.23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: _showWithdrawBottomSheet,
                      child: Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff0067FF), Color(0xff090F26)],
                          ),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(20),
                            right: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Withdraw",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 14.23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        if (_isOverlayVisible)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 18),
            child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 244, 244),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: _toggleOverlay,
                            child: const Icon(
                              Icons.close_rounded,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 244, 244),
                            borderRadius: BorderRadius.circular(25)),
                      )
                    ],
                  ),
                )),
          ),
      ],
    );
  }

  double calculateTooltipPosition1() {
    final sliderWidth = MediaQuery.of(context).size.width - 60;
    final tooltipWidth = 50; // Width of the tooltip
    final maxSliderValue = 30; // Maximum value of the slider

    double position = (_currentSliderValue / maxSliderValue) * sliderWidth;

    if (position + tooltipWidth > sliderWidth) {
      position = sliderWidth - tooltipWidth;
    }

    return position;
  }
}

class CircularProgressBarPainter extends CustomPainter {
  final double progress;

  CircularProgressBarPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double strokeWidth = 15.0;

    final Paint paintBackground = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final Paint paintForegroundGlow = Paint()
      ..color = const Color(0xff37F4FA)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);

    final Paint paintForeground = Paint()
      ..color = const Color(0xff37F4FA)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final Paint paintThumb = Paint()
      ..color = Color(0xff00D7FF)
      ..style = PaintingStyle.fill;

    final double adjustedRadius = radius - strokeWidth / 2;

    canvas.drawCircle(
      Offset(radius, radius),
      adjustedRadius,
      paintBackground,
    );

    final double sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: adjustedRadius),
      -pi / 2,
      sweepAngle,
      false,
      paintForegroundGlow,
    );

    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: adjustedRadius),
      -pi / 2,
      sweepAngle,
      false,
      paintForeground,
    );

    final double thumbRadius = 12.0;
    final double thumbAngle = -pi / 2 + sweepAngle;
    final double thumbX = radius + (adjustedRadius) * cos(thumbAngle);
    final double thumbY = radius + (adjustedRadius) * sin(thumbAngle);

    canvas.drawCircle(
      Offset(thumbX, thumbY),
      thumbRadius,
      paintThumb,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
