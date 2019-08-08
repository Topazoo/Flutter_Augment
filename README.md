# Flutter Augment

Author: Peter Swanson
(Work in Progress)

[![arkit_plugin](https://img.shields.io/badge/arkit_plugin-0.2.1-green.svg)](https://pub.dev/packages/arkit_plugin)

Easy to use library for iOS augmented reality using Flutter and ARKit.

## Hierarchy

### Model_Manager/

* Tracks created ARKitNodes and updates them asynchronously on a loop.

### Models/

* ARKitNodes (AR objects) extended with tracking information and methods used by the model manager.
  * **Base/base_model.dart:** The base attributes and methods that all models share.

### Rendering/

* Manages the scene displayed to the user and the model manager itself.

### Widgets/

* ARKitNodes (AR objects) extended with tracking information and methods used by the model manager.
  * **ar_scene.dart:** A Flutter widget tied to a renderer. Displays (contains) the AR application.

## In-Progress

### Physics

* Movement
* Collisions

### Visuals

* Load models, textures, colors, etc.

### Audio

* Load/play sounds
