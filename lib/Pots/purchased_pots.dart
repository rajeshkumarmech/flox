import 'package:flox/Pots/chitpot_name.dart';
import 'package:flox/Pots/constants.dart';
import 'package:flutter/material.dart';

class PurchasedPotPage extends StatefulWidget {
  const PurchasedPotPage({super.key});

  @override
  State<PurchasedPotPage> createState() => _PurchasedPotPageState();
}

class _PurchasedPotPageState extends State<PurchasedPotPage> {
 // Define the target amount

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Title centered
          Positioned(
            top: 25, // Adjust as needed
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Purchased Pots",
                style: TextStyle(
                  fontFamily: 'Poppins', // Ensure correct font family
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Notification button fixed to the right edge
          Positioned(
            top: 20, // Same top position as the title to align vertically
            right: 0, // Adjust distance from the right edge as needed
            child: IconButton(
              icon: Image.asset(
                  'assets/notification_icon.png'), // Use the custom icon
              onPressed: () {
                // Handle notification button press
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Notification button pressed')),
                );
              },
            ),
          ),

          // White rectangular box with rounded corners
          Positioned(
            top: 100, // Adjust as needed for vertical position
            left: 16, // Gap from the left edge
            right: 16, // Gap from the right edge
            child: InkWell(  
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChitpotName_Page()));
                });
              }, // Handle the tap event
              child: Container(
                width: MediaQuery.of(context).size.width -
                    32, // 330px with 16px gap on both sides
                height: 100, // Adjusted height to accommodate both text lines
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      12), // Set radius for rounded corners
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chit Pot Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Poppins', // Ensure correct font family
                          color: Color.fromARGB(240, 13, 1, 64),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Target :',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily:
                                  'Poppins', // Ensure correct font family
                              color: Color(0xFF0039DB), // Apply the blue color
                            ),
                          ),
                          SizedBox(
                              width:
                                  3), // Space between "Target :" and the amount
                          Text(
                            '$target_amount', // Display the target amount
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily:
                                  'Poppins', // Ensure correct font family
                              color: Color(
                                  0xFF0039DB), // Apply the same blue color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 210, // Adjust as needed for vertical position
            left: 16, // Gap from the left edge
            right: 16, // Gap from the right edge
            child: InkWell(
               // Handle the tap event
              child: Container(
                width: MediaQuery.of(context).size.width -
                    32, // 330px with 16px gap on both sides
                height: 100, // Adjusted height to accommodate both text lines
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      12), // Set radius for rounded corners
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chit Pot Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Poppins', // Ensure correct font family
                          color: Color.fromARGB(240, 13, 1, 64),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Target :',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily:
                                  'Poppins', // Ensure correct font family
                              color: Color(0xFF0039DB), // Apply the blue color
                            ),
                          ),
                          SizedBox(
                              width:
                                  3), // Space between "Target :" and the amount
                          Text(
                            '$target_amount', // Display the target amount
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily:
                                  'Poppins', // Ensure correct font family
                              color: Color(
                                  0xFF0039DB), // Apply the same blue color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 320, // Adjust as needed for vertical position
            left: 16, // Gap from the left edge
            right: 16, // Gap from the right edge
            child: InkWell(
              // Handle the tap event
              child: Container(
                width: MediaQuery.of(context).size.width -
                    32, // 330px with 16px gap on both sides
                height: 100, // Adjusted height to accommodate both text lines
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      12), // Set radius for rounded corners
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chit Pot Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Poppins', // Ensure correct font family
                          color: Color.fromARGB(240, 13, 1, 64),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Target :',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily:
                                  'Poppins', // Ensure correct font family
                              color: Color(0xFF0039DB), // Apply the blue color
                            ),
                          ),
                          SizedBox(
                              width:
                                  3), // Space between "Target :" and the amount
                          Text(
                            '$target_amount', // Display the target amount
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily:
                                  'Poppins', // Ensure correct font family
                              color: Color(
                                  0xFF0039DB), // Apply the same blue color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
