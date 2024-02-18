import 'package:flutter/material.dart';
import 'package:urtripo/Screens/PaymentScreen.dart';

class SeatSelectionScreen extends StatefulWidget {
  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  List<String> selectedSeats = []; // List to store selected seats
  List<String> emergencyExitSeats = [
    'G1',
    'H3',
    'K2',
    'L4'
  ]; // Sample emergency exit seats

  // Function to handle seat selection
  void selectSeat(String seatNumber) {
    setState(() {
      if (selectedSeats.contains(seatNumber)) {
        selectedSeats.remove(seatNumber); // Deselect seat
      } else {
        selectedSeats.add(seatNumber); // Select seat
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Select yor Seats',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(backgroundColor: Colors.green, radius: 10),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Selected Seats',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  CircleAvatar(backgroundColor: Colors.orange, radius: 10),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Emergency Exits',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  CircleAvatar(backgroundColor: Colors.grey, radius: 10),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Available Seats',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, // Number of columns
                  childAspectRatio: 1.0, // Aspect ratio of grid items
                ),
                itemCount: 72, // Total number of seats
                itemBuilder: (BuildContext context, int index) {
                  if ((index + 2) % 3 == 0 && index != 0) {
                    return Row(
                      children: [
                        Expanded(
                          child: SizedBox.shrink(), // Inserting empty space
                        ),
                      ],
                    );
                  }
                  String seatNumber = String.fromCharCode(65 + (index ~/ 4)) +
                      "${index % 4 + 1}"; // Generating seat numbers
                  bool isSelected = selectedSeats.contains(seatNumber);
                  bool isEmergencyExit =
                      emergencyExitSeats.contains(seatNumber);

                  return GestureDetector(
                    onTap: () {
                      selectSeat(seatNumber);
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.green
                            : isEmergencyExit
                                ? Colors.orange
                                : Colors.grey,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          seatNumber,
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PaymentScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: Size(350, 60)),
                  child: Text(
                    'Confrim',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
