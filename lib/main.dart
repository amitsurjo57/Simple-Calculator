import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Surjo",
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.cyanAccent.shade100),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => Homapagestate();
}

class Homapagestate extends State<Homepage> {
  var a = TextEditingController();
  var b = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  var result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.cyanAccent.shade100,
              Colors.white54,
            ],
            begin: const FractionalOffset(0.0, 0.1),
            end: const FractionalOffset(1.0, 1.1),
            stops: const [0.0, 1.0],
          ),
        ),
        child: Center(
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    child: Text(
                      "Simple Calculator",
                      style: TextStyle(
                        fontSize: 25,
                        decoration: TextDecoration.underline,
                        fontFamily: "Schuyler",
                      ),
                    ),
                  ),
                ),
                _buildTextFormFields(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _onAddOperation(),
                    _onSubstractOperation(),
                    _onMultiplicationOperation(),
                    _onDivideOperation(),
                  ],
                ),
                _buildResult(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 150,
          child: TextFormField(
            controller: a,
            validator: (String? validator) {
              if (validator == null || validator.isEmpty) {
                return "Enter first number";
              }
              return null;
            },
            style: const TextStyle(fontSize: 16),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: const Text(
                "Enter first number: ",
                style: TextStyle(fontSize: 12),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: TextFormField(
            controller: b,
            validator: (String? validator) {
              if (validator == null || validator.isEmpty) {
                return "Enter second\nnumber";
              }
              return null;
            },
            style: const TextStyle(fontSize: 16),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: const Text(
                "Enter second number: ",
                style: TextStyle(fontSize: 12),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResult() {
    return Text(
      "Result: ${result.toStringAsFixed(2)}",
      style: const TextStyle(fontSize: 30),
    );
  }

  SizedBox _onDivideOperation() {
    return SizedBox(
      height: 50,
      width: 80,
      child: ElevatedButton(
        onPressed: () {
          if (_globalKey.currentState!.validate()) {
            var ai = double.tryParse(a.text.toString()) ?? 0;
            var bi = double.tryParse(b.text.toString()) ?? 0;

            result = ai / bi;
            setState(() {});
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyanAccent.shade100,
        ),
        child: const Text(
          "/",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
    );
  }

  SizedBox _onMultiplicationOperation() {
    return SizedBox(
      height: 50,
      width: 80,
      child: ElevatedButton(
        onPressed: () {
          if (_globalKey.currentState!.validate()) {
            var ai = double.tryParse(a.text.toString()) ?? 0;
            var bi = double.tryParse(b.text.toString()) ?? 0;

            result = ai * bi;
            setState(() {});
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyanAccent.shade100,
        ),
        child: const Text(
          "X",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  SizedBox _onSubstractOperation() {
    return SizedBox(
      height: 50,
      width: 80,
      child: ElevatedButton(
        onPressed: () {
          if (_globalKey.currentState!.validate()) {
            var ai = double.tryParse(a.text.toString()) ?? 0;
            var bi = double.tryParse(b.text.toString()) ?? 0;

            result = ai - bi;
            setState(() {});
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyanAccent.shade100,
        ),
        child: const Text(
          "-",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  SizedBox _onAddOperation() {
    return SizedBox(
      height: 50,
      width: 80,
      child: ElevatedButton(
        onPressed: () {
          if (_globalKey.currentState!.validate()) {
            var ai = double.tryParse(a.text.toString()) ?? 0;
            var bi = double.tryParse(b.text.toString()) ?? 0;

            result = ai + bi;
            setState(() {});
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyanAccent.shade100,
        ),
        child: const Text(
          "+",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    a.dispose();
    b.dispose();
    super.dispose();
  }
}
