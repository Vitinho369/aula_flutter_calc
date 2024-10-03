import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(
//     title: "Calculadora",
//     home: MaterialHome(title: "Calculadora",),
//     )
//   );
// }

class MaterialHome extends StatelessWidget {
  const MaterialHome({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Colors.blue,
        ),
      body:Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              child: Align(
              alignment: Alignment.topCenter,
              child: Icon(Icons.ac_unit)),
            ),
            
          ],
        )
    );
  }
}

