import 'package:fittrix/controller/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<StatefulWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController =  Get.find<LoginController>();
  bool _isLoginFailed = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('login'.tr),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          //password field
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
                style: const TextStyle(color: Colors.red),
              ),
            )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('login_cancel'.tr),
        ),
        TextButton(
          onPressed: () async {
            final NavigatorState navigator = Navigator.of(context);
            bool loginSuccessful = await _handleLogin();
            if (!loginSuccessful) {
              setState(() {
                _isLoginFailed = true;
              });
            } else {
              navigator.pop();
            }
          },
          child: Text('login_button'.tr),
        ),

      ],
    );
  }

  Future<bool> _handleLogin() async {
    return await _loginController.login(_passwordController.text);
  }
}
