import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoginFailed = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('login'.tr),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _idController,
            decoration: InputDecoration(
              labelText: 'login_id'.tr,
              hintText: 'enter_your_id'.tr,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'login_password'.tr,
              hintText: 'enter_your_password'.tr,
            ),
            obscureText: true,
          ),
          if (_isLoginFailed)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
               'login_error'.tr,
                style: TextStyle(color: Colors.red),
              ),
            )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            bool loginSuccessful = await _handleLogin();
            if (!loginSuccessful) {
              setState(() {
                _isLoginFailed = true;
              });
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Text('login_button'.tr),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('login_cancel'.tr),
        ),
      ],
    );
  }

  Future<bool> _handleLogin() async {
    // TODO: 로그인 처리를 여기에서 구현합니다.
    // 예제에서는 임의의 로직을 사용하겠습니다.
    if (_idController.text == 'admin' && _passwordController.text == 'password') {
      return true;
    }
    return false;
  }
}
