import 'package:flutter/material.dart';

import 'custom_extended_text_selection.dart';
import 'custom_extended_text_typedef.dart';

///
///  create by zmtzawqlp on 2019/6/6
///

///help to handle multiple selectionable text on same page.
///放在所有用到extendedText的父组件中,用来控制selectionable
///
class CustomExtendedTextSelectionPointerHandler extends StatefulWidget {
  const CustomExtendedTextSelectionPointerHandler({this.child, this.builder})
      : assert(!(child == null && builder == null)),
        assert(!(child != null && builder != null));
  final Widget? child;
  final CustomTextSelectionPointerHandlerWidgetBuilder? builder;
  @override
  CustomExtendedTextSelectionPointerHandlerState createState() =>
      CustomExtendedTextSelectionPointerHandlerState();
}

class CustomExtendedTextSelectionPointerHandlerState
    extends State<CustomExtendedTextSelectionPointerHandler> {
  final List<CustomExtendedTextSelectionState> _selectionStates =
      <CustomExtendedTextSelectionState>[];
  List<CustomExtendedTextSelectionState> get selectionStates =>
      _selectionStates;

  @override
  Widget build(BuildContext context) {
    if (widget.builder != null) {
      return widget.builder!(_selectionStates);
    }
    return Listener(
      child: widget.child,
      behavior: HitTestBehavior.translucent,
      onPointerDown: (PointerDownEvent value) {
        for (final CustomExtendedTextSelectionState state in _selectionStates) {
          if (!state.containsPosition(value.position)) {
            //clear other selection
            state.clearSelection();
          }
        }
      },
      onPointerMove: (PointerMoveEvent value) {
        //clear other selection
        for (final CustomExtendedTextSelectionState state in _selectionStates) {
          state.clearSelection();
        }
      },
    );
  }
}
