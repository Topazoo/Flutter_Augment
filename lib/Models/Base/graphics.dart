part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Graphics Mixin 
*/

mixin AR_Graphics {
  void apply_color({AR_Model model, Color color, String image})
  {
    /* Apply a material to the model */

    model.node.geometry.materials.value.add(ARKitMaterial(diffuse: ARKitMaterialProperty(color: color, image: (image != null) ? '$image' : null)));
    model.node.geometry.materials.notifyListeners();
  }

  void apply_lighting({AR_Model model})
  {
    //ARKitMaterial new_material = new ARKitMaterial()
    /* Apply lighting to the model */
  }
}