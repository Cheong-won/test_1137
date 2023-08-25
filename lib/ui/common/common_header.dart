import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget {
   final VoidCallback onBackButtonPressed;

  const CommonHeader({super.key, required this.onBackButtonPressed});

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
          const Text('Create Record'),
        ],
      ),
    );
  }
}