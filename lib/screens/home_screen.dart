import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'test',
            ),
            Text('test'),
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
