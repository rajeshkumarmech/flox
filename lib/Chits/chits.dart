import 'package:flox/Chits/purchase_chits.dart';
import 'package:flox/Section.dart';
import 'package:flutter/material.dart';
import 'package:flox/Selected_chit_month.dart';

class PurchasedChitsScreen extends StatefulWidget {
  @override
  State<PurchasedChitsScreen> createState() => _PurchasedChitsScreenState();
}

class _PurchasedChitsScreenState extends State<PurchasedChitsScreen> {
  final List<Map<String, String>> chits = [
    {'title': 'March Chit', 'amount': '1 Lakh chit'},
    {'title': 'May Chit', 'amount': '2 Lakh chit'},
    {'title': 'July Chit', 'amount': '5 Lakh chit'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Purchased Chits',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/foxlbg.jpeg"),
                // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.only(top: 100),
            itemCount: chits.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to detail page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectedChit(),
                    ),
                  );
                },
                child: ChitCard(
                  title: chits[index]['title']!,
                  amount: chits[index]['amount']!,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SelectedChitMonthPurchase {
}

class ChitCard extends StatelessWidget {
  final String title;
  final String amount;

  const ChitCard({required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              amount,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChitDetailScreen extends StatelessWidget {
  final String title;
  final String amount;

  ChitDetailScreen({required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Amount: $amount",
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
