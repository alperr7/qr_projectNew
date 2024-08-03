import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  TextEditingController _textController = TextEditingController();
  String? _qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yazılan Metin'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Metni buraya girin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _qrData = _textController.text;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: Text(
                'QR Oluştur',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20.0),
            if (_qrData != null && _qrData!.isNotEmpty)
              QrImageView(
                data: _qrData!,
                version: QrVersions.auto,
                size: 200.0,
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
