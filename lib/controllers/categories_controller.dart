import 'package:get/get.dart';


class CategoriesController extends GetxController {
  var selectedCategorie = ''.obs;
  var allDoctorsList = [].obs;
  var filteredDoctorsList = [].obs;
  var doctorsList = [].obs;

  RxString signupPhotoDoctor = ''.obs;
  RxString signupPhotoPatient = ''.obs;

  setSignupPhotoDoctor(photoUrl) => signupPhotoDoctor.value = photoUrl;

  setSignupPhoto(photoUrl) => signupPhotoDoctor.value = photoUrl;

  setDoctorsList (newList) {
    doctorsList.value = newList;
  }
  setAllDoctorsList(newList) {
    allDoctorsList.value = newList;
    setDoctorsList(newList);
  }

  setCategorie (categorie) {
    if(selectedCategorie.value == categorie) {
      selectedCategorie.value = '';
    }
    else {
      selectedCategorie.value = categorie;
    }
    updateTopDoctor();

  }
  updateTopDoctor() {
    var newList = [];
    if(selectedCategorie.value != '') {
       for (var e in allDoctorsList) {
         if(e["organ"] == selectedCategorie.toString()) {
           newList.add(e);
         }
       }
       doctorsList.value = newList;
       filteredDoctorsList.value = newList;
    }
    else if(selectedCategorie.value == '') {
      doctorsList.value = allDoctorsList;
      filteredDoctorsList.value = [];
    }
  }

  // var appointmentDate = "".obs;

  // setAppointmentDate(String newValue){
  //   appointmentDate.value = newValue;
  //   print("gsg: $appointmentDate");
  // }
} 