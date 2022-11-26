import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class TwilioScreen extends StatefulWidget {
  TwilioScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _TwilioScreenState createState() => _TwilioScreenState();
}

class _TwilioScreenState extends State<TwilioScreen> {
  late TwilioFlutter twilioFlutter;

  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACbcff96a5069c0883fe39c2fadd9568ea',
        authToken: 'e3a3aa6eef197e5f61d83b7746a534d1',
        twilioNumber: '+19403988023');

    super.initState();
  }

  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: ' +919315073039',
        messageBody: 'Hii everyone this is a demo of\nflutter twilio sms.');
  }

  void getSms() async {
    var data = await twilioFlutter.getSmsList();
    print(data);

    await twilioFlutter.getSMS('***************************');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Press the button to send SMS.',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendSms,
        tooltip: 'Send Sms',
        child: SizedBox(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.send),
        )),
      ),
    );
  }
}
