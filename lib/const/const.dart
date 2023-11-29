export './images.dart';
export './styles.dart';
export './strings.dart';
export './colors.dart';
export './lists.dart';
export 'package:velocity_x/velocity_x.dart';
export 'package:get/get.dart';
export 'package:flutter/material.dart';

class Todo {
  final String title;
  bool isDone;

  Todo({
    required this.title,
    this.isDone = false,
  });
}
