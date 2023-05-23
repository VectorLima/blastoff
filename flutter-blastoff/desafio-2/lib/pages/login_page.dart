import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projeto_2/components/login/custom_login_button_component.dart';
import 'package:projeto_2/controllers/login_controller.dart';
import 'package:projeto_2/widgets/custom_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people, size: MediaQuery.of(context).size.height * 0.2),
          CustomTextFieldWidget(
            onChanged: _controller.setLogin,
            label: 'Login',
          ),
          CustomTextFieldWidget(
            onChanged: _controller.setPass,
            label: 'Senha',
            obscureText: true,
          ),
          SizedBox(height: 15),
          CustomLoginButtonComponent(loginController: _controller),
        ],
      ),
    ));
  }
}
