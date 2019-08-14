part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Graphics Mixin
      Used to apply textures, colors, lighting and other graphics to models.

      Methods:
        - apply_texture(): Apply an image or color to the model. Images are
                           loaded from /assets/images/.
*/

mixin AR_Model_Graphics {
  void apply_texture({AR_Model model, Color color, String image})
  {
    /* Apply an image or color to the model */

    model.node.geometry.materials.value.add(ARKitMaterial(diffuse: ARKitMaterialProperty(color: color, image: (image != null) ? '$image' : null)));
    model.node.geometry.materials.notifyListeners();
  }

  void apply_lighting({AR_Model model})
  {
    //ARKitMaterial new_material = new ARKitMaterial()
    /* Apply lighting to the model */
  }
}