import 'package:mhc_customer/util/exports.dart';

class EventsController extends GetxController{
  var addedOrganizers = <ProfesionalDataModel>[].obs;
  var sortByOption = "msg_individual_rate".obs;

  addOrganizer(ProfesionalDataModel organiser){
    if(addedOrganizers.indexOf(organiser) == -1){
      addedOrganizers.add(organiser);
    }else{
      addedOrganizers.remove(organiser);
    }
      
  }
  
}