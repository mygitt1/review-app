import 'package:flutter/material.dart';
import 'package:review_app/account_activity.dart';
import 'package:review_app/dashboard.dart';
import 'package:review_app/profile.dart';
import 'package:review_app/profile_insights.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Review App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashBoard(),
      routes: {
        Profile.routeName: (ctx) => Profile(),
        ProfileInsights.routeName: (ctx) => ProfileInsights(),
        AccountActivity.routeName: (ctx) => AccountActivity(),
      },
    );
  }
}
