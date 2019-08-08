library AR_Manager_Library;
/*
    Author: Peter Swanson
    Description: Model Manager Library
      Model manager resources and dependencies

      The model manager tracks ARKitNodes in a scene and updates them 
      asynchronously on a loop. ARKitNodes are wrapped in an AR_Model 
      so that the manager can track state information
      (see Models/Base/base_model.dart).
*/

import 'dart:async';
import 'package:flutter_arkit_wrapper/Models/lib.dart';

part 'model_manager.dart';