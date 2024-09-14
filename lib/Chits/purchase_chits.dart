import 'package:flutter/material.dart';

class SelectedChit extends StatelessWidget {
  const SelectedChit({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
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
        actions: const [
          Icon(
            Icons.file_open_sharp,
            size: 35,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          )
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
            displayofmonthandothers(
                size, '12', '10.07.2024', '10.07.2024', '10', '4215'),
            const SizedBox(
              height: 20,
            ),
            // Table added below the chit info
            buildPaymentTable(size),
          ],
        ),
      ),
    );
  }

  Container displayofmonthandothers(Size size, String month, String startdate,
      String enddate, String totalinvestors, String brokerage) {
    return Container(
      height: size.height / 3,
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blueAccent, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$month months chit',
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 30,
              height: 19 / 24,
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Chit Amount :',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 22 / 15,
                  color: Color.fromRGBO(255, 255, 255, 0.7),
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.currency_rupee_outlined,
                size: 28,
                color: Colors.white,
              ),
              Text(
                '1,00,000',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    height: 22 / 15,
                    color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'Start date',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      height: 22 / 15,
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                  ),
                  Text(
                    startdate,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        height: 22 / 15,
                        color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'End date',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      height: 22 / 15,
                      color: Color.fromRGBO(255, 255, 255, 0.7),
                    ),
                  ),
                  Text(
                    enddate,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        height: 22 / 15,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Total Investors :',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  height: 22 / 15,
                  color: Color.fromRGBO(255, 255, 255, 0.7),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                totalinvestors,
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: 22 / 15,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Brokerage :',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  height: 22 / 15,
                  color: Color.fromRGBO(255, 255, 255, 0.7),
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
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: 22 / 15,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPaymentTable(Size size) {
    return Container(
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent, // Border color
          width: 2, // Border width
        ),
        borderRadius: BorderRadius.circular(15), // Curved corners
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15), // Ensure rounded corners
        child: Table(
          border: TableBorder(
            horizontalInside: BorderSide(color: Colors.blueAccent, width: 1),
            verticalInside: BorderSide(color: Colors.blueAccent, width: 1),
            bottom: BorderSide
                .none, // No border at the bottom, managed by the Container
          ),
          columnWidths: {
            0: FixedColumnWidth(55),
            1: FixedColumnWidth(100),
            2: FixedColumnWidth(100),
            3: FixedColumnWidth(90),
          },
          children: [
            _buildTableHeader(),
            _buildTableRow("1", "10.07.2024", "₹ 10,000", "Paid", Colors.green),
            _buildTableRow("2", "10.07.2024", "₹ 10,000", "Pay", Colors.blue),
            for (var i = 3; i <= 12; i++)
              _buildTableRow(i.toString(), "10.07.2024", "₹ 10,000", "Upcoming",
                  Colors.red),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      children: [
        _buildHeaderCell("Month", isFirst: true, isRotated: true),
        // Rotate "Month" header
        _buildHeaderCell("Dates"),
        _buildHeaderCell("Payment"),
        _buildHeaderCell("Status", isLast: true),
      ],
    );
  }

  Widget _buildHeaderCell(String text,
      {bool isFirst = false, bool isLast = false, bool isRotated = false}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(46, 167, 255, 0.25), // Background color
        borderRadius: BorderRadius.only(
          topLeft: isFirst ? const Radius.circular(22) : Radius.zero,
          topRight: isLast ? const Radius.circular(22) : Radius.zero,
          bottomRight: isLast ? const Radius.circular(22) : Radius.zero,
          bottomLeft: isFirst ? const Radius.circular(22) : Radius.zero,
        ),
        border: Border.all(
          color: Colors.blueAccent, // Border color
          width: 1, // Border width
        ),
      ),
      child: Center(
        // Ensure text is centered within the container
        child: isRotated
            ? RotatedBox(
                quarterTurns: 1, // Rotate the text 90 degrees
                child: SizedBox(
                  height: 50,
                  width: 50, // Width for rotated text
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : SizedBox(
                height: 50,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }

  TableRow _buildTableRow(String month, String date, String payment,
      String status, Color statusColor) {
    return TableRow(
      children: [
        _buildTableCell(month),
        _buildTableCell(date),
        _buildTableCell(payment),
        _buildTableCell(status,
            statusColor: statusColor, isButton: status == "Pay"),
      ],
    );
  }

  Widget _buildTableCell(String text,
      {bool isHeader = false, Color? statusColor, bool isButton = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      child: isButton
          ? SizedBox(
              width: 80, // Adjust width as needed
              height: 25, // Adjust height as needed
              child: TextButton(
                onPressed: () {
                  // Define the action for the button press here
                  print('Pay button pressed');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent, // Text color
                  padding: EdgeInsets.zero, // Remove default padding
                ),
                child: const Text(
                  'Pay',
                  style: TextStyle(
                    fontSize: 14, // Adjust font size as needed
                  ),
                ),
              ),
            )
          : RotatedBox(
              quarterTurns: 0,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                  fontSize: isHeader ? 18 : 14,
                  color: statusColor ?? Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
