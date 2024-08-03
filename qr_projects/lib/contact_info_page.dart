import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ContactInfoPage extends StatefulWidget {
  @override
  _ContactInfoPageState createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  Contact? _selectedContact;
  bool _isPermissionGranted = false;
  String _vCard = "";

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    var permissionStatus = await Permission.contacts.status;
    if (!permissionStatus.isGranted) {
      var result = await Permission.contacts.request();
      setState(() {
        _isPermissionGranted = result.isGranted;
      });
    } else {
      setState(() {
        _isPermissionGranted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İletişim Bilgileri'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (_isPermissionGranted) {
                    try {
                      Contact? contact =
                          await ContactsService.openDeviceContactPicker();
                      if (contact != null) {
                        setState(() {
                          _selectedContact = contact;

                          _vCard = _contactToVCard(contact);
                        });
                      }
                    } catch (e) {
                      print("Error picking contact : $e");
                    }
                  } else {
                    print("Contacts permission denied");
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    minimumSize: Size(200, 60),
                    textStyle: TextStyle(fontSize: 20)),
                child: Text('Rehberden Kişi Seç'),
              ),
            ),
            SizedBox(height: 100),
            if (_selectedContact != null) ...[
              Text('Seçilen Kişi: ${_selectedContact?.displayName}'),
              SizedBox(height: 20),
              QrImageView(
                data: _vCard,
                version: QrVersions.auto,
                size: 400.0,
              ),
            ]
          ],
        ),
      ),
    );
  }

  String _contactToVCard(Contact? contact) {
    String name = contact?.displayName ?? 'No name';
    String phone = 'No phone number';
    if (contact?.phones != null && contact!.phones!.isNotEmpty) {
      phone = contact.phones?.first.value ?? 'No phone number';
    }

    return '''
BEGIN:VCARD
VERSION:3.0
FN:$name
TEL:$phone
END:VCARD
    ''';
  }
}
