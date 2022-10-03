import 'package:settings_page/controllers/events_controller.dart';

import "../util/exports.dart";

class OptionsBottomSheet extends StatefulWidget {
  final List<String> items;
  const OptionsBottomSheet({Key? key, required this.items}) : super(key: key);

  @override
  State<OptionsBottomSheet> createState() => _OptionsBottomSheetState();
}

class _OptionsBottomSheetState extends State<OptionsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(EventsController());
    return Container(
        height: size.height * 0.4,
        decoration: AppDecoration.outlineGray7000f.copyWith(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Column(children: [
          BottomSheetTopWidgets(title: "lbl_sort_by".tr),
          for (int i = 0; i < widget.items.length; i++)
            ListTile(
                title: Text(widget.items[i].tr),
                onTap: () {
                  controller.sortByOption.value = widget.items[i];
                  Get.back();
                },
                trailing: widget.items[i] == controller.sortByOption.value
                    ? CommonImageView(
                        imagePath: ImageConstant.imgVector20X20,
                        height: getSize(20.00),
                        width: getSize(20.00))
                    : SizedBox.shrink()),
        ]));
  }
}
