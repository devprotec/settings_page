import 'package:settings_page/controllers/events_controller.dart';
import 'package:settings_page/screens/events/choose_organizer.dart';
import 'package:settings_page/screens/events/event_schedule.dart';
import 'package:settings_page/util/exports.dart';

import '../../widgets/professional_card.dart';

// class GeneralInfoPage extends StatefulWidget {
//   const GeneralInfoPage({Key? key}) : super(key: key);

//   @override
//   State<GeneralInfoPage> createState() => _GeneralInfoPageState();
// }

class GeneralInfoPage extends GetView<EventsController> {
  final individualPrice = ValueNotifier<String>('');
  final groupPrice = ValueNotifier<String>('');
  final minPaticipants = ValueNotifier<String>('');
  final maxPaticipants = ValueNotifier<String>('');
  final overview = ValueNotifier<String>('');
  final otherDetails = ValueNotifier<String>('');
  var controller = Get.put(EventsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          appBarTitle: "msg_general_informa".tr,
          hasActions: true,
          leadingWidgetColor: Constants.fromHex("#34405E"),
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Constants.spaceLargeColumn,
              Text(
                "lbl_event_duration".tr,
                style: Constants.titleTextStyle,
              ),
              Constants.spaceSmallColumn,
              Row(
                children: [
                  Text(
                    "lbl_start_date".tr,
                    style: AppStyle.txtPoppinsMedium14,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Text(
                      "lbl_end_date".tr,
                      style: AppStyle.txtPoppinsMedium14,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: DateAndCalender(date: "21 Nov, 2022")),
                  GestureDetector(
                      onTap: () {},
                      child: DateAndCalender(date: "21 Nov, 2022"))
                ],
              ),
              Constants.spaceMediumColumn,
              Text(
                "lbl_price".tr,
                style: Constants.titleTextStyle,
              ),
              Constants.spaceSmallColumn,
              Row(
                children: [
                  Text(
                    "lbl_individual".tr,
                    style: AppStyle.txtPoppinsMedium14,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Text(
                      "lbl_group".tr,
                      style: AppStyle.txtPoppinsMedium14,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: InputForms(
                        color: Constants.gray150,
                        filled: true,
                        placeholder: "00,00",
                        notifier: individualPrice,
                        obscure: false,
                        onChange: (val) {
                          individualPrice.value = val!;
                        }),
                  ),
                  SizedBox(
                    width: 150,
                    child: InputForms(
                        color: Constants.gray150,
                        filled: true,
                        placeholder: "00,00",
                        notifier: groupPrice,
                        obscure: false,
                        onChange: (val) {
                          groupPrice.value = val!;
                        }),
                  )
                ],
              ),
              Constants.spaceSmallColumn,
              Row(
                children: [
                  Text(
                    "lbl_group_capacity".tr,
                    style: Constants.titleTextStyle,
                  ),
                  Text(
                    "lbl_optional".tr,
                    style: Constants.subtitleTextStyle,
                  ),
                ],
              ),
              Constants.spaceSmallColumn,
              Row(
                children: [
                  Text(
                    "msg_min_participant".tr,
                    style: AppStyle.txtPoppinsMedium14,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      "msg_max_participant".tr,
                      style: AppStyle.txtPoppinsMedium14,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: InputForms(
                        color: Constants.gray150,
                        filled: true,
                        placeholder: "1",
                        notifier: minPaticipants,
                        obscure: false,
                        onChange: (val) {
                          minPaticipants.value = val!;
                        }),
                  ),
                  SizedBox(
                    width: 150,
                    child: InputForms(
                        color: Constants.gray150,
                        filled: true,
                        placeholder: "15",
                        notifier: maxPaticipants,
                        obscure: false,
                        onChange: (val) {
                          maxPaticipants.value = val!;
                        }),
                  )
                ],
              ),
              Constants.spaceMediumColumn,
              Text(
                "lbl_description".tr,
                style: Constants.titleTextStyle,
              ),
              Constants.spaceSmallColumn,
              Text(
                "lbl_overview".tr,
                style: AppStyle.txtPoppinsMedium14,
              ),
              SizedBox(
                width: double.infinity,
                child: InputForms(
                    maxLines: 25,
                    contentPadding: 30,
                    filled: true,
                    color: Constants.gray150,
                    placeholder: "msg_write_few_words".tr,
                    notifier: overview,
                    obscure: false,
                    onChange: (val) {
                      overview.value = val!;
                    }),
              ),
              Constants.spaceSmallColumn,
              Row(
                children: [
                  Text(
                    "lbl_other_details".tr,
                    style: AppStyle.txtPoppinsMedium14,
                  ),
                  Text(
                    "lbl_optional".tr,
                    style: Constants.subtitleTextStyle,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: InputForms(
                    maxLines: 25,
                    filled: true,
                    contentPadding: 40,
                    color: Constants.gray150,
                    notifier: otherDetails,
                    obscure: false,
                    onChange: (val) {
                      otherDetails.value = val!;
                    }),
              ),
              Constants.spaceMediumColumn,
              Text(
                "lbl_organiser".tr,
                style: Constants.titleTextStyle,
              ),
              Obx(
                () => ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.addedOrganizers.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: ProfessionalCard(
                          profesionalDataModel:
                              controller.addedOrganizers[index],
                          isCard: false,
                        ),
                      );
                    })),
              ),
              Constants.spaceMediumColumn,
              Constants.spaceSmallColumn,
              GestureDetector(
                onTap: () {
                  Get.to(ChooseOrganizer());
                },
                child: GeneralAddButton(text: "lbl_add_organiser".tr.toUpperCase(),)
              ),
              Constants.spaceMediumColumn,
              Constants.spaceSmallColumn,
              Button(
                  text: "Next",
                  onPressed: () {
                    Get.to(EventSchdule());
                  })
            ],
          ),
        ),
      ),
    ));
  }
}

class GeneralAddButton extends StatelessWidget {
  final String text;
  final MainAxisAlignment? mainAxisAlignment;
  const GeneralAddButton ({required this.text, this.mainAxisAlignment});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment?? MainAxisAlignment.start,
      children: [
        Constants.spaceMediumRow,
        CommonImageView(
            svgPath: "assets/images/add_icon.svg",
            height: getSize(14.00),
            width: getSize(14.00)),
        Constants.spaceMediumRow,
        Text(
          text.tr.toUpperCase(),
          style: AppStyle.txtPoppinsSemiBold14LightBlue700,
        )
      ],
    );
  }
}

class DateAndCalender extends StatelessWidget {
  final String date;
  const DateAndCalender({required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Constants.gray150,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          date.tr,
          style:
              AppStyle.poppinsTextstyle(14, FontWeight.w500, Constants.gray900),
        ),
        Constants.spaceSmallRow,
        CommonImageView(svgPath: ImageConstant.imgCalender),
      ]),
    );
  }
}
