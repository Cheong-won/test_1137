import 'package:flutter/material.dart';

class ViewRecord extends StatefulWidget {
  const ViewRecord({super.key});

  @override
  State<StatefulWidget> createState() => _ViewRecord();
}

class _ViewRecord extends State<ViewRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Container(
          alignment: Alignment.bottomCenter,
        )
    );
  }
}
