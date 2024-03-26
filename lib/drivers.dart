import 'package:flutter/material.dart';

class DriversScreen extends StatefulWidget {
  @override
  _DriversScreenState createState() => _DriversScreenState();
}

class _DriversScreenState extends State<DriversScreen> {
  TextEditingController _nameController = TextEditingController();
  String? _selectedCategory; // Use nullable type
  List<String> _carDrivers = [];
  List<String> _bikeDrivers = [];

  void _addDriver() {
    setState(() {
      String name = _nameController.text;
      if (_selectedCategory == 'Car') {
        _carDrivers.add(name);
      } else if (_selectedCategory == 'Motorcycle') {
        _bikeDrivers.add(name);
      }
      _nameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Drivers'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter Drivers Name',
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField(
              value: _selectedCategory,
              hint: _selectedCategory == null ? Text('Select Category') : null,
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue as String?;
                });
              },
              items: ['Car', 'Motorcycle'].map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedCategory != null ? _addDriver : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Set button color to orange
              ),
              child: Text('Add Driver'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.orange,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Car Drivers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: _carDrivers.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_carDrivers[index]),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    color: Colors.orange,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Motorcycle Drivers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: _bikeDrivers.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_bikeDrivers[index]),
                          );
                        },
                      ),
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
}

