import 'package:settings_page/models/professional_data_model.dart';
import 'package:settings_page/screens/events/filter_organizers_page.dart';
import 'package:settings_page/widgets/bottomsheet_top_widgets.dart';
import 'package:settings_page/widgets/professional_card.dart';

import '../../util/exports.dart';
import 'general_info_page.dart';

class ChooseOrganizer extends StatefulWidget {
  const ChooseOrganizer({Key? key}) : super(key: key);

  @override
  State<ChooseOrganizer> createState() => _ChooseOrganizerState();
}

class _ChooseOrganizerState extends State<ChooseOrganizer> {
  final searchNotifier = ValueNotifier<String>('');
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
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Button(
                  height: 55,
                  onPressed: () {
                   Navigator.of(context).pop();
                   
                  },
                  text: "lbl_add_organiser".tr),
            ),
            //backgroundColor: Constants.gray150,
            body: Column(children: [
              // Container(
              //   height: 70,
              //   color: Constants.gray150,
              // ),
              Container(
                //height: size.height - 70,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BottomSheetTopWidgets(title: "lbl_organiser".tr),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.7,
                          child: InputForms(
                              filled: true,
                              color: Constants.gray150,
                              placeholder: "msg_search_for_orga".tr,
                              prefixIcon: Image.asset(
                                "assets/images/search.png",
                                height: 1,
                              ),
                              notifier: searchNotifier,
                              obscure: false,
                              onChange: (val) {
                                searchNotifier.value = val!;
                              }),
                        ),
                        GestureDetector(
                          onTap: ()=>Get.to(FilterOrganizerPage()),
                          child: Container(
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                color: Constants.gray150,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                child: CommonImageView(
                                  imagePath: "assets/images/filter.png",
                                  height: 15,
                                  width: 18,
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: organizerList.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0, left: 15, right: 15),
                        child: ProfessionalCard(
                          profesionalDataModel: organizerList[index],
                          isCard: true,

                        ),
                      );
                    })),
              ),
            ])));
  }
}
