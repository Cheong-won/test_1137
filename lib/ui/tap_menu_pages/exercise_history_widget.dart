import 'package:fittrix/ui/common/common_header.dart';
import 'package:fittrix/ui/common/sub_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_models/record_view_model.dart';

class ExerciseHistoryWidget extends StatefulWidget {
  const ExerciseHistoryWidget({
    Key? key,
    required this.onBackButtonPressed,
    required SubMenuIndex subMenuIndex,
  }) : super(key: key);
  final VoidCallback onBackButtonPressed;

  @override
  State<StatefulWidget> createState() => _ExerciseHistoryWidgetState();
}

class _ExerciseHistoryWidgetState extends State<ExerciseHistoryWidget> {
  final _recordViewModel = Get.find<RecordViewModel>();

  @override
  void initState() {
    super.initState();
    _recordViewModel.loadRecords();
  }


  String formatDateTime(String str) {
    int timestamp = int.parse(str);
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} "
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonHeader(onBackButtonPressed: widget.onBackButtonPressed, title: 'tab_menu2'.tr),
        Expanded(
          child: Obx(
                () {
              if (_recordViewModel.isLoading) { // _isLoading도 RxBool 타입이어야 합니다.
                return Center(child: CircularProgressIndicator());
              }

              if (_recordViewModel.recordItems == null || _recordViewModel.recordItems !.isEmpty) {
                return Center(child: Text('no_records_available'.tr));
              }

              return ListView.builder(
                itemCount: _recordViewModel.recordItems !.length,
                itemBuilder: (context, index) {
                  final record = _recordViewModel.recordItems ![index % _recordViewModel.recordItems !.length];
                  return Column(
                    children: [
                      Card(
                        elevation: 5.0,
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(formatDateTime(record.date.toString())),
                          subtitle: Text(record.desc),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );

  }
}

