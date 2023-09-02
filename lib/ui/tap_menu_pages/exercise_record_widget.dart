import 'dart:io';

import 'package:fittrix/di/db/database.dart';
import 'package:fittrix/ui/common/common_header.dart';
import 'package:fittrix/ui/common/sub_menu_widget.dart';
import 'package:fittrix/view_models/record_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  final _recordViewModel = Get.find<RecordViewModel>();
  Map<SubMenuIndex, String> exerciseImages = {
    SubMenuIndex.first: 'assets/images/lunge.png',
    SubMenuIndex.second: 'assets/images/squat.webp',
    SubMenuIndex.third: 'assets/images/pushup.jpeg',
    SubMenuIndex.fourth: 'assets/images/leg_raise.webp',
  };

  final fieldText = TextEditingController();
  DateTime _currentDate = DateTime.now();

  @override
  initState() {
    super.initState();
    fieldText.text = _recordViewModel.inputDesc.value;
    _statusMessage = _recordViewModel.inputDesc.value;
  }

  String _getExerciseImage(){
    logger.d('subMenuIndex: ${widget.subMenuIndex}');
    logger.d('exerciseImages: $exerciseImages');
    var ret =  exerciseImages[widget.subMenuIndex] ?? 'assets/images/default_image_path.jpeg';
    return ret;
  }
  void _clearStatusMessage() {
    fieldText.clear();
    widget.onBackButtonPressed();

  }

  void showToast(String message, {Color backgroundColor = Colors.green}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
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
                  '${'exercise_date'.tr}: ${_currentDate.toLocal().toString().split(' ')[0]}',
                  // 오늘 날짜
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20.h),
                TextField(
                  controller: fieldText,
                  onChanged: (value) {
                    _statusMessage = value;
                    _recordViewModel.updateDesc(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'simple_status_message_input'.tr,
                    border: const OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    if (_statusMessage == null || _statusMessage!.isEmpty) {
                      showToast('enter_message'.tr, backgroundColor: Colors.red);
                      return;
                    }
                    var item = Record(
                      desc: _statusMessage ?? 'No message',
                      exerciseDate: _currentDate,  // 문자열 형태의 현재 날짜 사용
                    );
                    _recordViewModel.insertRecord(item);
                    _clearStatusMessage();
                    showToast('record_saved'.tr);
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
