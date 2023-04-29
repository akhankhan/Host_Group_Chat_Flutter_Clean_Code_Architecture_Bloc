import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:host_group_chat/constant.dart';
import 'package:host_group_chat/features/presentation/widgets/single_item_group_widget.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, PageConst.createNewGroup);
        },
        child: const Icon(
          AntDesign.addusergroup,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return SingleItemGroupWidget(
                    onTap: () {
                      Navigator.pushNamed(context, PageConst.singleChatPage);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
