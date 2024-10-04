import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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

class TelaPreenche extends StatefulWidget {
  const TelaPreenche({super.key});

  @override
  State<TelaPreenche> createState() => _TelaPreencheState();
}

class _TelaPreencheState extends State<TelaPreenche> {
  late TextEditingController _controller;
  late String _value;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _value = "";
  }

  @override
  Widget build(BuildContext context) {
    String textSet;
    final args = ModalRoute.of(context)!.settings.arguments as String;
    textSet = args;

    void setValue() {
      setState(() {
        _value = _controller.text;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Preenche"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Set $textSet:",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _controller,
                    onChanged: (value) => setValue(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite um valor",
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  minimumSize: const Size(150, 50)),
              onPressed: () => Navigator.pop(context, _value),
              child: const Text(
                "Ok",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String x, y;

  @override
  void initState() {
    super.initState();
    x = "X";
    y = "Y";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            this.widget.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "$x",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        minimumSize: const Size(150, 50)),
                    onPressed: () => Navigator.pushNamed(
                            context, "/telaPreencher", arguments: "X")
                        .then((value) => x = value.toString()),
                    child: const Text("Informar X",
                        style: TextStyle(color: Colors.white)))
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "$y",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        minimumSize: const Size(150, 50)),
                    onPressed: () => Navigator.pushNamed(
                            context, "/telaPreencher",
                            arguments: "Y")
                        .then((value) => y = value.toString()),
                    child: const Text(
                      "Informar Y",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    minimumSize: const Size(150, 50)),
                onPressed: () => null,
                child: const Text("Calcular",
                    style: TextStyle(color: Colors.white))),
            const SizedBox(height: 20),
            const Text(
              "Resultado",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
