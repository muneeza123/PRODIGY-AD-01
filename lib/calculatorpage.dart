import "package:flutter/material.dart";
import 'calculationsClass.dart';
import 'result.dart'; // Ensure the path is correct

class Calculatorpage extends StatefulWidget {
  @override
  State<Calculatorpage> createState() => _CalculatorpageState();
}

class _CalculatorpageState extends State<Calculatorpage> {
  String _displayText = '0'; // State variable to hold the display text
  String _operation = ''; // To hold the selected operation
  double _firstNumber = 0; // To hold the first number in the operation
  double _secondNumber = 0; // To hold the second number in the operation

  void _updateDisplay(String value) {
    setState(() {
      if (value == 'C') {
        _clearDisplay();
      } else if (value == '+' || value == '-' || value == 'x' || value == '/') {
        _firstNumber = double.parse(_displayText); // Save the first number
        _operation = value; // Save the operation
        _displayText = ''; // Clear display for the second number
      } else if (value == '=') {
        _secondNumber = double.parse(_displayText); // Save the second number
        _calculateResult(); // Perform the calculation
      } else {
        if (_displayText == '0' || _displayText == '') {
          _displayText = value; // Replace initial '0' or empty string with the first input
        } else {
          _displayText += value; // Concatenate new input to existing value
        }
      }
    });
  }

  void _clearDisplay() {
    setState(() {
      _displayText = '0'; // Clear the display
      _operation = ''; // Clear the operation
      _firstNumber = 0; // Reset the first number
      _secondNumber = 0; // Reset the second number
    });
  }

  void _calculateResult() {
    setState(() {
      double result = 0;

      switch (_operation) {
        case '+':
          result = _firstNumber + _secondNumber;
          break;
        case '-':
          result = _firstNumber - _secondNumber;
          break;
        case 'x':
          result = _firstNumber * _secondNumber;
          break;
        case '/':
          result = _firstNumber / _secondNumber;
          break;
        default:
          result = 0;
          break;
      }

      _displayText = result.toString(); // Display the result
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings, color: Colors.orange),
        title: Text(
          "CALCULATOR APP",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
        actions: [Icon(Icons.more_horiz)],
      ),
  
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            DisplayResult(text: _displayText),
            SizedBox(height: 10), // Spacing between display and buttons

            // First Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '7',
                  onTap: () => _updateDisplay('7'),
                ),
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '8',
                  onTap: () => _updateDisplay('8'),
                ),
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '9',
                  onTap: () => _updateDisplay('9'),
                ),
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: 'x',
                  onTap: () => _updateDisplay('x'),
                ),
              ],
            ),

            // Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '4',
                  onTap: () => _updateDisplay('4'),
                ),
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '5',
                  onTap: () => _updateDisplay('5'),
                ),
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '6',
                  onTap: () => _updateDisplay('6'),
                ),
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '-',
                  onTap: () => _updateDisplay('-'),
                ),
              ],
            ),

            // Third Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '1',
                  onTap: () => _updateDisplay('1'),
                ),
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '2',
                  onTap: () => _updateDisplay('2'),
                ),
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '3',
                  onTap: () => _updateDisplay('3'),
                ),
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '+',
                  onTap: () => _updateDisplay('+'),
                ),
              ],
            ),

            // Fourth Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '=',
                  onTap: () => _updateDisplay('='),
                ),
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '0',
                  onTap: () => _updateDisplay('0'),
                ),
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: 'C',
                  onTap: () => _updateDisplay('C'),
                ),
                Calculations(
                  BackgroundColor: Colors.grey,
                  labelColor: Colors.white,
                  label: '/',
                  onTap: () => _updateDisplay('/'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
