import 'package:flutter/material.dart';

import 'bottom_profile.dart';
import 'center_circular_avatar.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: SafeArea(
      child: Container(
        color: Colors.blue,
        child: Stack(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10, top: 10),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomProfile(),
            Positioned(
              child: CentralCircularAvatar(),
              top: (1 / 5) * heightOfScreen - 100,
              left: (widthOfScreen / 2) - 80,
            )
          ],
        ),
      ),
    ));
  }
}
