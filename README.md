# :nut_and_bolt: Flutter Augment :nut_and_bolt:

[![Flutter](https://img.shields.io/badge/Flutter-1.7-blue.svg)](https://flutter.dev/)
[![flutter_arkit_plugin](https://img.shields.io/badge/flutter_arkit_plugin-0.2.1-green.svg)](https://pub.dev/packages/arkit_plugin)

### Develop augmented reality applications for iOS without the boilerplate

#### Author: Peter Swanson

:warning: (Work in Progress)

## Overview

Jumping into augmented reality development can be tough, especially if you're using Flutter. This library aims to greatly simplify that process.

[Oleksandr Leuschenko's port of ARKit](https://pub.dev/packages/arkit_plugin) removes a ton of the boilerplate required to get an AR app running in Flutter. My goal is to try to extend this port into a simple framework that supports.

* **Model Management:**
  * Easy 2D/3D model creation and state management. 
  * Model joining with shared and individual attributes.
  * Model parent-child and sibling relationships.
  * Model serialization and deserialization.
  * Pre-built models.

####

* **An Engine:**
  * An extendable update loop ([think Unity](https://docs.unity3d.com/Manual/ExecutionOrder.html)) that allows for model movement and animation.
  * Simplified physics management.

####

* **Media Queries:**
  * An interface for fetching/using external audio, image and text files.

####

* **Event Management:**
  * Intuitive handlers/bindings for user and sensor input.

## Current Features

* **Model Management:**
  * Basic model manager that tracks rendered models by key, and can broadcast a state update call to all rendered models
  * A pre-built sphere :P

####

* **An Engine:**
  * A basic extendable update loop ([think Unity](https://docs.unity3d.com/Manual/ExecutionOrder.html)) that updates the scene on a specified interval.
  * Some physics:
    * Movement - Move models in the scene along the x, y and z-axis.
    * Rotation - Rotate models in the scene along the x, y and z-axis.

####

* **Event Management:**
  * Boundaries:
    * Detect and execute an optional callback when a model exceeds a specified axis boundary.

####

* **Media Queries:**
  * Interface for fetching a JSON configuration file stored in assets/config.json
  * Model texture rendering from images stored in assets/images/ ([awaiting accepted pull request](https://github.com/olexale/arkit_flutter_plugin/pull/23))

## Installing/Running

You can install the current (work in progress version) by cloning this repo.
When a release candidate is ready expect a standalone package!

There's a demo renderer and app in place, just ensure all [flutter_arkit_plugin dependencies](https://pub.dev/packages/arkit_plugin#-installing-tab-) dependencies are installed.

Note that AR apps cannot be run using the iOS simulator as it has no camera access.

## API Reference

COMING SOON

## Library Hierarchy

### Managers/

* **model_manager.dart:** Tracks created ARKitNodes and updates them asynchronously on a loop.
* **asset_manager.dart:** Allows content to be loaded from files.

### Models/

* ARKitNodes (AR objects) extended with tracking information and methods used by the model manager.
  * **Base/**
    * **base_model.dart:** The base attributes and methods that all models share.
  * **Shapes/**
    * **sphere.dart**

### Physics/

* Physics mixins allowing models to easily be extended with different behaviors.

  * **movement.dart:** Move a model along one or more axis.
  * **boundaries.dart:** Check (and execute functions) if a model has exceeded an axis boundary.

### Renderers/

* Manages the scene displayed to the user, global events, the model manager, and the application's update loop. Displays the scene as a Flutter widget.

  * **Base/**
    * **base_renderer.dart:** The base attributes and methods that all renderers share.
    * **demo_renderer.dart:** A demo renderer to show how renderers can be extended with arbitrary AR application logic.

## In-Progress

### Physics

* ~~Movement~~
* Collisions
* Gravity

### Engine

* Parent-Child Relationships / Grouping / Joining
  * Individual properties
  * Group properties
