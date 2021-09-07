import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/widget/chat_bubble_container.dart';
import 'package:flutter_chat_ui/widget/extended_text/custom/custom_extended_text_selection.dart';

import 'extended_text/custom/custom_extended_selection_text.dart';

class ChatTextBubbleContainer extends StatelessWidget {
  final String text;
  final TextStyle style;
  final EdgeInsets padding;
  final EdgeInsets marrgin;
  final CustomClipper<Path>? clipper;
  final Color? color;
  final double maxWidth;
  final double minHeight;
  const ChatTextBubbleContainer(
      {Key? key,
      required this.text,
      required this.maxWidth,
      this.minHeight = 40,
      this.clipper,
      this.style = const TextStyle(fontSize: 12),
      this.color = Colors.white,
      this.padding = EdgeInsets.zero,
      this.marrgin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<CustomExtendedTextSelectionState> _globalKey = GlobalKey();
    return ChatBubbleContainer(
        child: CustomExtendedSelectionText(
          text,
          customExtendedSelectionTextStateGlobalKey: _globalKey,
          style: style,
        ),
        onLongPress: () {
          print('onLongPress:${_globalKey.currentState}');
          _globalKey.currentState?.selectAll();

          print(_globalKey.currentState?.textEditingValue.text);
        },
        maxWidth: maxWidth,
        padding: padding,
        color: color,
        marrgin: marrgin,
        clipper: clipper);
  }
}
