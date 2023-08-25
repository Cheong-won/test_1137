import 'package:fittrix/ui/common/sub_menu_widget.dart';
import 'package:flutter/material.dart';

class CreateRecord extends StatefulWidget {
  const CreateRecord({Key? key, required SubMenuIndex subMenuIndex,required this.onBackButtonPressed}) : super(key: key);
  final VoidCallback onBackButtonPressed;


  @override
  State<StatefulWidget> createState() => _CreateRecord();
}

class _CreateRecord extends State<CreateRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onBackButtonPressed,
        ),
        title: const Text('Create Record'),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
