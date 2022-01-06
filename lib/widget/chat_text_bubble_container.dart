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
    final GlobalKey<CustomExtendedTextSelectionState> _textGlobalKey =
        GlobalKey();
    final GlobalKey<ChatBubbleContainerState> _bubbleGlobalKey = GlobalKey();
    return ChatBubbleContainer(
        key: _bubbleGlobalKey,
        child: CustomExtendedSelectionText(
          text,
          customExtendedSelectionTextStateGlobalKey: _textGlobalKey,
          style: style,
        ),
        onLongPress: () {
          // RenderBox? renderBox =
          //     _bubbleGlobalKey.currentContext?.findRenderObject() as RenderBox;
          // Offset offset = renderBox.localToGlobal(Offset.zero);
          // renderBox.size;
          // .print('onLongPress:${_textGlobalKey.currentState}');
          // showChatToolBar(context, offset, renderBox.size);
          _textGlobalKey.currentState
              ?.selectAll(SelectionChangedCause.longPress);

          print(_textGlobalKey.currentState?.textEditingValue.text);
        },
        maxWidth: maxWidth,
        padding: padding,
        color: color,
        marrgin: marrgin,
        clipper: clipper);
  }
}
