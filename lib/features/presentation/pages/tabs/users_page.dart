import 'package:flutter/material.dart';
import 'package:host_group_chat/features/presentation/widgets/single_item_user_widget.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return const SingleItemUserWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
