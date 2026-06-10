import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = "0";

  double firstNumber = 0;
  String operation = "";

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        display = "0";
        firstNumber = 0;
        operation = "";
      } else if (value == "+" || value == "-" || value == "*" || value == "/") {
        firstNumber = double.parse(display);
        operation = value;
        display = "0";
      } else if (value == "=") {
        double secondNumber = double.parse(display);
        double result = 0;

        switch (operation) {
          case "+":
            result = firstNumber + secondNumber;
            break;

          case "-":
            result = firstNumber - secondNumber;
            break;

          case "*":
            result = firstNumber * secondNumber;
            break;

          case "/":
            result = firstNumber / secondNumber;
            break;
        }

        display = result.toString();
      } else {
        if (display == "0") {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }

  Widget calcButton(String text, Color color) {
    return GestureDetector(
      onTap: () => buttonPressed(text),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                display,
                style: const TextStyle(color: Colors.white, fontSize: 70),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton("7", Colors.grey.shade800),
                calcButton("8", Colors.grey.shade800),
                calcButton("9", Colors.grey.shade800),
                calcButton("/", Colors.blueAccent),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton("4", Colors.grey.shade800),
                calcButton("5", Colors.grey.shade800),
                calcButton("6", Colors.grey.shade800),
                calcButton("*", Colors.blueAccent),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton("1", Colors.grey.shade800),
                calcButton("2", Colors.grey.shade800),
                calcButton("3", Colors.grey.shade800),
                calcButton("-", Colors.blueAccent),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcButton("0", Colors.grey.shade800),
                calcButton("C", Colors.red),
                calcButton("=", Colors.blueAccent),
                calcButton("+", Colors.blueAccent),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
