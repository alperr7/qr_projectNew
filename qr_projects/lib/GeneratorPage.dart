import 'package:flutter/material.dart';
import 'package:qr_projects/contact_info_page.dart';
import 'package:qr_projects/text_page.dart';
import 'package:qr_projects/web_adress_page.dart';

class QrGeneratorPage extends StatelessWidget {
  const QrGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Generator"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hangisi için QR kodu oluşturmak istersiniz?",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildOptionButton(
                          context,
                          'İletişim Bilgilerini Oluşturmak',
                          ContactInfoPage(),
                          Icons.contact_phone,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: _buildOptionButton(
                          context,
                          'Web Adresine Gitmek',
                          WebAddressPage(),
                          Icons.web,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50.0), // Padding between rows
                    child: _buildOptionButton(
                      context,
                      'Yazılan Metni Oluşturmak',
                      TextPage(),
                      Icons.text_fields,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(
      BuildContext context, String title, Widget page, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 10.0,
            ),
          ],
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Colors.teal,
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 16.0,
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
