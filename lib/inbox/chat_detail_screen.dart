import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _textEditingController =
  TextEditingController(text: null);
  late final AnimateIconController _animateIconController=AnimateIconController();
  bool _isSending=false;
  void _onSendSubmitted() {
    print(_textEditingController.text);
    _textEditingController.text = "";
    FocusScope.of(context).unfocus();
    setState(() {
      _isSending = false;
    });
  }
  bool onEndIconPress(BuildContext context) {
    return true;
  }
  bool onStartIconPress(BuildContext context) {
    return true;
  }
  void _onStartSending() {
    setState(() {
      _isSending = true;
    });
  }
  void _onBodyTap() {
    FocusScope.of(context).unfocus();
  }
  @override
  void dispose() {
    _textEditingController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/126032661?v=4",
                ),
              ),
              Positioned(
                right: -4,
                bottom: -4,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      Sizes.size16,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 1,
                bottom: 1,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(
                      Sizes.size16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            '김혁준',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text('Active now'),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: _onBodyTap,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size14,
              ),
              itemBuilder: (context, index) {
                final isMine = index % 2 == 0;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(Sizes.size14),
                      decoration: BoxDecoration(
                        color:
                            isMine ? Colors.blue : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(
                            Sizes.size20,
                          ),
                          topRight: const Radius.circular(
                            Sizes.size20,
                          ),
                          bottomLeft: Radius.circular(
                            isMine ? Sizes.size20 : Sizes.size5,
                          ),
                          bottomRight: Radius.circular(
                            !isMine ? Sizes.size20 : Sizes.size5,
                          ),
                        ),
                      ),
                      child: const Text(
                        "this is a message!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 10,
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size18,
                horizontal: Sizes.size18,
              ),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      onTap: _onStartSending,
                      expands: true,
                      minLines: null,
                      maxLines: null,
                      textInputAction: TextInputAction.newline,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        hintText: "Send a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            Sizes.size16,
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size12,
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimateIcons(
                              startIcon: Icons.face_3,
                              startIconColor: Colors.grey.shade900,
                              endIcon: Icons.face_6,
                              size: Sizes.size28,
                              controller: _animateIconController,
                              onEndIconPress: () => onEndIconPress(context),
                              onStartIconPress: () => onStartIconPress(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  GestureDetector(
                    onTap: _onSendSubmitted,
                    child: CircleAvatar(
                      backgroundColor: !_isSending ? Colors.grey.shade300 : Colors.white,
                      child: FaIcon(
                        FontAwesomeIcons.solidPaperPlane,
                        color: !_isSending ? Colors.white : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
