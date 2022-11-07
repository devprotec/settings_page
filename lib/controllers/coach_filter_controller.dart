import 'package:settings_page/util/exports.dart';


class CoachFilterController extends GetxController{
  
  var addedOrganizers = <ProfesionalDataModel>[].obs;
  var sortByOption = "msg_individual_rate".obs;
  var userLocation = ''.obs;
  var lowerstPrice = 20.obs;
  var higestPrice = 100.obs;
  var days = <String>[].obs;
  var isCardio = false.obs;
  var isMeditation = false.obs;
  var isRunning = false.obs;
  var isFitness = false.obs;
  var isStretching = false.obs;
  var isYoga = false.obs;
  var isAll = false.obs;
  var activities = [].obs;
  var services = [].obs;

  addOrganizer(ProfesionalDataModel organiser){
    if(addedOrganizers.indexOf(organiser) == -1){
      addedOrganizers.add(organiser);
    }else{
      addedOrganizers.remove(organiser);
    }
      
  }
  
}
