import 'dart:math';

import 'package:bmi_calculator/ui/bmi_result.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = false;
  double height = 120.0;
  double weight = 60.0;
  int age = 15;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            isMale = !isMale;
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              isMale == true ? Colors.pink : Colors.grey[300],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              color:
                                  isMale == true ? Colors.white : Colors.black,
                              image: const AssetImage('assets/images/male.png'),
                              width: 90,
                              height: 90,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                color: isMale == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            isMale = !isMale;
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isMale ? Colors.pink : Colors.grey[300],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image:
                                  const AssetImage('assets/images/female.png'),
                              width: 90,
                              height: 90,
                              fit: BoxFit.contain,
                              color:
                                  !isMale == true ? Colors.white : Colors.black,
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                color: !isMale == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          '$height',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Slider(
                      activeColor: Colors.pink,
                      inactiveColor: Colors.grey,
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value.roundToDouble();
                        });
                      },
                      min: 80,
                      max: 220,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'weight',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$weight',
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                shape: const CircleBorder(),
                                backgroundColor: Colors.pink,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,
                                heroTag: 'weight++',
                                child: const Icon(
                                  Icons.add,
                                  size: 28,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.03,
                              ),
                              FloatingActionButton(
                                shape: const CircleBorder(),
                                backgroundColor: Colors.pink,
                                onPressed: () {
                                  setState(() {
                                    if (weight <= 0) {
                                      weight = 0;
                                    } else {
                                      weight--;
                                    }
                                  });
                                },
                                mini: true,
                                heroTag: 'weight--',
                                child: const Icon(
                                  Icons.remove,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$age',
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                shape: const CircleBorder(),
                                backgroundColor: Colors.pink,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                mini: true,
                                heroTag: 'age++',
                                child: const Icon(
                                  Icons.add,
                                  size: 28,
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.03,
                              ),
                              FloatingActionButton(
                                shape: const CircleBorder(),
                                backgroundColor: Colors.pink,
                                onPressed: () {
                                  setState(() {
                                    if (age <= 0) {
                                      age = 0;
                                    } else {
                                      age--;
                                    }
                                  });
                                },
                                mini: true,
                                heroTag: 'age--',
                                child: const Icon(
                                  Icons.remove,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.70,
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                result = (weight / pow(height / 100, 2));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => BmiResultScreen(
                            result: result, age: age, gender: isMale)));
              },
              child: const Text(
                'Calculate',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
