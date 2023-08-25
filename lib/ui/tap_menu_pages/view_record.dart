import 'package:fittrix/ui/common/common_header.dart';
import 'package:fittrix/ui/common/sub_menu_widget.dart';
import 'package:flutter/material.dart';

class RecordItem {
  final DateTime date;
  final String memo;

  RecordItem(this.date, this.memo);
}

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
  //샘플 데이터
  List<RecordItem> records = [
    RecordItem(DateTime(2023, 6, 1), 'test1'),
    RecordItem(DateTime(2023, 6, 2), 'test2'),
    RecordItem(DateTime(2023, 6, 3), 'test3'),
    RecordItem(DateTime(2023, 6, 4), 'test4'),
    RecordItem(DateTime(2023, 6, 5), 'test5'),
    RecordItem(DateTime(2023, 6, 30), 'test30'),
  ];

  @override
  void initState() {
    super.initState();
    sortRecordsInDescendingOrder();
  }

  void sortRecordsInDescendingOrder() {
    records.sort((a, b) => b.date.compareTo(a.date));
  }

  //날짜 형식을 문자열로 변환
  String formatDateTime(DateTime dateTime) {
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} "
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonHeader(onBackButtonPressed: widget.onBackButtonPressed),
        Expanded(
          child: ListView.builder(
            itemCount: null, // null로 설정하여 무한히 스크롤
            itemBuilder: (context, index) {
              final record = records[index % records.length]; // records의 길이를 넘지 않도록 % 연산을 사용

              return Column(
                children: [
                  Card(
                    elevation: 5.0,
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(formatDateTime(record.date)),
                      subtitle: Text(record.memo),
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
