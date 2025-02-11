import 'package:flox/Lakh_chits.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

class ChitsInvestment extends StatefulWidget {
  const ChitsInvestment({super.key});

  @override
  State<ChitsInvestment> createState() => _ChitsInvestmentState();
}

class _ChitsInvestmentState extends State<ChitsInvestment> {
  // List<ChitAmount> users = [];

  @override
  void initState() {
    super.initState();
  }

  // Future<void> fetchData() async {
  //   const url = 'https://example.com/data'; // Replace with your actual URL
  //   final uri = Uri.parse(url);
  //   try {
  //     final response = await http.get(uri);
  //     if (response.statusCode == 200) {
  //       final body = response.body;
  //       final json = jsonDecode(body);
  //
  //       if (json['data'] is List<dynamic>) {
  //         final result = json['data'] as List<dynamic>;
  //
  //         final transform = result.map((e) {
  //           final lineChart = Linecharts(
  //             amount: e['linechart'],
  //             month: e['month'],
  //           );
  //           return ChitAmount(
  //               acbalance: e['acbalance'],
  //               brokerage: e['brokerage'],
  //               investmentamount: e['investmentamount'],
  //               linechart: lineChart,
  //               month: e['month'],
  //               startdate: e['startdate'],
  //               totalinvestor: e['totalinvestor'],
  //               enddata: e['enddate']
  //           );
  //         }).toList();
  //
  //         setState(() {
  //           users = transform;
  //         });
  //       } else {
  //         throw Exception('Unexpected JSON format');
  //       }
  //     } else {
  //       throw Exception('Failed to load data');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'CHITS',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 27,
            height: 37 / 27,
            color: Colors.white,
          ),
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
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: size.height / 1.8,
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.width * 0.020,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        'Account Balance',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.05,
                          height: 37 / 27,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Icon(
                        Icons.currency_rupee_outlined,
                        size: size.width * 0.06,
                        color: Colors.black,
                      ),
                      Text(
                        '3,000',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.06,
                          height: 37 / 27,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        'Last 12 months',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.03,
                          height: 37 / 27,
                          color: Colors.grey.shade600,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: LineChartWidget(
                      height: size.height,
                      width: size.width,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Investment Details',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  height: 34 / 23,
                  color: Colors.white,
                ),
              ),
            ),
            investment(size, '1 lakh Investment', () {
              _Investmenttypefor1lakh(context);
            }),
            const SizedBox(
              height: 5,
            ),
            investment(size, '2 lakh Investment', () {
              _Investmenttypefor2lakh(context);
            }),
            const SizedBox(
              height: 5,
            ),
            investment(size, '5 lakh Investment', () {
              _Investmenttypefor5lakh(context);
            }),
          ],
        ),
      ),
    );
  }

  GestureDetector investment(Size size, String text, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height / 14,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                height: 22 / 15,
                color: Color(0Xff2514A6),
              ),
            ),
            const Icon(
              Icons.play_arrow_rounded,
              size: 30,
              color: Color(0Xff2514A6),
            )
          ],
        ),
      ),
    );
  }

  void _Investmenttypefor1lakh(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const Investmenttypefor1lakh(),
    );
  }

  void _Investmenttypefor2lakh(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const Investmenttypefor2lakh(),
    );
  }

  void _Investmenttypefor5lakh(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const Investmenttypefor5lakh(),
    );
  }
}

class LineChartWidget extends StatefulWidget {
  final double height;
  final double width;

  const LineChartWidget({super.key, required this.height, required this.width});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<String> month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height * 0.4,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: widget.width * 1.5,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                show: true,
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: widget.width * 0.06,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < month.length) {
                        return Text(
                          month[index],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              maxX: 12,
              maxY: 10,
              minX: 0,
              minY: 0,
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  color: Colors.black,
                  barWidth: 3,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  spots: const [
                    FlSpot(0, 2),
                    FlSpot(1, 4),
                    FlSpot(2, 6),
                    FlSpot(3, 7),
                    FlSpot(4, 5),
                    FlSpot(5, 6),
                    FlSpot(6, 7),
                    FlSpot(7, 5),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Investmenttypefor1lakh extends StatefulWidget {
  const Investmenttypefor1lakh({super.key});

  @override
  State<Investmenttypefor1lakh> createState() => _Investmenttypefor1lakh();
}

class _Investmenttypefor1lakh extends State<Investmenttypefor1lakh> {
  String groupValue = 'Total Amount';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Months',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  height: 42 / 28,
                  color: Color(0Xff2514A6),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numbers('12', () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const lakhchits(
                      amount_val: 1,
                    )));
              }),
              numbers('24', () {}),
              numbers('36', () {}),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector numbers(String number, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 80,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0Xff161E67),
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 33,
              height: 49 / 33,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class Investmenttypefor2lakh extends StatefulWidget {
  const Investmenttypefor2lakh({super.key});

  @override
  State<Investmenttypefor2lakh> createState() => _Investmenttypefor2lakh();
}

class _Investmenttypefor2lakh extends State<Investmenttypefor2lakh> {
  String groupValue = 'Total Amount';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Months',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  height: 42 / 28,
                  color: Color(0Xff2514A6),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numbers('12', () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const lakhchits(
                      amount_val: 2,
                    )));
              }),
              numbers('24', () {}),
              numbers('36', () {}),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector numbers(String number, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 80,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0Xff161E67),
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 33,
              height: 49 / 33,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class Investmenttypefor5lakh extends StatefulWidget {
  const Investmenttypefor5lakh({super.key});

  @override
  State<Investmenttypefor5lakh> createState() => _Investmenttypefor5lakh();
}

class _Investmenttypefor5lakh extends State<Investmenttypefor5lakh> {
  String groupValue = 'Total Amount';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Months',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  height: 42 / 28,
                  color: Color(0Xff2514A6),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numbers('12', () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const lakhchits(
                      amount_val: 5,
                    ))
                    );
              }),
              numbers('24', () {}),
              numbers('36', () {}),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector numbers(String number, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 80,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0Xff161E67),
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 33,
              height: 49 / 33,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
