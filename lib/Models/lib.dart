library AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Models Library
      AR Models and dependencies

      Models wrap an ARKitNode, allowing them to be tracked
      by a model manager and updated asynchronously on a loop 
      (see Model_Manager/model_manager.dart). 

    Models:
      - Base: The base model all models inherit from
      - Shapes: (Sphere, )
*/

import 'dart:ui';

import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as Vector;
import 'package:flutter_arkit_wrapper/Physics/lib.dart';

part 'Base/base_model.dart';
part 'Base/graphics.dart';
part 'Base/physics.dart';
part 'Base/properties.dart';

part 'Shapes/sphere.dart';

part 'Shapes/moving_sphere.dart';
part 'Shapes/rotating_sphere.dart';
