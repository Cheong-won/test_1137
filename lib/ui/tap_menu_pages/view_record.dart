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
  List<RecordItem>? _recordItems;
  bool _isLoading = true; // 로딩 상태를 추적하는 변수

  @override
  void initState() {
    super.initState();
    _loadRecords();
  }

  _loadRecords() async {
    _recordItems = await _recordCnt.records();
    setState(() {
      _isLoading = false; // 데이터 로딩이 완료되면 _isLoading을 false로 설정
    });
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
          child: _isLoading
              ? Center(child: CircularProgressIndicator()) // 로딩 중이면 프로그레스 바 표시
              : (_recordItems == null || _recordItems!.isEmpty)
              ? Center(child: Text("No records available"))
              : ListView.builder(
            itemCount: _recordItems!.length,
            itemBuilder: (context, index) {
              final record = _recordItems![index % _recordItems!.length];
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
          ),
        ),
      ],
    );
  }
}

