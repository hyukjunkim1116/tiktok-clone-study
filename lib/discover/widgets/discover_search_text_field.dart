import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class DiscoverSearchTextField extends StatefulWidget {
  final bool isSearching;
  final Function setIsSearching;
  final Function setIsntSearching;
  const DiscoverSearchTextField({
    super.key,
    required this.isSearching,
    required this.setIsSearching,
    required this.setIsntSearching,
  });

  @override
  State<DiscoverSearchTextField> createState() =>
      _DiscoverSearchTextFieldState();
}

class _DiscoverSearchTextFieldState extends State<DiscoverSearchTextField> {
  final TextEditingController _textEditingController =
  TextEditingController(text: null);

  void _onSearchTextDeleted() {
    _textEditingController.text = "";
  }

  void _onSearchSubmitted() {
    print(_textEditingController.text);
    _textEditingController.text = "";
    FocusScope.of(context).unfocus();
    widget.setIsntSearching();
  }

  void _onBackPressed() {
    print("here123");
  }

  void _onStartSearching() {
    widget.setIsSearching();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gaps.h5,
        GestureDetector(
          onTap: _onBackPressed,
          child: const FaIcon(
            FontAwesomeIcons.chevronLeft,
            size: Sizes.size28,
          ),
        ),
        Gaps.h16,
        Expanded(
          child: SizedBox(
            height: Sizes.size44,
            child: TextField(
              controller: _textEditingController,
              onTap: _onStartSearching,
              expands: true,
              minLines: null,
              maxLines: null,
              textInputAction: TextInputAction.newline,
              cursorColor: Theme
                  .of(context)
                  .primaryColor,
              decoration: InputDecoration(
                prefixIcon: Container(
                  height: Sizes.size44,
                  width: Sizes.size44,
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: _onSearchSubmitted,
                    child: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.grey.shade900,
                      size: Sizes.size20,
                    ),
                  ),
                ),
                hintText: "Search post...",
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size1,
                ),
                suffixIcon: Container(
                  height: Sizes.size44,
                  width: Sizes.size44,
                  alignment: Alignment.center,
                  child: Visibility(
                    visible: widget.isSearching,
                    child: GestureDetector(
                      onTap: _onSearchTextDeleted,
                      child: FaIcon(
                        FontAwesomeIcons.xmark,
                        color: Colors.grey.shade900,
                        size: Sizes.size20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Gaps.h16,
        const FaIcon(
          FontAwesomeIcons.gears,
          size: Sizes.size28,
        ),
        Gaps.h5,
      ],
    );
  }
}
