import 'package:flutter/material.dart';

class RateUsPage extends StatefulWidget {
  @override
  _RateUsPageState createState() => _RateUsPageState();
}

class _RateUsPageState extends State<RateUsPage> {
  double _rating = 0;
  String _satisfaction = '';
  List<String> _features = [];
  String _feedback = '';

  final List<String> satisfactionOptions = [
    'Very Satisfied',
    'Satisfied',
    'Neutral',
    'Dissatisfied',
    'Very Dissatisfied',
  ];

  final List<String> featureOptions = [
    'Product Quality',
    'Customer Service',
    'Delivery Speed',
    'Store Cleanliness',
    'Prices',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Us'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'How would you rate our app?',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          Icons.star,
                          color: _rating > index ? Colors.amber : Colors.grey,
                          size: 40,
                        ),
                        onPressed: () {
                          setState(() {
                            _rating = index + 1.0;
                          });
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _rating == 0 ? 'No rating yet' : 'You rated: $_rating',
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              'How satisfied are you with our store?',
              style: TextStyle(fontSize: 18),
            ),
            ...satisfactionOptions.map(
              (option) => RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: _satisfaction,
                onChanged: (value) {
                  setState(() {
                    _satisfaction = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'What features do you like? (Select all that apply)',
              style: TextStyle(fontSize: 18),
            ),
            ...featureOptions.map(
              (option) => CheckboxListTile(
                title: Text(option),
                value: _features.contains(option),
                onChanged: (checked) {
                  setState(() {
                    if (checked == true) {
                      _features.add(option);
                    } else {
                      _features.remove(option);
                    }
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Additional feedback:', style: TextStyle(fontSize: 18)),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tell us more...',
              ),
              onChanged: (value) {
                _feedback = value;
              },
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // You can handle survey submission here
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text('Thank You!'),
                          content: Text('Your feedback has been submitted.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                  );
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
