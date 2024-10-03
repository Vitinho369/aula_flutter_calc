import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    routes: <String, WidgetBuilder>{
      "/": (BuildContext context) {
        return const MyHomePage(title: "Calculadora");
      },
      "/telaPreencher": (BuildContext context) { 
        return const TelaPreenche();
      },
    },
  ));
}
class TelaPreenche extends StatelessWidget {
  const TelaPreenche({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Preenche"),
        backgroundColor: Colors.amber,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Row(
                children: [
                 Text("Set X"),
                 
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  minimumSize: const Size(150,50)
                ),
                onPressed: null, 
                child: const Text("Informar Y", style: TextStyle(color: Colors.white),)
                )
             
        ],),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title, style: TextStyle(color: Colors.black),),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("X", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              TextButton(
                    style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  minimumSize: const Size(150,50)
                ),
                onPressed:  () => Navigator.pushNamed(context, "/telaPreencher"),
                child: const Text("Informar X",  style: TextStyle(color: Colors.white)))
          ],
          ),
          const SizedBox(height: 10),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Y", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  minimumSize: const Size(150,50)
                ),
                onPressed: () => Navigator.pushNamed(context, "/telaPreencher"),
                child: const Text("Informar Y", style: TextStyle(color: Colors.white),)
                )
            ],
           ),
            const SizedBox(height: 20),
            TextButton(
                  style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  minimumSize: const Size(150,50)
                ),
                onPressed: () => Navigator.pushNamed(context, "/telaPreencher"),
                child: const Text("Calcular",  style: TextStyle(color: Colors.white))
            ),
            const SizedBox(height: 20),
            const Text("Resultado", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
        ],
      )
    );
  }
}

