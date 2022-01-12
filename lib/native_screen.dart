
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeScreen extends StatefulWidget {
  const NativeScreen({Key? key}) : super(key: key);

  @override
  _NativeScreenState createState() => _NativeScreenState();
}

class _NativeScreenState extends State<NativeScreen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String batteryLevel = 'Unknown battery level.';

  void getBatteryLevel() {

    platform.invokeMethod('getBatteryLevel').then((value) {
      setState(() {
        batteryLevel = 'Battery level at $value % .';
      });
    }).catchError((error){
      setState(() {
        batteryLevel = "Failed to get battery level: '${error.message}'.";
      });
    });
    //String batteryLevel;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battery level'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Get Battery Level'),
              onPressed: getBatteryLevel,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(batteryLevel),
          ],
        ),
      ),
    );
  }
}
