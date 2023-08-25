import 'package:flutter/material.dart';

class CreateRecord extends StatefulWidget {
  const CreateRecord({super.key});

  @override
  State<StatefulWidget> createState() => _CreateRecord();
}

class _CreateRecord extends State<CreateRecord> {
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
