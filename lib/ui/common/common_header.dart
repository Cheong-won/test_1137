import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget {
  final VoidCallback onBackButtonPressed;
  final String title;

  const CommonHeader({Key? key, required this.onBackButtonPressed, required this.title}) : super(key: key); // Modified constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onBackButtonPressed,
          ),
          Text(title),
        ],
      ),
    );
  }
}
