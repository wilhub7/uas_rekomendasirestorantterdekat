import 'package:flutter/material.dart';

class Deliveryscreen extends StatelessWidget {
  const Deliveryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Reservation",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: DropdownButtonFormField(
            // value: _value,
            onChanged: (value) {
              // setState(() {
              //   _value = value;
              // });
            },
            items: List.generate(
              10,
              (index) => DropdownMenuItem(
                value: index.toString(),
                child: Text('Notify resto $index'),
              ),
            ),
          ),
        ),
        Text(
          "Delivery",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: DropdownButtonFormField(
            // value: _value,
            onChanged: (value) {
              // setState(() {
              //   _value = value;
              // });
            },
            items: List.generate(
              10,
              (index) => DropdownMenuItem(
                value: index.toString(),
                child: Text('on the way $index'),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
