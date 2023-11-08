import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/constants.dart';


class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
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
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/salamberdiri.png',
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
