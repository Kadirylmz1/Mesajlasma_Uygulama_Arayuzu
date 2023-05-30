import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'temel Mesajlaşma Uygulaması',
      home: iskele(),
    );
  }
}

class iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mesajlaşma Uygulaması Arayüzü"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List mesajlistesi = [];
  mesajlariEkle(String metin) {
    setState(() {
      mesajlistesi.insert(0, t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: mesajlistesi.length,
              itemBuilder: (context, int indexNumarasi) =>
                  Text(mesajlistesi[indexNumarasi]),
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                  onSubmitted: mesajlariEkle,
                  controller: t1,
                ),
              ),
              ElevatedButton(
                onPressed: () => mesajlariEkle(t1.text),
                child: Text("Gönder"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
