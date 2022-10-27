import 'package:settings_page/models/professional_data_model.dart';
import 'package:settings_page/util/exports.dart';

class CoachFilterController extends GetxController{
  var addedOrganizers = <ProfesionalDataModel>[].obs;
  var sortByOption = "msg_individual_rate".obs;
  var userLocation = ''.obs;
  var lowerstPrice = 20.obs;
  var higestPrice = 100.obs;
  var days = <String>[].obs;

  addOrganizer(ProfesionalDataModel organiser){
    if(addedOrganizers.indexOf(organiser) == -1){
      addedOrganizers.add(organiser);
    }else{
      addedOrganizers.remove(organiser);
    }
      
  }
  
}