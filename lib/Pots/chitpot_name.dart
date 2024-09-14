import 'package:flox/Bottom_Navigation.dart';
import 'package:flox/HomePage.dart';
import 'package:flox/Pots/constants.dart';
import 'package:flox/Pots/purchased_pots.dart';
import 'package:flutter/material.dart';
import 'sliderTooltip.dart'; // Import the custom tooltip widget
import 'dart:math'; // For mathematical operations

class ChitpotName_Page extends StatefulWidget {
  const ChitpotName_Page({super.key});

  @override
  State<ChitpotName_Page> createState() => _ChitpotName_PageState();
}

class _ChitpotName_PageState extends State<ChitpotName_Page> {
  int withdraw_amount = 2250;
  int contribution_amount = 250;
  double _currentSliderValue = 0; // Initial value of the slider
  final TextEditingController _contributionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the TextEditingController with the initial contribution_amount
    _contributionController.text = contribution_amount.toString();
  }

  void _incrementContribution() {
    setState(() {
      contribution_amount += 50;
      _contributionController.text = contribution_amount.toString();
    });
  }

  void _decrementContribution() {
    setState(() {
      contribution_amount = max(
          contribution_amount - 50, 0); // Ensure the amount doesn't go below 0
      _contributionController.text = contribution_amount.toString();
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PurchasedPotPage(),
                  ),
                );
              },
              icon: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bottomnavbar()));
                  },
                  child: Image.asset('assets/exit_icon.png')),
            ),
          ),
          Positioned(
            top: 25,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Chit Pot Name",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 25,
            right: 10,
            child: IconButton(
              onPressed: () {
                // Handle bell button press
              },
              icon: Image.asset('assets/bell_icon.png'),
            ),
          ),
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.03),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xFF17B9FF),
                  width: 0.40,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Target Amount :",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Container(
                            height: 1,
                            width: 135,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Total Due: 30",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 7),
                        child: Image.asset('assets/rupee.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          '$target_amount', // Display constant target_amount
                          style: TextStyle(
                            fontSize: 24.75,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Stack(
                    clipBehavior: Clip.none, // Allow the tooltip to overflow
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 32,
                        child: SliderTheme(
                          data: SliderThemeData(
                            thumbColor: Colors.white,
                            activeTrackColor: Color.fromARGB(255, 13, 27, 139),
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
                      Positioned(
                        left: calculateTooltipPosition(),
                        top: 40, // Position the tooltip below the slider
                        child: SliderTooltip(
                          sliderValue: _currentSliderValue,
                          thumbWidth: 24, // Adjust based on your thumb size
                        ),
                      ),
                      Positioned(
                        top: 137,
                        left: MediaQuery.of(context).size.width *
                            0.19, // Adjust as needed
                        child: SizedBox(
                          width: 183 + 5, // Increase width by strokeWidth
                          height: 185, // Increase height by strokeWidth
                          child: CustomPaint(
                            painter: CircularProgressBarPainter(
                              progress: _currentSliderValue /
                                  30, // Example progress value
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Center(child: Image.asset("assets/progress_bar.png")),
          ),
          Positioned(
            top: 430,
            left: 150,
            child: Row(
              children: [
                Image.asset('assets/rupee.png'),
                Text(
                  '$withdraw_amount',
                  style: TextStyle(
                      fontSize: 23.44,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Positioned(
            top: 560,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: IconButton(
                    onPressed: () {
                      _decrementContribution();
                    },
                    icon: Image.asset('assets/minus_button.png'),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    "Contribution Amount :",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: 60, // Adjust the width as needed
                    child: TextFormField(
                      controller: _contributionController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          // Update contribution_amount when TextField changes
                          contribution_amount = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, top: 5),
                  child: IconButton(
                    onPressed: () {
                      _incrementContribution();
                    },
                    icon: Image.asset('assets/plus_button.png'),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 730,
            left: 16,
            right: 16,
            child: GestureDetector(
              onTap: _showAddFundBottomSheet,
              child: Container(
                width: MediaQuery.of(context).size.width - 32,
                height: 35.74,
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
          ),
          Positioned(
            top: 785,
            left: 16,
            right: 16,
            child: GestureDetector(
              onTap: _showWithdrawBottomSheet,
              child: Container(
                width: MediaQuery.of(context).size.width - 32,
                height: 35.74,
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
          ),
        ],
      ),
    );
  }

  double calculateTooltipPosition() {
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
