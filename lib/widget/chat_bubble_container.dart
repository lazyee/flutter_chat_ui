import 'package:flutter/material.dart';

class ChatBubbleContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets marrgin;
  final CustomClipper<Path>? clipper;
  final Color? color;
  final double maxWidth;
  final double minHeight;
  const ChatBubbleContainer(
      {Key? key,
      required this.child,
      required this.maxWidth,
      this.minHeight = 40,
      this.clipper,
      this.color = Colors.white,
      this.padding = EdgeInsets.zero,
      this.marrgin = EdgeInsets.zero})
      : super(key: key);

  Widget _buildChild() {
    Widget widget = Container(
      constraints: BoxConstraints(maxWidth: maxWidth, minHeight: minHeight),
      padding: padding,
      // alignment: Alignment.centerLeft,
      color: color,
      child: child,
    );
    if (clipper == null) return widget;
    return ClipPath(child: widget, clipper: clipper!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marrgin,
      child: _buildChild(),
    );
  }
}
