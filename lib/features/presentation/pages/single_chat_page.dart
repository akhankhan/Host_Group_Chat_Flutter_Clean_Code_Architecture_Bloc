import 'package:flutter/material.dart';
import 'package:host_group_chat/features/presentation/widgets/theme/style.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({super.key});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    _messageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("group name"),
      ),
      body: Column(
        children: [
          Expanded(
            child: _listMessagesWidget(),
          ),
          _inputMessageTextField(),
        ],
      ),
    );
  }

  _listMessagesWidget() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const Text("");
      },
    );
  }

  _inputMessageTextField() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(80),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ]),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.insert_emoticon),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Scrollbar(
                      child: TextField(
                        controller: _messageController,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'Type a message',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.link),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.camera_alt),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.circular(45),
            ),
            child: Icon(
                _messageController.text.isEmpty ? Icons.mic : Icons.send,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
