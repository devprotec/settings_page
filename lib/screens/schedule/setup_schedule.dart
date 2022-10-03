import 'package:settings_page/util/exports.dart';

class SetUpSchedule extends StatelessWidget {
  List daysOfTheWeek = ["Moday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  bool active = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(
            hasActions: true,
            appBarTitle: "lbl_setup_sched".tr,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 26),
          child: Container(
            height: height,
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: false,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          /* SwitchListTile(
                            value: value,
                            onChanged: onChanged,
                            secondary: Icon(Icons.arrow_forward_ios),
                            controlAffinity: ListTileControlAffinity.leading,
                          ) */
                          Switch(
                            value: active,
                            onChanged: (value) {
                              active = value;
                            },
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                      ),
                    );
                  },
                  itemCount: daysOfTheWeek.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
