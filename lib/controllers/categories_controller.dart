import 'package:get/get.dart';


class CategoriesController extends GetxController {
  var selectedCategorie = ''.obs;

  setCategorie (categorie) {
    if(selectedCategorie.value == categorie) {
      selectedCategorie.value = '';
    }
    else {
      selectedCategorie.value = categorie;
    }
  }
}