import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CardItem(title: 'Change Password', hasArrow: true),
            CardItem(title: 'Recieve E-reciepts', hasArrow: true),
            CardItem(title: 'Enable Digital Signature', hasArrow: true),
            CardItem(title: 'Language', hasArrow: true),
            CardItem(title: 'Privacy', hasArrow: true),
            CardItem(title: 'Stadard Rates', hasArrow: true),
            CardItem(title: 'About ZipZap', hasArrow: true),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final bool hasArrow;

  const CardItem({
    Key? key,
    required this.title,
    this.hasArrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(title),
        trailing: hasArrow ? Icon(Icons.keyboard_arrow_right) : null,
        onTap: () {
        },
      ),
    );
  }
}
