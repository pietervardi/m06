import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class MyAnalyticsHelper {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> testEventLog(_value) async {
    await analytics
        .logEvent(name: '${_value}_click', parameters: {'Value': _value});
    print('Send Event');
  }

  Future<void> testSetUserId(_value) async {
    await analytics.setUserId(id: '$_value');
    print('setUserId succeeded');
  }

  Future<void> testSetUserProperty() async {
    await analytics.setUserProperty(name: 'regular', value: 'indeed');
    print('setUserProperty succeeded');
  }

  Future<void> testSetSessionTimeoutDuration() async {
    await analytics.setSessionTimeoutDuration(const Duration(milliseconds: 20000));
    print('setSessionTimeoutDuration succeeded');
  }

  Future<void> testAppInstanceId() async {
    String? id = await analytics.appInstanceId;
    if (id != null) {
      print('appInstanceId succeeded: $id');
    } else {
      print('appInstanceId failed, consent declined');
    }
  }

  Future<void> testResetAnalyticsData() async {
    await analytics.resetAnalyticsData();
    print('resetAnalyticsData succeeded');
  }


}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MyAnalyticsHelper fbAnalytics = MyAnalyticsHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Working with Analytics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  fbAnalytics.testEventLog("send_event");
                },
                child: const Text('Send Event'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  fbAnalytics.testEventLog("send_property");
                },
                child: const Text('Send Property'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  fbAnalytics.testEventLog("send_error");
                },
                child: const Text('Send Error'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  fbAnalytics.testSetUserId("agung");
                },
                child: const Text('Send setUserId'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  fbAnalytics.testSetUserProperty();
                },
                child: const Text('Send setUserProperty'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  fbAnalytics.testSetSessionTimeoutDuration();
                },
                child: const Text('Send setSessionTimeoutDuration'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  fbAnalytics.testAppInstanceId();
                },
                child: const Text('Send appInstanceId'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  fbAnalytics.testResetAnalyticsData();
                },
                child: const Text('Send resetAnalyticsData'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
