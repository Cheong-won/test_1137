import 'package:fittrix/ui/common/common_header.dart';
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
    return Column(
      children: [
        CommonHeader(onBackButtonPressed: widget.onBackButtonPressed),
        Expanded(
          child: Container(
            alignment: Alignment.bottomCenter,
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
