import 'package:flutter/material.dart';
import 'package:flutter_arkit_wrapper/Renderers/lib.dart';
import 'package:flutter_arkit_wrapper/Widgets/lib.dart';

void main() {
  Base_Renderer renderer = Demo_Renderer();
  
  return runApp(
    MaterialApp(
      home: AR_Scene_Widget(renderer: renderer)
    )
  );
}
