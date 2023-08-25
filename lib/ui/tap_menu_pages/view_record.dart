import 'package:fittrix/ui/common/sub_menu_widget.dart';
import 'package:flutter/material.dart';

class ViewRecord extends StatefulWidget {
  const ViewRecord({Key? key, required SubMenuIndex subMenuIndex,required this.onBackButtonPressed}) : super(key: key);
  final VoidCallback onBackButtonPressed;

  @override
  State<StatefulWidget> createState() => _ViewRecordState();
}

class _ViewRecordState extends State<ViewRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onBackButtonPressed,
        ),
        title: const Text('View Record'),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
