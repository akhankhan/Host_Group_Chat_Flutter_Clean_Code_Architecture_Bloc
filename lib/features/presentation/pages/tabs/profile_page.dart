import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:host_group_chat/features/domin/entities/user_entity.dart';
import 'package:host_group_chat/features/presentation/cubit/user/user_cubit.dart';
import 'package:host_group_chat/features/presentation/widgets/button_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/textfield_container_widget.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  // UserEntity current user
  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
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
          const Text(
            "Remove profile photo",
            style: TextStyle(
                color: Colors.green, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldContainerWidget(
            controller: _nameController,
            hintText: 'name',
            prefixIcon: Icons.person,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextFieldContainerWidget(
            hintText: 'email',
            prefixIcon: Icons.email,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldContainerWidget(
            controller: _statusController,
            hintText: 'status',
            prefixIcon: Zocial.statusnet,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1.50,
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonWidget(
            title: 'Update Profile',
            onTap: _updateUserProfile,
          ),
        ],
      ),
    );
  }

  void _updateUserProfile() {
    BlocProvider.of<UserCubit>(context).updateUser(
        user: UserEntity(
      uid: widget.uid,
      name: _nameController.text,
      status: _statusController.text,
    ));
  }
}
