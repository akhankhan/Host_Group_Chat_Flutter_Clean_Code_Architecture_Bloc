import 'package:flutter/material.dart';
import 'package:host_group_chat/features/presentation/widgets/theme/style.dart';

typedef ToolbarIndexController = Function(int index);

class CustomToolBarWidget extends StatelessWidget {
  const CustomToolBarWidget(
      {super.key, required this.toolbarIndexController, this.pageIndex = 0});
  final ToolbarIndexController toolbarIndexController;
  final int? pageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: ToolBarItem(
              onTap: () {
                toolbarIndexController(0);
              },
              title: 'Groups',
              borderColor: pageIndex == 0 ? Colors.white : Colors.transparent,
              textColor: pageIndex == 0 ? Colors.white : Colors.black,
            ),
          ),
          Expanded(
            child: ToolBarItem(
              onTap: () {
                toolbarIndexController(1);
              },
              title: 'Users',
              borderColor: pageIndex == 1 ? Colors.white : Colors.transparent,
              textColor: pageIndex == 1 ? Colors.white : Colors.black,
            ),
          ),
          Expanded(
            child: ToolBarItem(
              onTap: () {
                toolbarIndexController(2);
              },
              title: 'Profile',
              borderColor: pageIndex == 2 ? Colors.white : Colors.transparent,
              textColor: pageIndex == 2 ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

class ToolBarItem extends StatelessWidget {
  const ToolBarItem(
      {super.key,
      this.title,
      this.textColor,
      this.borderWidth = 3.0,
      this.onTap,
      this.borderColor});

  final String? title;
  final Color? textColor, borderColor;
  final double? borderWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: borderColor!,
              width: borderWidth!,
            ),
          ),
        ),
        child: Text(
          title!,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
