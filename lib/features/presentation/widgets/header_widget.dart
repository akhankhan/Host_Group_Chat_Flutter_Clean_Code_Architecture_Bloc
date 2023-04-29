import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:host_group_chat/features/presentation/widgets/theme/style.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            '$title',
            style: TextStyle(
                fontSize: 35, color: greenColor, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
