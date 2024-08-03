import 'package:flutter/material.dart';
import 'package:qr_projects/AdressReaderPage.dart';
import 'package:qr_projects/GeneratorPage.dart';
import 'package:qr_projects/PlateReaderPage.dart';
import 'package:qr_projects/ReaderPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Ana Sayfa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildGridButton(context, 'QR Oluşturucu',
                      QrGeneratorPage(), Icons.qr_code),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: _buildGridButton(context, 'QR Okuyucu', QrReaderPage(),
                      Icons.qr_code_scanner),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Expanded(
                  child: _buildGridButton(
                      context, 'Adres Okuma', AddressReaderPage(), Icons.map),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: _buildGridButton(context, 'Plaka Okuma',
                      PlateReaderPage(), Icons.directions_car),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridButton(
      BuildContext context, String title, Widget page, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Colors.white,
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
