import 'package:flutter/cupertino.dart';
import 'package:settings_page/models/schedule_setup.dart';
import 'package:settings_page/util/exports.dart';

class SetUpSchedule extends StatefulWidget {
  @override
  State<SetUpSchedule> createState() => _SetUpScheduleState();
}

class _SetUpScheduleState extends State<SetUpSchedule> {
  List<ScheduleSetup> schedule = [
    ScheduleSetup(day: 'Sunday', scheduleStatus: Scheduled.Available),
    ScheduleSetup(day: 'Monday', scheduleStatus: Scheduled.Available),
    ScheduleSetup(day: 'Tuesday', scheduleStatus: Scheduled.Unavailable),
    ScheduleSetup(day: 'Wednesday', scheduleStatus: Scheduled.Unavailable),
    ScheduleSetup(day: 'Thursday', scheduleStatus: Scheduled.TimeSetup),
    ScheduleSetup(day: 'Friday', scheduleStatus: Scheduled.TimeSetup),
    ScheduleSetup(day: 'Saturday', scheduleStatus: Scheduled.Unavailable),
  ];

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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 26),
          child: Container(
            height: height,
            width: width,
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14.0),
                                child: Container(
                                  height: 28.0,
                                  width: 48.0,
                                  child: CupertinoSwitch(
                                    value: schedule[index].scheduleStatus !=
                                        Scheduled.Unavailable,
                                    trackColor: Constants.indigo50,
                                    activeColor: Constants.lightBlue500,
                                    onChanged: (value) {
                                      setState(() {
                                        schedule[index].scheduleStatus =
                                            Scheduled.TimeSetup;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              Text(
                                schedule[index].day,
                                style: AppStyle.poppinsTextstyle(
                                  16,
                                  FontWeight.w500,
                                  Constants.fromHex("#34405E"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    schedule[index].scheduleStatus.name,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.poppinsTextstyle(
                                      12,
                                      FontWeight.w500,
                                      Constants.fromHex("#34405E"),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 12,
                                width: 7,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12.0,
                                  color: Constants.inactiveIconColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      width: double.infinity,
                      color: Constants.indigo50,
                    );
                  },
                  itemCount: schedule.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
