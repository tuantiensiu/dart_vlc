import 'package:flutter/material.dart';
import 'package:test_flutter/components/rounded_button.dart';
import 'package:test_flutter/variable/containt.dart';

import '../forgot.dart';
import '../login.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/vgm.jpg'),
            Text('Chào mừng bạn đến với chương trình học thần học'),
            Text(
                'Chương trình nghiên cứu Kinh Thánh một cách hệ thống rõ ràng'),
            RoundedButton(
              text: 'Login',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: 'Register',
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ForgotScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
