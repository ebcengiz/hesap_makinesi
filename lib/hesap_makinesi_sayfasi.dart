import 'package:flutter/material.dart';

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({super.key});

  @override
  State<HesapMakinesi> createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  TextEditingController sayi1Controller = TextEditingController();
  TextEditingController sayi2Controller = TextEditingController();
  int sonuc = 0;

  void hesaplaTopla() {
    int sayi1 = int.tryParse(sayi1Controller.text) ?? 0;
    int sayi2 = int.tryParse(sayi2Controller.text) ?? 0;
    int toplam = sayi1 + sayi2;
    setState(() {
      sonuc = toplam;
    });
  }

  void sifirla() {
    sayi1Controller.clear();
    sayi2Controller.clear();
    setState(() {
      sonuc = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap Makinesi", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: sayi1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Sayı 1'),
              ),
              TextField(
                controller: sayi2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Sayı 2'),
              ),
              SizedBox(height: 16),
              Text('Sonuç: $sonuc', style: TextStyle(fontSize: 24)),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: hesaplaTopla,
                    child: Text('Topla'),
                  ),
                  ElevatedButton(
                    onPressed: sifirla,
                    child: Text('Sıfırla'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
