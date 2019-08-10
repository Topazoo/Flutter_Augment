library AR_Rendering_Library;
/*
    Author: Peter Swanson
    Description: Rendering Library
      Manages the scene state and models in the scene. A renderer is 
      in essence the overall AR application logic. It handles adding the models
      to the scene, global events, and the application update loop.

    Renderers:
      - Base: The base model all models inherit from
      - Demo: A demo renderer to show how renderers can be extended
              with arbitrary AR application logic.
*/

import 'dart:async';

import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:arkit_plugin/utils/random_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arkit_wrapper/Models/lib.dart';
import 'package:flutter_arkit_wrapper/Model_Manager/lib.dart';

part 'Base/base_renderer.dart';
part 'demo_renderer.dart';
