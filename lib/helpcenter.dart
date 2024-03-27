import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HelpCard(
                  title: 'Placing an Order',
                  icon: Icons.shopping_cart,
                  description: 'Your order will be processed within 24 hours.',
                ),
                HelpCard(
                  title: 'Order Edit and Cancellation',
                  icon: Icons.edit,
                  description: 'Edit orders, cancel orders, change drivers.',
                ),
                HelpCard(
                  title: 'Fee, Payments and Methods',
                  icon: Icons.payment,
                  description: 'Request refunds, top up money, choose payment methods.',
                ),
                HelpCard(
                  title: 'Goods and Size Limits',
                  icon: Icons.aspect_ratio,
                  description: 'Learn about goods and size restrictions.',
                ),
                HelpCard(
                  title: 'Coupons and Promotions',
                  icon: Icons.local_offer,
                  description: 'Find information about available coupons and promotions.',
                ),
                HelpCard(
                  title: 'Profile and Account',
                  icon: Icons.account_circle,
                  description: 'Manage your profile, account settings, and preferences.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HelpCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const HelpCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 36,
                  color: Colors.blue,
                ),
                SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


