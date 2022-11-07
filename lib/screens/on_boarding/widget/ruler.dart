import 'package:settings_page/util/exports.dart';

class Ruler extends StatefulWidget {
  final double currentValue;
  final double begin;
  final double end;
  final Function(double) onValueChange;

  final bool hasDecimal;

  const Ruler(
      {Key? key,
      required this.currentValue,
      required this.begin,
      this.hasDecimal = false,
      required this.end,
      required this.onValueChange})
      : super(key: key);
  @override
  _RulerState createState() => _RulerState();
}

class _RulerState extends State<Ruler> {
  RulerPickerController? _rulerPickerController;
  double _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: 0);
    _currentValue = widget.currentValue * (widget.hasDecimal ? 0.1 : 1);
  }

  @override
  void didUpdateWidget(Ruler oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.currentValue != oldWidget.currentValue) {
      setState(() {
        _currentValue = widget.currentValue * (widget.hasDecimal ? 0.1 : 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              widget.hasDecimal
                  ? _currentValue.toString()
                  : _currentValue.toInt().toString(),
              style: const TextStyle(
                color: Color(0xff454E90),
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 20),
            RulerPicker(
              controller: _rulerPickerController!,
              beginValue: widget.begin,
              endValue: widget.end,
              hasDecimal: widget.hasDecimal,

              initValue: widget.currentValue,
              scaleLineStyleList: const [
                ScaleLineStyle(
                    color: Color(0xffE6E8F3), width: 1.5, height: 20, scale: 0),
                ScaleLineStyle(
                    color: Color(0xffE6E8F3), width: 1, height: 15, scale: 5),
                ScaleLineStyle(
                    color: Color(0xffE6E8F3), width: 1, height: 10, scale: -1)
              ],
              // onBuildRulerScalueText: (index, scaleValue) {
              //   return 'elij'.toString();
              // },
              onValueChange: (value) {
                widget.onValueChange(value);
                setState(() {
                  _currentValue = value;
                });
              },

              width: MediaQuery.of(context).size.width,
              height: 60,
              rulerMarginTop: 8,
              marker: CustomPaint(
                painter: TrianglePainter(
                  strokeColor: Colors.blue,
                  strokeWidth: 5,
                  paintingStyle: PaintingStyle.fill,
                ),
                child: const SizedBox(
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
