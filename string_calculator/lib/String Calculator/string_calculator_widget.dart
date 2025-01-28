import 'package:flutter/material.dart';
import 'package:string_calculator/String%20Calculator/string_calculator.dart';

class StringCalculatorWidget extends StatefulWidget {
  const StringCalculatorWidget({super.key});

  @override
  State<StringCalculatorWidget> createState() => _StringCalculatorWidgetState();
}

class _StringCalculatorWidgetState extends State<StringCalculatorWidget> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  final TextEditingController _delimiterController = TextEditingController();
  final StringCalculator _stringCalculator = StringCalculator();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('String Calculator'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: _inputController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Input Text'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _delimiterController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Delimiter',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: TextFormField(
                    controller: _outputController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Result',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      try {
                        int res = _stringCalculator.findDigitsSum(_inputController.text, _delimiterController.text);
                        setState(() {
                          _outputController.text = res.toString();
                        });
                      } catch (e) {
                        if (e is FormatException) {
                          _showDialogBox(context, e.message);
                        } else {
                          _showDialogBox(context, 'An unknown error occurred.');
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialogBox(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error!'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _outputController.text = '';
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
}
