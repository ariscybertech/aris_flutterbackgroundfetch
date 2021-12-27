import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String eventState = "[HOME] Loaded";

  setBackgroundTask() {
    BackgroundFetch.configure(
        BackgroundFetchConfig(
          minimumFetchInterval: 15,
        ), () async {
      int status = await BackgroundFetch.status;
      setState(() {
        eventState = "[BACKGROUND] $status";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Background Fetch"),
      ),
      body: Column(
        children: <Widget>[Text(eventState)],
      ),
    );
  }
}
