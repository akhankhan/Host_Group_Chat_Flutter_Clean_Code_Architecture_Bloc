import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:host_group_chat/constant.dart';
import 'package:host_group_chat/features/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:host_group_chat/features/presentation/pages/tabs/group_page.dart';
import 'package:host_group_chat/features/presentation/pages/tabs/profile_page.dart';
import 'package:host_group_chat/features/presentation/pages/tabs/users_page.dart';
import 'package:host_group_chat/features/presentation/widgets/custom_tool_bar_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/textfield_container_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/theme/style.dart';

class HomePage extends StatefulWidget {
  final String uid;
  const HomePage({super.key, required this.uid});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageViewController = PageController(initialPage: 0);
  bool _isSearching = false;
  int _toolBarPageIndex = 0;

  final List<String> _popMenuList = ["Logout"];

  List<Widget> get pages => [
        const GroupPage(),
        const UsersPage(),
        ProfilePage(uid: widget.uid),
      ];

  @override
  void dispose() {
    _searchController.dispose();
    _pageViewController.dispose();
    super.dispose();
  }

  Widget _buildSearchWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 35),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 2,
            spreadRadius: 1,
            offset: const Offset(0, 0.50),
          ),
        ],
      ),
      child: TextFieldContainerWidget(
        controller: _searchController,
        prefixIcon: Icons.arrow_back,
        hintText: "Search...",
        keyboardType: TextInputType.text,
        borderRadius: 0,
        color: Colors.white,
        iconClickEvent: () {
          setState(() {
            _isSearching = !_isSearching;
          });
        },
      ),
    );
  }

  Widget _emptyWidget() {
    return const SizedBox(
      height: 0,
      width: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:
            _isSearching == true ? Colors.transparent : primaryColor,
        title: _isSearching == true
            ? _emptyWidget()
            : const Text(
                AppConst.appName,
              ),
        flexibleSpace:
            _isSearching == true ? _buildSearchWidget() : _emptyWidget(),
        actions: _isSearching == true
            ? []
            : [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isSearching = !_isSearching;
                    });
                  },
                  child: const Icon(Icons.search),
                ),
                PopupMenuButton(
                    onSelected: (value) {
                      if (value == "Logout") {
                        BlocProvider.of<AuthCubit>(context).loggedOut();
                      }
                    },
                    itemBuilder: (_) => _popMenuList.map((menuItem) {
                          return PopupMenuItem(
                            value: menuItem,
                            child: Text(menuItem),
                          );
                        }).toList()),
              ],
      ),
      body: Column(
        children: [
          _isSearching == true
              ? _emptyWidget()
              : CustomToolBarWidget(
                  pageIndex: _toolBarPageIndex,
                  toolbarIndexController: (int index) {
                    log("CURRENT PAGE: $index");
                    setState(() {
                      _toolBarPageIndex = index;
                    });
                    _pageViewController.jumpToPage(index);
                  },
                ),
          Expanded(
            child: PageView.builder(
              controller: _pageViewController,
              onPageChanged: (index) {
                setState(() {
                  _toolBarPageIndex = index;
                });
              },
              itemCount: pages.length,
              itemBuilder: ((context, index) {
                return pages[index];
              }),
            ),
          )
        ],
      ),
    );
  }
}
