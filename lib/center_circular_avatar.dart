import 'package:flutter/material.dart';

class CentralCircularAvatar extends StatelessWidget {
  const CentralCircularAvatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Icon(
        Icons.panorama,
        size: 50,
      ),
      radius: 80,
      backgroundColor: Colors.lightBlue,
    );
  }
}
