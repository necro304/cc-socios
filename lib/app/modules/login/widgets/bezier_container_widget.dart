import 'dart:math';

import 'package:flutter/material.dart';

import 'custom_clipper_widget.dart';

class BezierContainer extends StatelessWidget {
  final double pageHeight;
  final double pageWidth;
  const BezierContainer( { Key key, this.pageHeight, this.pageWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
          angle: -pi / 3.5,
          child: ClipPath(
            clipper: ClipPainter(),
            child: Container(
              height: pageHeight != null ? pageHeight *.5 :  MediaQuery.of(context).size.height *.5,
              width: pageWidth != null ? pageWidth : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.green, Colors.lightGreen]
                  )
              ),
            ),
          ),
        )
    );
  }
}