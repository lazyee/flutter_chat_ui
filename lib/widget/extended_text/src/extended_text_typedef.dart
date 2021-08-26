import 'package:flutter/material.dart';

import 'selection/extended_text_selection.dart';

///
///  create by zmtzawqlp on 2019/6/5
///

///builder of textSelectionPointerHandler,you can use this to custom your selection behavior
typedef TextSelectionPointerHandlerWidgetBuilder = Widget Function(
    List<ExtendedTextSelectionState> state);
