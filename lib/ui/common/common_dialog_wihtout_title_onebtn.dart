import 'package:flutter/material.dart';

import '../../common/def/const.dart';
import '../../common/style/app_theme.dart';

class CommonDialogWithoutTitleOneBtn extends StatelessWidget {
  final String titleStart, titleMiddle, titleEnd, contents, buttonText1;
  final bool isTwolineContents;

  //final Image image;

  const CommonDialogWithoutTitleOneBtn({
    required this.titleStart,
    required this.titleMiddle,
    required this.titleEnd,
    required this.contents,
    required this.isTwolineContents,
    required this.buttonText1,

    //required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TestConst.dialogRadious),
      ),
      elevation: 0.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: <Widget>[
            Container(
              height: isTwolineContents ? 208 : 188,
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 0.0,
              ),
              decoration: BoxDecoration(
                color: AppTheme.white, //Colors.black.withOpacity(0.3),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(TestConst.dialogRadious),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    height: 88,
                    child: Text(
                      contents,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 1.42,
                        letterSpacing: -1,
                        fontSize: 14.0,
                        color: Color(0xff545454),
                        fontFamily: TestConst.fontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: SizedBox(
                height: 60,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppTheme.mainColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(TestConst.dialogRadious),
                          bottomRight: Radius.circular(TestConst.dialogRadious)),
                    ),
                  ),
                  //color: Colors.amber,
                  onPressed: () {
                    Navigator.of(context).pop(TestConst.pressed_btn1); // To close the dialog
                  },
                  child: Text(
                    buttonText1,
                    style: const TextStyle(
                      letterSpacing: -1,
                      color: AppTheme.white,
                      fontSize: 16,
                      fontFamily: TestConst.fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
