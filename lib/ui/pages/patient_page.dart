import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:partograph/ui/services/MapUtils.dart';
import 'package:partograph/ui/services/current_location.dart';

class PatientPage2 extends StatefulWidget {
  const PatientPage2({Key? key}) : super(key: key);

  @override
  _PatientPage2State createState() => _PatientPage2State();
}

String currLoc = "";
var details = [];
String date_time = "", address = "";
var loc = [];

class _PatientPage2State extends State<PatientPage2> {
  @override
  void initState() {
    super.initState();
    currentLoc();
  }

  @override
  Widget build(BuildContext context) {
    currentLoc();

    try {
      loc[0];
    } catch (e) {
      currentLoc();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        ),
        backgroundColor: Color.fromRGBO(222, 224, 252, 1),
        body: Center(
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
              ElevatedButton(
                  child: Text("Refresh location"),
                  onPressed: () async {
                    currentLoc();

                    date_time = currLoc.split("{}")[0];
                    address = currLoc.split("{}")[2];
                    loc = currLoc.split("{}")[1].split(" , ");

                    setState(() {
                      currLoc;
                      date_time;
                      address;
                      loc;
                    });
                  }),
              Card(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Date: " + date_time),
                    Text("Address: " + address),
                    //Text("Location: " + loc[0] + ", " + loc[1]),
                  ],
                ),
              ),
              ElevatedButton(
                  child: Text("See nearby hospitals in GMap"),
                  onPressed: () async {
                    MapUtils.openMap(
                        double.parse(loc[0]), double.parse(loc[1]));
                  }),
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: getHosps(),
                  ),
                ),
              )
            ])));
  }

  void currentLoc() async {
    currLoc = await getLoc();
    date_time = currLoc.split("{}")[0];
    address = currLoc.split("{}")[2];
    loc = currLoc.split("{}")[1].split(" , ");
  }

  List<Widget> getHosps() {
    List<Widget> lst = [];
    for (int i = 1; i <= 4; i++) {
      lst.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: MediaQuery.of(context).size.height / 7,
            child: Card(
              child: Column(children: [
                Text(
                  "Hospital " + i.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text("Hospital Location"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "Patient will be referred to the hospital",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }),
                    IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "No vacancy  of beds",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }),
                    Icon(Icons.location_on)
                  ],
                )
              ]),
            )),
      ));
    }

    return lst;
  }
}
