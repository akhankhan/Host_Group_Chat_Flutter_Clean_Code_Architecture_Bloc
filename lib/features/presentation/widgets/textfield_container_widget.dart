import 'package:flutter/material.dart';
import 'package:host_group_chat/features/presentation/widgets/theme/style.dart';

class TextFieldContainerWidget extends StatelessWidget {
  const TextFieldContainerWidget({
    super.key,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.hintText,
    this.borderRadius = 10,
    this.color,
    this.iconClickEvent,
  });

  final TextEditingController? controller;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final String? hintText;
  final double? borderRadius;
  final Color? color;
  final VoidCallback? iconClickEvent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color ?? color747480.withOpacity(.2),
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: InkWell(
            onTap: iconClickEvent,
            child: Icon(prefixIcon!),
          ),
        ),
      ),
    );
  }
}
