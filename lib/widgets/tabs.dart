import '../util/exports.dart';

class CustomTabs extends StatefulWidget {
  final List<Tab> tabs;
  final Function(int) switchTab;
  final double? height;
  const CustomTabs({Key? key, required this.tabs, required this.switchTab, this.height})
      : super(key: key);

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: widget.tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height ?? 50,
        decoration: BoxDecoration(
            color: Constants.bluegray90066.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: TabBar(
            controller: _tabController,
            onTap: (val) {
              widget.switchTab(val);
            },
            labelColor: Colors.black,
            labelStyle:
                
                AppStyle.poppinsTextstyle(14, FontWeight.w500, Colors.red),
            unselectedLabelColor: Constants.indigo700,
            padding: EdgeInsets.zero,
            labelPadding: const EdgeInsets.all(0),
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color(0XFFE6E8F3),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            tabs: widget.tabs,
          ),
        ));
  }
}

class TabWidget extends StatelessWidget {
  final String label;
  final bool? hasNotification;
  const TabWidget({Key? key, required this.label, this.hasNotification = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      if (hasNotification!) ...{
        Container(
          alignment: Alignment.topRight,
          child: const Icon(
            Icons.circle,
            color: Colors.red,
            size: 12,
          ),
        ),
      }
    ]);
  }
}