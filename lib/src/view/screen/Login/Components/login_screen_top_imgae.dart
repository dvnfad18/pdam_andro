import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/constants.dart';


class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/larikanan.png',
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}