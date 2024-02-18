import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:urtripo/Screens/MenuScreen.dart';
import 'package:urtripo/Screens/SearchResult.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController depatureController = TextEditingController();
  TextEditingController returnController = TextEditingController();
  String selectedButton = 'On Way';
  String selectedDropdownValue = 'Passangers';
  int numberOfWomen = 0;
  int numberOfMen = 0;
  int numberOfChildren = 0;
  int clickCount = 0; // Track the number of button clicks
  int fieldsToAdd = 4; // Number of fields to add each time
  List<String> dropdownItems = [
    'Passangers',
    '1Male',
    '1Female',
    'More than one'
  ];
  String selectedClassDropdownValue = 'Class';
  List<String> classDropdownItems = [
    'Class',
    'Economy',
    'Business',
    'First Class'
  ];

  List<Widget> additionalWidgets = [];
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.toLocal().toLocal().toString().split(' ')[0];
      });
    }
  }

  void _additionTextFeilds(int count) {
    setState(() {
      for (int i = 0; i < count; i++) {
        additionalWidgets.add(Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 400,
              height: 50.0,
              child: TextField(
                controller: fromController,
                decoration: InputDecoration(
                  labelText: 'From',
                  prefixIcon: Icon(
                    Icons.flight,
                    color: Colors.deepPurple.shade900,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 400,
              height: 50.0,
              child: TextField(
                controller: toController,
                decoration: InputDecoration(
                  labelText: 'To',
                  prefixIcon: Icon(
                    Icons.flight,
                    color: Colors.deepPurple.shade900,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      _selectDate(context, depatureController);
                    },
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Set the border color
                            width: 2.0, // Set the border width
                          ),
                          borderRadius: BorderRadius.circular(
                              10), // Optional: Set border radius
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.deepPurple.shade900,
                              ),
                            ),
                            Text(
                              depatureController.text.isEmpty
                                  ? 'Departure Date'
                                  : depatureController.text,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (selectedButton != 'On Way')
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        _selectDate(context, returnController);
                      },
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey, // Set the border color
                              width: 2.0, // Set the border width
                            ),
                            borderRadius: BorderRadius.circular(
                                10), // Optional: Set border radius
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Colors.deepPurple.shade900,
                                ),
                              ),
                              Text(
                                returnController.text.isEmpty
                                    ? 'Return Date'
                                    : returnController.text,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          )
        ]));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                  top: 70,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MenuBarScreen()));
                            },
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Booking Flight',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.deepPurple.shade900.withOpacity(0.4),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(70),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildTextButton('On Way'),
                            buildTextButton('Round Trip'),
                            buildTextButton('Multicity'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurple.shade900
                                      .withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: 400,
                                    height: 50.0,
                                    child: TextField(
                                      controller: fromController,
                                      decoration: InputDecoration(
                                        labelText: 'From',
                                        prefixIcon: Icon(
                                          Icons.flight,
                                          color: Colors.deepPurple.shade900,
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: 400,
                                    height: 50.0,
                                    child: TextField(
                                      controller: toController,
                                      decoration: InputDecoration(
                                        labelText: 'To',
                                        prefixIcon: Icon(
                                          Icons.flight,
                                          color: Colors.deepPurple.shade900,
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: InkWell(
                                          onTap: () {
                                            _selectDate(
                                                context, depatureController);
                                          },
                                          child: Container(
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors
                                                      .grey, // Set the border color
                                                  width:
                                                      2.0, // Set the border width
                                                ),
                                                borderRadius: BorderRadius.circular(
                                                    10), // Optional: Set border radius
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Icon(
                                                      Icons.calendar_today,
                                                      color: Colors
                                                          .deepPurple.shade900,
                                                    ),
                                                  ),
                                                  Text(
                                                    depatureController
                                                            .text.isEmpty
                                                        ? 'Departure Date'
                                                        : depatureController
                                                            .text,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (selectedButton != 'On Way')
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: InkWell(
                                            onTap: () {
                                              _selectDate(
                                                  context, returnController);
                                            },
                                            child: Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors
                                                        .grey, // Set the border color
                                                    width:
                                                        2.0, // Set the border width
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10), // Optional: Set border radius
                                                ),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Icon(
                                                        Icons.calendar_today,
                                                        color: Colors.deepPurple
                                                            .shade900,
                                                      ),
                                                    ),
                                                    Text(
                                                      returnController
                                                              .text.isEmpty
                                                          ? 'Return Date'
                                                          : returnController
                                                              .text,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                if (selectedButton == 'Multicity')
                                  displayAdditionalWidgets(),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text('Select Passangers :',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors
                                                  .grey, // Set the border color
                                              width:
                                                  2.0, // Set the border width
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: DropdownButton<String>(
                                              value: selectedDropdownValue,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedDropdownValue =
                                                      newValue!;
                                                  numberOfWomen = 0;
                                                  numberOfMen = 0;
                                                  numberOfChildren = 0;
                                                });
                                              },
                                              items: dropdownItems
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Center(
                                                    child: Text(
                                                      value,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child:
                                              Text('Select Class            :',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors
                                                  .grey, // Set the border color
                                              width:
                                                  2.0, // Set the border width
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: DropdownButton<String>(
                                              value: selectedClassDropdownValue,
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedClassDropdownValue =
                                                      newValue!;
                                                });
                                              },
                                              items: classDropdownItems
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                if (selectedDropdownValue ==
                                    'More than one') // Show additional TextFields conditionally
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: 'Number of Women',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                numberOfWomen =
                                                    int.tryParse(value) ?? 0;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: 'Number of Men',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                numberOfMen =
                                                    int.tryParse(value) ?? 0;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: 'No.of Children',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                numberOfChildren =
                                                    int.tryParse(value) ?? 0;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchScreen()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.deepPurple.shade900,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          minimumSize: Size(350, 60)),
                                      child: Text(
                                        'Search',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 35,
                            right: 30,
                            child: CircularButton(
                              onPressed: () {
                                swapTextFieldsContent();
                              },
                              icon: Icons.swap_vert,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (selectedButton != 'On Way' &&
                          selectedButton != 'Round Trip')
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 300,
                          ),
                          child: FloatingActionButton(
                            onPressed: () {
                              clickCount++; // Increment click count

                              _additionTextFeilds(fieldsToAdd * clickCount);
                            },
                            child: Icon(Icons.add),
                            tooltip: 'Add',
                          ),
                        ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 1,
                        width: 500,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hot Offer',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'See All',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple.shade900),
                              )),
                        ],
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 120.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 2),
                        ),
                        items: [
                          CarouselItem(
                            imageUrl: 'assets/mastercard-logo.png',
                            text: '15% Discount\nfor Master-Card\nSee more...',
                            color: Color.fromARGB(255, 206, 168, 110),
                            offer: '15% Discount',
                          ),
                          CarouselItem(
                            imageUrl: 'assets/visha.png',
                            text: '23% Discount\nfor Master-Card\nSee more...',
                            color: Color.fromARGB(255, 101, 109, 152),
                            offer: '23% Discount',
                          ),
                        ],
                      ),
                      
                    ]))),
      ),
    );
  }

  Widget buildTextButton(String buttonText) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedButton = buttonText;
        });
      },
      style: ButtonStyle(
        backgroundColor: selectedButton == buttonText
            ? MaterialStateProperty.all(Colors.deepPurple.shade900)
            : null,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
            fontSize: 16,
            color: selectedButton == buttonText ? Colors.white : null),
      ),
    );
  }

  Widget displayAdditionalWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: additionalWidgets,
    );
  }

  Future<bool> _onWillPop() async {
    if (clickCount > 0) {
      setState(() {
        _removeAdditionalWidgets(fieldsToAdd * clickCount);
        clickCount--;
      });
      return false;
    }
    return true;
  }

  void _removeAdditionalWidgets(int count) {
    setState(() {
      if (additionalWidgets.length >= count) {
        for (int i = 0; i < count; i++) {
          additionalWidgets.removeLast();
        }
      }
    });
  }

  void swapTextFieldsContent() {
    String fromText = fromController.text;
    fromController.text = toController.text;
    toController.text = fromText;
  }
}

class CarouselItem extends StatelessWidget {
  final String imageUrl;
  final String text;
  final color;
  final String offer;

  const CarouselItem(
      {required this.imageUrl,
      required this.text,
      required this.color,
      required this.offer});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.shade900.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    imageUrl,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    offer,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            SizedBox(width: 10.0),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const CircularButton({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.deepPurple.shade900, // Set the border color
            width: 2.0, // Set the border width
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.deepPurple.shade900,
          ),
        ),
      ),
    );
  }
}
