import 'package:flutter/material.dart';
import 'package:host_group_chat/features/presentation/widgets/button_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/textfield_container_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/theme/style.dart';

class CreateNewGroupPage extends StatefulWidget {
  const CreateNewGroupPage({super.key});

  @override
  State<CreateNewGroupPage> createState() => _CreateNewGroupPageState();
}

class _CreateNewGroupPageState extends State<CreateNewGroupPage> {
  final TextEditingController groupNameController = TextEditingController();

  @override
  void dispose() {
    groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Group"),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(62),
              ),
              child: const Text(""),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Add group image",
              style: TextStyle(
                  color: greenColor, fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldContainerWidget(
              controller: groupNameController,
              hintText: 'name',
              prefixIcon: Icons.person,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1.50,
              indent: 120,
              endIndent: 120,
            ),
            const SizedBox(
              height: 10,
            ),
            const ButtonWidget(title: 'Create New Group '),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'By clicking Create New Group, you are agree to the ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: colorC1C1C1),
                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: greenColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
