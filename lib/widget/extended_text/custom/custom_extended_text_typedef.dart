import 'package:flutter/material.dart';

import 'custom_extended_text_selection.dart';

///
///  create by zmtzawqlp on 2019/6/5
///

///builder of textSelectionPointerHandler,you can use this to custom your selection behavior
typedef CustomTextSelectionPointerHandlerWidgetBuilder = Widget Function(
    List<CustomExtendedTextSelectionState> state);
