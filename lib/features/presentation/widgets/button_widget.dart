import 'package:flutter/material.dart';
import 'package:host_group_chat/features/presentation/widgets/theme/style.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key, required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 44,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
