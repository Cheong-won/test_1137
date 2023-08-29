import 'dart:io';

import 'package:fittrix/ui/common/common_header.dart';
import 'package:fittrix/ui/common/sub_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';


class ExerciseRecordWidget extends StatefulWidget {
  const ExerciseRecordWidget(
      {Key? key,
      required this.subMenuIndex,
      required this.onBackButtonPressed})
      : super(key: key);
  final VoidCallback onBackButtonPressed;
  final SubMenuIndex subMenuIndex;



  @override
  State<StatefulWidget> createState() => _ExerciseRecordWidget();
}

class _ExerciseRecordWidget extends State<ExerciseRecordWidget> {
  final logger = Logger();
  String? _statusMessage;
  Map<SubMenuIndex, String> exerciseImages = {
    SubMenuIndex.first: 'assets/images/lunge.png',
    SubMenuIndex.second: 'assets/images/squat.webp',
    SubMenuIndex.third: 'assets/images/pushup.jpeg',
    SubMenuIndex.fourth: 'assets/images/leg_raise.webp',
  };


  String _getExerciseImage(){
    logger.d('subMenuIndex: ${widget.subMenuIndex}');
    logger.d('exerciseImages: $exerciseImages');
    var ret =  exerciseImages[widget.subMenuIndex] ?? 'assets/images/default_image_path.jpeg';
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonHeader(onBackButtonPressed: widget.onBackButtonPressed),
        Expanded(
          child: Container(
            alignment: Alignment.bottomCenter,
            color: Colors.yellow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  _getExerciseImage(),
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 20.h),
                Text(
                  '${'exercise_date'.tr}: ${DateTime.now().toLocal().toString().split(' ')[0]}',
                  // 오늘 날짜
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20.h),
                TextField(
                  onChanged: (value) {
                    _statusMessage = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'simple_status_message_input'.tr,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    // TODO: 필요한 기능을 여기에 추가
                    print('운동 기록 저장: $_statusMessage');
                  },
                  child: Text('record'.tr),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}