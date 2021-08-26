import 'dart:math';

import 'package:flutter/material.dart';

//别人发的聊天气泡
class ChatOtherBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double radius = 5;
    double width = size.width;
    double height = size.height;
    double marrginLeft = 4;
    final leftTopRect = Rect.fromLTRB(marrginLeft, 0, radius * 2, radius * 2);
    final leftBottomRect =
        Rect.fromLTRB(marrginLeft, height - radius * 2, radius * 2, height);
    final rightTopRect =
        Rect.fromLTRB(width - 2 * radius, 0, width, radius * 2);
    final rightBottomRect =
        Rect.fromLTRB(width - 2 * radius, height - radius * 2, width, height);

    //左上角 圆弧
    path.arcTo(leftTopRect, 180 / 180 * pi, 90 / 180 * pi, false);

    //右上角圆弧
    path.lineTo(marrginLeft - radius, 0);
    path.arcTo(rightTopRect, 270 / 180 * pi, 90 / 180 * pi, false);

    //右下角
    path.lineTo(width, height - radius);
    path.arcTo(rightBottomRect, 0, 90 / 180 * pi, false);
    //左下角
    path.lineTo(radius, height);
    path.arcTo(leftBottomRect, 90 / 180 * pi, 90 / 180 * pi, false);

    path.lineTo(marrginLeft, 15);
    path.lineTo(0, 19); //
    path.lineTo(marrginLeft, 23);
    path.close();
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

///自己发的聊天气泡
class ChatSenderBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double radius = 5;
    double width = size.width;
    double height = size.height;
    double marrginRight = 4;
    final leftTopRect = Rect.fromLTRB(0, 0, radius * 2, radius * 2);
    final leftBottomRect =
        Rect.fromLTRB(0, height - radius * 2, radius * 2, height);
    final rightTopRect = Rect.fromLTRB(
        width - marrginRight - 2 * radius, 0, width - marrginRight, radius * 2);
    final rightBottomRect = Rect.fromLTRB(width - marrginRight - 2 * radius,
        height - radius * 2, width - marrginRight, height);

    //左上角 圆弧
    path.arcTo(leftTopRect, 180 / 180 * pi, 90 / 180 * pi, false);
    //右上角圆弧
    path.lineTo(width - marrginRight - radius, 0);
    path.arcTo(rightTopRect, 270 / 180 * pi, 90 / 180 * pi, false);

    path.lineTo(size.width - marrginRight, 15);
    path.lineTo(size.width, 19); //
    path.lineTo(size.width - marrginRight, 23);

    //右下角
    path.lineTo(width - marrginRight, height - radius);
    path.arcTo(rightBottomRect, 0, 90 / 180 * pi, false);
    //左下角
    path.lineTo(radius, height);
    path.arcTo(leftBottomRect, 90 / 180 * pi, 90 / 180 * pi, false);
    path.close();
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


// //别人发的聊天气泡
// class ChatOtherBubbleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     final double radius = 5.w;
//     double width = size.width;
//     double height = size.height;
//     double marrginLeft = 4.w;
//     final leftTopRect = Rect.fromLTRB(marrginLeft, 0, radius * 2, radius * 2);
//     final leftBottomRect =
//         Rect.fromLTRB(marrginLeft, height - radius * 2, radius * 2, height);
//     final rightTopRect =
//         Rect.fromLTRB(width - 2 * radius, 0, width, radius * 2);
//     final rightBottomRect =
//         Rect.fromLTRB(width - 2 * radius, height - radius * 2, width, height);

//     //左上角 圆弧
//     path.arcTo(leftTopRect, 180 / 180 * pi, 90 / 180 * pi, false);

//     //右上角圆弧
//     path.lineTo(marrginLeft - radius, 0);
//     path.arcTo(rightTopRect, 270 / 180 * pi, 90 / 180 * pi, false);

//     //右下角
//     path.lineTo(width, height - radius);
//     path.arcTo(rightBottomRect, 0, 90 / 180 * pi, false);
//     //左下角
//     path.lineTo(radius, height);
//     path.arcTo(leftBottomRect, 90 / 180 * pi, 90 / 180 * pi, false);

//     path.lineTo(marrginLeft, 15.w);
//     path.lineTo(0, 19.w); //
//     path.lineTo(marrginLeft, 23.w);
//     path.close();
//     // path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// ///自己发的聊天气泡
// class ChatSenderBubbleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     final double radius = 5.w;
//     double width = size.width;
//     double height = size.height;
//     double marrginRight = 4.w;
//     final leftTopRect = Rect.fromLTRB(0, 0, radius * 2, radius * 2);
//     final leftBottomRect =
//         Rect.fromLTRB(0, height - radius * 2, radius * 2, height);
//     final rightTopRect = Rect.fromLTRB(
//         width - marrginRight - 2 * radius, 0, width - marrginRight, radius * 2);
//     final rightBottomRect = Rect.fromLTRB(width - marrginRight - 2 * radius,
//         height - radius * 2, width - marrginRight, height);

//     //左上角 圆弧
//     path.arcTo(leftTopRect, 180 / 180 * pi, 90 / 180 * pi, false);
//     //右上角圆弧
//     path.lineTo(width - marrginRight - radius, 0);
//     path.arcTo(rightTopRect, 270 / 180 * pi, 90 / 180 * pi, false);

//     path.lineTo(size.width - marrginRight, 15.w);
//     path.lineTo(size.width, 19.w); //
//     path.lineTo(size.width - marrginRight, 23.w);

//     //右下角
//     path.lineTo(width - marrginRight, height - radius);
//     path.arcTo(rightBottomRect, 0, 90 / 180 * pi, false);
//     //左下角
//     path.lineTo(radius, height);
//     path.arcTo(leftBottomRect, 90 / 180 * pi, 90 / 180 * pi, false);
//     path.close();
//     // path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
