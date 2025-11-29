import 'package:flutter/material.dart';
import 'dart:math';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainPage> {
  bool isMale = true;
  double height = 150;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.purpleAccent.shade100,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // ===== SEX SELECTOR =====
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => isMale = true);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: isMale ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: const [
                            Icon(Icons.male, size: 100),
                            Text("Male", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => isMale = false);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: !isMale ? Colors.pink : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: const [
                            Icon(Icons.female, size: 100),
                            Text("Female", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ===== HEIGHT SLIDER =====
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${height.toInt()} cm",
                      style:
                          const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Slider(
                      value: height,
                      min: 80,
                      max: 220,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ===== WEIGHT & AGE =====
              Row(
                children: [
                  // ----- Weight -----
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Text("Weight",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(
                            "$weight",
                            style: const TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: "w--",
                                mini: true,
                                onPressed: () {
                                  setState(() => weight--);
                                },
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 15),
                              FloatingActionButton(
                                heroTag: "w++",
                                mini: true,
                                onPressed: () {
                                  setState(() => weight++);
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  // ----- Age -----
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Text("Age",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(
                            "$age",
                            style: const TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: "a--",
                                mini: true,
                                onPressed: () {
                                  setState(() => age--);
                                },
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 15),
                              FloatingActionButton(
                                heroTag: "a++",
                                mini: true,
                                onPressed: () {
                                  setState(() => age++);
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              //  CALCULATE BUTTON 
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
                  onPressed: () {
                    double bmi = weight / pow(height / 100, 2);

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Your BMI Result"),
                        content: Text(
                          "BMI: ${bmi.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "CALCULATE",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
