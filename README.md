# :nut_and_bolt: Flutter Augment :nut_and_bolt:

[![Flutter](https://img.shields.io/badge/Flutter-1.7-blue.svg)](https://flutter.dev/)
[![flutter_arkit_plugin](https://img.shields.io/badge/flutter_arkit_plugin-0.2.1-green.svg)](https://pub.dev/packages/arkit_plugin)
### Develop augmented reality applications for iOS without the boilerplate
#### Author: Peter Swanson 
:warning: (Work in Progress)

## Hierarchy

### Model_Manager/

* Tracks created ARKitNodes and updates them asynchronously on a loop.

### Models/

* ARKitNodes (AR objects) extended with tracking information and methods used by the model manager.
  * **Base/**
    * **base_model.dart:** The base attributes and methods that all models share.
  * **Shapes/**
    * **sphere.dart** 

### Renderers/

* Manages the scene displayed to the user, global events, the model manager, and the application's update loop.

  * **Base/**
    * **base_renderer.dart:** The base attributes and methods that all renderers share.

### Widgets/

* ARKitNodes (AR objects) extended with tracking information and methods used by the model manager.
  * **scene_widget.dart:** A Flutter widget tied to a renderer. Displays (contains) the AR application.

## In-Progress

### Physics

* Movement
* Collisions
* Gravity

### Engine

* Model Serialization
* Parent-Child Relationships
  * Individual properties
  * Group properties
* Better Interfaces for All Classes

### Visuals

* Textures
* Colors
* Lighting

### Audio

* Load/Play
