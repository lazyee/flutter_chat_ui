import 'package:flutter/material.dart';

import 'library.dart';

OverlayEntry? _chatToolBarOverlayEntry;
void showChatToolBar(BuildContext context, Offset offset, Size bubbleSise) {
  _chatToolBarOverlayEntry?.remove();
  _chatToolBarOverlayEntry = null;
  _chatToolBarOverlayEntry = OverlayEntry(builder: (context) {
    return ChatToolBar(offset: offset, bubbleSize: bubbleSise);
  });
  Overlay.of(context)?.insert(_chatToolBarOverlayEntry!);
}

class ChatToolBar extends StatefulWidget {
  final Offset offset;
  final Size bubbleSize;
  ChatToolBar({Key? key, required this.bubbleSize, required this.offset})
      : super(key: key);

  @override
  _ChatToolBarState createState() => _ChatToolBarState();
}

class _ChatToolBarState extends State<ChatToolBar> {
  double get width => 100;
  double get height => 50;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          _chatToolBarOverlayEntry?.remove();
          _chatToolBarOverlayEntry = null;
        },
        child: Container(
            color: Colors.red.withAlpha(100),
            child: Stack(children: [
              Positioned(
                  left:
                      widget.offset.dx + (widget.bubbleSize.width - width) / 2,
                  top: widget.offset.dy - height - 5,
                  child: PhysicalModel(
                      color: Colors.transparent,
                      elevation: 10,
                      shadowColor: Colors.black.withAlpha(60),
                      // borderRadius: BorderRadius.circular(10),
                      child: ClipPath(
                          clipper: ChatToolBarClipper(),
                          child: Container(
                            color: Colors.white,
                            child: SizedBox(width: 100, height: 50),
                          ))))
            ])));
  }
}

// class ChatToolbar extends StatelessWidget {
//   const ChatToolbar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // color: Colors.red.withAlpha(100),
//         child: Stack(children: [
//       Positioned(
//           child: ClipPath(
//               clipper: ChatToolBarClipper(),
//               child: Container(
//                 color: Colors.white,
//                 child: SizedBox(width: 100, height: 50),
//               )))
//     ]));
//   }
// }
