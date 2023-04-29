import 'package:flutter/material.dart';

class SingleItemGroupWidget extends StatefulWidget {
  const SingleItemGroupWidget({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  State<SingleItemGroupWidget> createState() => _SingleItemGroupWidgetState();
}

class _SingleItemGroupWidgetState extends State<SingleItemGroupWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(""),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Group name",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "recent msg",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black.withOpacity(.7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: Divider(
                            thickness: 1.50,
                            color: Colors.black.withOpacity(.3),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
