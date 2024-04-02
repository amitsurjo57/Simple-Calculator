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
  var result = "0";

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                child: Text(
                  "Simple Calculator",
                  style: TextStyle(
                    fontSize: 30,
                    decoration: TextDecoration.underline,
                    fontFamily: "Schuyler",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: a,
                      style: const TextStyle(fontSize: 25),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: const Text(
                          "Enter a number: ",
                          style: TextStyle(fontSize: 15),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: b,
                      style: const TextStyle(fontSize: 25),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: const Text(
                          "Enter a number: ",
                          style: TextStyle(fontSize: 15),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        var ai = double.parse(a.text.toString());
                        var bi = double.parse(b.text.toString());

                        result = "${ai + bi}";
                        setState(() {});
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
                  ),
                  SizedBox(
                    height: 50,
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        var ai = double.parse(a.text.toString());
                        var bi = double.parse(b.text.toString());

                        result = "${ai - bi}";
                        setState(() {});
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
                  ),
                  SizedBox(
                    height: 50,
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        var ai = double.parse(a.text.toString());
                        var bi = double.parse(b.text.toString());

                        result = "${ai * bi}";
                        setState(() {});
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
                  ),
                  SizedBox(
                    height: 50,
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        var ai = double.parse(a.text.toString());
                        var bi = double.parse(b.text.toString());

                        result = "${ai / bi}";
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyanAccent.shade100,
                      ),
                      child: const Text(
                        "/",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Result: $result",
                style: const TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
