part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Graphics Mixin
      Used to apply textures, colors, lighting and other graphics to models.

      Methods:
        - apply_texture(): Apply an image or color to the model. Images are
                           loaded from /assets/images/.
        - apply_lighting(): Apply lighting to the model. Options are:
                            lambert, blinn, constant, phong and physical.
*/

mixin AR_Model_Graphics {
  void apply_texture({AR_Model model, Color color, String image})
  {
    /* Apply an image or color to the model */

    model.node.geometry.materials.value.add(ARKitMaterial(diffuse: ARKitMaterialProperty(color: color, image: (image != null) ? '$image' : null)));
    model.node.geometry.materials.notifyListeners();
  }

  void apply_lighting({AR_Model model, String lighting})
  {
    /* Apply lighting to the model */

    ARKitMaterial new_lighting;

    if(lighting == 'lambert')
      new_lighting = ARKitMaterial(lightingModelName: ARKitLightingModel.lambert); 
    else if(lighting == 'blinn')
      new_lighting = ARKitMaterial(lightingModelName: ARKitLightingModel.blinn);
    else if(lighting == 'constant')
      new_lighting = ARKitMaterial(lightingModelName: ARKitLightingModel.constant);
    else if(lighting == 'phong')
      new_lighting = ARKitMaterial(lightingModelName: ARKitLightingModel.phong);
    else if(lighting == 'physical')
      new_lighting = ARKitMaterial(lightingModelName: ARKitLightingModel.physicallyBased);

    if(new_lighting != null)
    {
      model.node.geometry.materials.value.add(new_lighting);
      model.node.geometry.materials.notifyListeners();
    }

  }
}