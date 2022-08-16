import 'package:flutter/material.dart';

class SomethingWenWrongWidget extends StatelessWidget {
  const SomethingWenWrongWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.error_outline,
                size: 46,
                color: Color.fromRGBO(4, 30, 73, 1),
              ),
            ),
            Text(
              'Something went wrong...',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(4, 30, 73, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
