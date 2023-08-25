import 'package:fittrix/ui/common/common_header.dart';
import 'package:fittrix/ui/common/sub_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/record_controller.dart';
import '../../models/response/record_item.dart';

class ViewRecord extends StatefulWidget {
  const ViewRecord({
    Key? key,
    required this.onBackButtonPressed,
    required SubMenuIndex subMenuIndex,
  }) : super(key: key);
  final VoidCallback onBackButtonPressed;

  @override
  State<StatefulWidget> createState() => _ViewRecordState();
}

class _ViewRecordState extends State<ViewRecord> {
  final _recordCnt = Get.find<RecordController>();

  @override
  void initState() {
    super.initState();
    _recordCnt.loadRecords();
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
        CommonHeader(onBackButtonPressed: widget.onBackButtonPressed),
        Expanded(
          child: Obx(
                () {
              if (_recordCnt.isLoading) { // _isLoading도 RxBool 타입이어야 합니다.
                return Center(child: CircularProgressIndicator());
              }

              if (_recordCnt.recordItems == null || _recordCnt.recordItems !.isEmpty) {
                return Center(child: Text("No records available"));
              }

              return ListView.builder(
                itemCount: _recordCnt.recordItems !.length,
                itemBuilder: (context, index) {
                  final record = _recordCnt.recordItems ![index % _recordCnt.recordItems !.length];
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

