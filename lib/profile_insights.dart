import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:review_app/chart_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ProfileInsights extends StatefulWidget {
  static const routeName = '/profile-insights';
  ProfileInsights({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileInsightsState createState() => _ProfileInsightsState();
}

class _ProfileInsightsState extends State<ProfileInsights> {
  List<charts.Series<Pollution, String>> _seriesData;
  ScrollController _scrollController;
  _generateData() {
    var data1 = [
      new Pollution(1980, 'Jan', 30),
      new Pollution(1980, 'Feb', 40),
      new Pollution(1980, 'March', 10),
    ];
    var data2 = [
      new Pollution(1985, 'Jan', 100),
      new Pollution(1980, 'Feb', 150),
      new Pollution(1985, 'March', 80),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Colors.blue),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Colors.deepOrangeAccent),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Pollution, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          appBar(),
          chartView(),
          chartRow(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text(
              'Profile Reach',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          profileReachChart(),
          navigatorReaches()
        ],
      ),
    );
  }

  Widget appBar() {
    return Container(
      alignment: Alignment.topLeft,
      height: 130.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 112.0),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              'Profile Insight',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget chartView() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        child: charts.BarChart(
          _seriesData,
          animate: true,
          barGroupingType: charts.BarGroupingType.grouped,
          animationDuration: Duration(seconds: 3),
        ),
      ),
    );
  }

  Widget chartRow() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Container(
            color: Colors.deepOrangeAccent,
            height: 16,
            width: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Review Given',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Container(
            color: Colors.blue,
            height: 16,
            width: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Profile Reach',
            style: TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }

  Widget profileReachChart() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: CircularPercentIndicator(
                radius: 75.0,
                lineWidth: 9.0,
                percent: 0.7,
                progressColor: Colors.pink,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text('1000',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 33.0),
              child: Text('Total Reach',
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
            )
          ]),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: CircularPercentIndicator(
                radius: 75.0,
                lineWidth: 9.0,
                percent: 0.42,
                progressColor: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text('700',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 33.0),
              child: Text('Contact Reach',
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
            )
          ]),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: CircularPercentIndicator(
                radius: 75.0,
                lineWidth: 9.0,
                percent: 0.23,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text('300',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 33.0),
              child: Text('Referal Reach',
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
            )
          ]),
        ],
      ),
    );
  }

  Widget navigatorReaches() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
            leading: Column(
              children: [
                Text('3000',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                Text('Referal Reach',
                    style: TextStyle(
                      fontSize: 12,
                    )),
              ],
            ),
          ),
          ListTile(
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
            leading: Column(
              children: [
                Text(
                  '1000',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Text(
                  'Total Follower',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
