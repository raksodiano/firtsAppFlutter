import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void initialState() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextStyle fontSize30 = const TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Clicks Count',
                style: fontSize30,
              ),
              Text(
                '$counter',
                style: fontSize30,
              )
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomButtonState(
        increaseFn: increase,
        decreaseFn: decrease,
        initialStateFn: initialState,
      ),
    );
  }
}

class CustomButtonState extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function initialStateFn;

  const CustomButtonState(
      {Key? key,
      required this.increaseFn,
      required this.decreaseFn,
      required this.initialStateFn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            child: const Icon(Icons.plus_one), onPressed: () => increaseFn()),
        FloatingActionButton(
            child: const Icon(Icons.exposure_zero),
            onPressed: () => initialStateFn()),
        FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () => decreaseFn()),
      ],
    );
  }
}
