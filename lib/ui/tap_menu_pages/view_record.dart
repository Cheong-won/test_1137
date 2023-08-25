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
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onBackButtonPressed,
        ),
        title: const Text('View Record'),
      ),
      body: ListView.builder(
        itemCount: null, // null로 설정하여 무한히 스크롤
        itemBuilder: (context, index) {
          final record = records[index % records.length]; // records의 길이를 넘지 않도록 % 연산을 사용

          return Column(
            children: [
              Card(
                elevation: 5.0, // 카드의 그림자 깊이 설정
                margin: EdgeInsets.all(8.0), // 카드의 마진 설정.
                child: ListTile(
                  title: Text(formatDateTime(record.date)), // 날짜를 문자열로 표시
                  subtitle: Text(record.memo), // 메모를 표시
                ),
              ),
              const Divider(
                thickness: 1.0, // 나눔선의 두께 설정
                color: Colors.grey, // 나눔선의 색상 설정
              ),
            ],
          );
        },
      ),
    );
  }
}
