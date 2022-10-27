import 'package:settings_page/models/professional_data_model.dart';
import 'package:settings_page/screens/explore_and_book/screens/select_coach_filter.dart';

import '../../../util/exports.dart';
import '../widgets/professionalcard.dart';

class SearchProfessional extends StatefulWidget {
  const SearchProfessional({Key? key}) : super(key: key);

  @override
  State<SearchProfessional> createState() => _SearchProfessionalState();
}

class _SearchProfessionalState extends State<SearchProfessional> {
  final searchNotifier = ValueNotifier<String>('');
  var searchedList = <ProfesionalDataModel>[];
  var organizerList = <ProfesionalDataModel>[
    cooper,
    nancy,
    stefany,
    guy,
    amelia,
    david,
    anthony,
    oswald,
    simon,
    bright
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: AppbarWidget(
            hasActions: true,
            appBarTitle: "Select Coach".tr,
          ),
          preferredSize: Size.fromHeight(50),
        ),
        
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //BottomSheetTopWidgets(title: "lbl_organiser".tr),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.7,
                        child: InputForms(
                          onTap: (){
                           
                            
                          },
                          filled: true,
                          color: Constants.fromHex('#F4F5FB'),
                          placeholder: "msg_search_for_orga".tr,
                          prefixIcon: Image.asset(
                            "assets/images/search.png",
                            height: 1,
                          ),
                          notifier: searchNotifier,
                          obscure: false,
                          onChange: (val) {
                            searchNotifier.value = val!;
                             setState(() {
                              filterProfessional( organizerList);
                              
                            });
                            print(organizerList.toList());
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {Get.to(()=>SelectCoachFilter())},
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              color: Constants.fromHex('#F4F5FB'),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 18),
                            child: CommonImageView(
                              imagePath: "assets/images/filter.png",
                              height: 15,
                              width: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            searchNotifier.value.isEmpty ?
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: organizerList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15.0, left: 15, right: 15),
                    child: NewProfessionalCard(
                      profesionalDataModel: organizerList[index],
                      isCard: true,
                    ),
                  );
                }),
              ),
            ):
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: searchedList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15.0, left: 15, right: 15),
                    child: NewProfessionalCard(
                      profesionalDataModel: searchedList[index],
                      isCard: true,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  filterProfessional(List<ProfesionalDataModel> professionals) {
    searchedList.clear();
    if (searchNotifier.value.isNotEmpty) {
      professionals.forEach((element) { 
        if (element.Name!.toLowerCase().contains(searchNotifier.value.toLowerCase())) {
          if(!searchedList.contains(element)){
            
          searchedList.add(element);
        }
      }});
      
     
    return professionals;
  }

  }

}