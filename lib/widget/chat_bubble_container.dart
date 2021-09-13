import 'package:flutter/material.dart';

class ChatBubbleContainer extends StatefulWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets marrgin;
  final CustomClipper<Path>? clipper;
  final Color? color;
  final double maxWidth;
  final double minHeight;
  final GestureLongPressCallback? onLongPress;
  const ChatBubbleContainer(
      {Key? key,
      required this.child,
      required this.maxWidth,
      this.minHeight = 40,
      this.onLongPress,
      this.clipper,
      this.color = Colors.white,
      this.padding = EdgeInsets.zero,
      this.marrgin = EdgeInsets.zero})
      : super(key: key);

  @override
  ChatBubbleContainerState createState() => ChatBubbleContainerState();
}

class ChatBubbleContainerState extends State<ChatBubbleContainer> {
  late Color color;
  @override
  void initState() {
    super.initState();
    color = widget.color!;
  }

  Widget _buildChild() {
    Widget child = Container(
      constraints: BoxConstraints(
          maxWidth: widget.maxWidth, minHeight: widget.minHeight),
      padding: widget.padding,
      // alignment: Alignment.centerLeft,
      color: color,
      child: widget.child,
    );
    if (widget.clipper == null) return widget;
    return ClipPath(child: child, clipper: widget.clipper!);
  }

  int _getTapDownColorChannelValue(int value) {
    if (value >= 10) {
      return value - 10;
    }
    if (value > 0 && value < 10) {
      return 0;
    }

    if (value == 0) {
      return value + 10;
    }

    return value;
  }

  void _resetColor() {
    setState(() {
      color = widget.color!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (detail) {
          setState(() {
            color = color
                .withBlue(_getTapDownColorChannelValue(color.blue))
                .withGreen(_getTapDownColorChannelValue(color.green))
                .withRed(_getTapDownColorChannelValue(color.red));
          });
        },
        onTapUp: (details) {
          _resetColor();
        },
        // onLongPress: () {
        //   print('onLongPress');
        // },
        onLongPress: widget.onLongPress,
        onPanCancel: () {
          _resetColor();
        },
        onPanEnd: (details) {
          _resetColor();
        },
        child: Container(
          margin: widget.marrgin,
          child: _buildChild(),
        ));
  }
}
