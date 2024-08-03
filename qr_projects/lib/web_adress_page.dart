import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WebAddressPage extends StatefulWidget {
  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<WebAddressPage> {
  final TextEditingController _controller = TextEditingController();
  String _inputText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Adresi QR Dönüştürücü'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'URL Giriniz',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _inputText = _controller.text;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: Text(
                'QR Koda Dönüştür',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            if (_inputText.isNotEmpty)
              QrImageView(
                data: _inputText,
                version: QrVersions.auto,
                size: 200.0,
              ),
          ],
        ),
      ),
    );
  }
}
