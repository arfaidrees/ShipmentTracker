import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool showAboutSection = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
          CardItem(
          title: 'Change Password',
          hasArrow: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PasswordChangeScreen()),
            );
          },
        ),
            CardItem(title: 'Receive E-receipts', hasArrow: true),
            CardItem(title: 'Enable Digital Signature', hasArrow: true),
            CardItem(title: 'Language', hasArrow: true),
            CardItem(title: 'Privacy', hasArrow: true),
            CardItem(title: 'Standard Rates', hasArrow: true),
            CardItem(
              title: 'About ZipZap',
              hasArrow: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            Expanded(child: SizedBox()), // Spacer to push "Sign Out" to the bottom
            Center(
              child: CardItem(
                title: 'Sign Out',
                hasArrow: false,
                textColor: Colors.orange,
                onTap: () {
                  // Handle sign-out action here
                  // For example:
                  // Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final bool hasArrow;
  final VoidCallback? onTap;
  final Color? textColor;

  const CardItem({
    Key? key,
    required this.title,
    this.hasArrow = false,
    this.onTap,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: textColor),
        ),
        trailing: hasArrow ? Icon(Icons.keyboard_arrow_right) : null,
        onTap: onTap,
      ),
    );
  }
}




class PasswordChangeScreen extends StatefulWidget {
  @override
  _PasswordChangeScreenState createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  String _phoneNumber = '';
  String _verificationCode = '';
  String _errorMessage = '';

  final _phoneNumberController = TextEditingController();
  final _verificationCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'To change your Password,verify your phone number ',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                errorText: _errorMessage,
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _verificationCodeController,
              decoration: InputDecoration(
                labelText: 'Verification Code',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Verify phone number and change password here
            // You can use a package like `firebase_auth` to handle phone number verification
          },
          child: Text('Continue'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            textStyle: TextStyle(color: Colors.white),
          ),
        )
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ZipZap'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange.shade400, Colors.orange.shade900],
          ),
        ),
        child: Center(
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About ZipZap',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Founded in Pakistan in 2024, ZipZap is an on-demand delivery platform with a mission to empower communities by providing fast, convenient, and cost-effective delivery services.\n\n'
                        'Customers, ranging from individuals to large enterprises, can easily utilize our diverse fleet of delivery vehicles, operated by skilled professionals, with just a tap on the app.\n\n'
                        'Our innovative approach to logistics has revolutionized the transportation and delivery industry, setting new standards for efficiency and reliability.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

