import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var operator = '';
  var text = '0';

  clickNum(value) {
    setState(() {
      if (text == '0' || text == 'Infinity') {
        text = value.toString();
      } else {
        text += value.toString();
      }
    });
  }

  setOperator(newOperator) {
    setState(() {
      if (operator != '') {
        calculate();
        text += newOperator.toString();
        operator = newOperator;
      } else {
        text += newOperator.toString();
        operator = newOperator;
      }
    });
  }

  calculate() {
    var data = text.split(operator);

    var number1 = data[0];
    var number2 = data[1];

    setState(() {
      switch(operator) {
        case '*':
          text = (double.parse(number1) * double.parse(number2)).toStringAsFixed(1);
          break;
        case '/':
          text = (double.parse(number1) / double.parse(number2)).toStringAsFixed(1);
          break;
        case '-':
          text = (double.parse(number1) - double.parse(number2)).toStringAsFixed(1);
          break;
        case '+':
          text = (double.parse(number1) + double.parse(number2)).toStringAsFixed(1);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double screenSize = 390;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            style: TextStyle(
                fontFamily: 'Arial Rounded MT Bold',
                fontWeight: FontWeight.bold),
      ("Simple Calculator")),
      ),
      body: Container(
        height: 1000,
        child: Column(
          children: [
            Container(
                color: Colors.black26,
                height: 200,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 85,
                        fontFamily: 'Bahnschrift Light',
                      ),
                    ),
                  ],
                )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              color: Colors.brown,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: CalcuBttn(
                            color: Colors.white60,
                            onTap: () {
                              clickNum(7);
                            },
                            text: "7",
                          )
                      ),
                      Expanded(
                          child: CalcuBttn(
                              color: Colors.white60,
                            onTap: () {
                              clickNum(8);
                            },
                            text: "8",
                          )
                      ),
                      Expanded(
                          child: CalcuBttn(
                              color: Colors.white60,
                            onTap: () {
                              clickNum(9);
                            },
                            text: "9",
                          )
                      ),
                      Expanded(
                          child: CalcuBttn(
                            color: Colors.white,
                            onTap: () {
                              setOperator('-');
                            },
                            text: "-",
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcuBttn(
                            color: Colors.white60,
                            onTap: () {
                              clickNum(4);
                            },
                            text: "4",
                          )
                      ),
                      Expanded(
                          child: CalcuBttn(
                            color: Colors.white60,
                            onTap: () {
                              clickNum(5);
                            },
                            text: "5",
                          )
                      ),
                      Expanded(
                          child: CalcuBttn(
                            color: Colors.white60,
                            onTap: () {
                              clickNum(6);
                            },
                            text: "6",
                          )
                      ),
                      Expanded(
                          child: CalcuBttn(
                            textColor: Colors.black,
                            color: Colors.white,
                            onTap: () {
                              setOperator('*');
                            },
                            text: "*",
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcuBttn(
                            color: Colors.white60,
                            onTap: () {
                              clickNum(1);
                            },
                            text: "1",
                          )
                      ),

                      Expanded(
                          child: CalcuBttn(
                            color: Colors.white60,
                            onTap: () {
                              clickNum(2);
                            },
                            text: "2",
                          )
                      ),
                      Expanded(
                          child: CalcuBttn(
                            color: Colors.white60,
                            onTap: () {
                              clickNum(3);
                            },
                            text: "3",
                          )
                      ),
                      Expanded(
                          child: CalcuBttn(
                            textColor: Colors.black,
                            color: Colors.white,
                            onTap: () {
                              setOperator('+');
                            },
                            text: "+",
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcuBttn(
                            textColor: Colors.white,
                            color: Colors.orange,
                            onTap: () {
                              setState(() {
                                text = '0';
                                operator = '';
                              });
                            },
                            text: "CE",
                          )
                      ),
                      Expanded(
                          child: CalcuBttn(
                            color: Colors.white60,
                            onTap: () {
                              clickNum(0);
                            },
                            text: "0",
                          )
                      ),
                      Expanded(
                          child: CalcuBttn(
                            color: Colors.white,
                            onTap: () {
                              clickNum('.');
                            },
                            text: ".",
                          )
                      ),
                      Expanded(
                          child: CalcuBttn(
                            textColor: Colors.black,
                            color: Colors.white,
                            onTap: () {
                              setOperator('/');
                            },
                            text: "/",
                          )
                      ),
                      Expanded(
                          child: CalcuBttn(
                            textColor: Colors.white,
                            color: Colors.orange,
                            onTap: () {
                              calculate();
                            },
                            text: "=",
                          )
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CalcuBttn extends StatelessWidget {

  final String text;
  final TapCallBack onTap;
  final Color? color;
  final Color? textColor;

  const CalcuBttn({
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      margin: const EdgeInsets.all(5),
      child: MaterialButton(
        color: color ?? Colors.red,
        onPressed: onTap,
        shape: RoundedRectangleBorder(),
        child:  Text(text,
          style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: 30
          ),
        ),
      ),
    );
  }

}

typedef TapCallBack = void Function();