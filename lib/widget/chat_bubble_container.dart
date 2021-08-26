import 'package:flutter/material.dart';

class ChatBubbleContainer extends StatelessWidget {
  final Widget child;
  final CustomClipper<Path>? clipper;
  const ChatBubbleContainer({Key? key, required this.child, this.clipper})
      : super(key: key);

  Widget _buildClipChild() {
    return ClipPath(child: child, clipper: clipper!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: clipper == null ? child : _buildClipChild(),
    );
  }
}
