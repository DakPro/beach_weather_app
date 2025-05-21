import 'package:flutter/material.dart';

class LocationSearchPage extends StatelessWidget {
  const LocationSearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Location'),
        backgroundColor: Color(0xFF7DADB2),
      ),
      body: Container (
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_1_v2.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter a location',
                filled: true,
                fillColor: Color(0xFFDBC074),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide( color: Color(0xFFB59D59)),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // TODO: Implement search logic
              },
            ),
            SizedBox(height: 20),
            // TODO: Add search results or suggestions
          ],
        ),
      ),
    );
  }
}