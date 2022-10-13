library ruler_picker;

import 'dart:math';

import 'package:flutter/material.dart';

/// a triangle painter
class _TrianglePainter extends CustomPainter {
  // final double lineSize;

  // _TrianglePainter({this.lineSize = 16});
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, tan(pi / 3) * size.width / 2);
    path.close();
    Paint paint = Paint();
    paint.color = const Color.fromARGB(255, 118, 165, 248);
    paint.style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// The controller for the ruler picker
/// init the ruler value from the controller
/// 用于 RulerPicker 的控制器，可以在构造函数里初始化默认值
class RulerPickerController extends ValueNotifier<int> {
  RulerPickerController({int value = 0}) : super(value);
  @override
  int get value => super.value;
  @override
  set value(int newValue) {
    super.value = newValue;
  }
}

typedef ValueChangedCallback = void Function(double value);

/// RulerPicker 标尺选择器
/// [width] 必须是具体的值，包括父级container的width，不能是 double.infinity，
/// 可以传入MediaQuery.of(context).size.width
class RulerPicker extends StatefulWidget {
  final ValueChangedCallback onValueChange;
  final String Function(double index, double rulerScaleValue)?
      onBuildRulerScalueText;
  final double width;
  final double height;
  final double beginValue;
  final double endValue;
  final double initValue;
  final double interval;
  final bool hasDecimal;
  final double ruleScaleInterval;

  final TextStyle rulerScaleTextStyle;
  final List<ScaleLineStyle> scaleLineStyleList;
  final Widget? marker;
  final double rulerMarginTop;
  final Color rulerBackgroundColor;
  final RulerPickerController? controller;

  const RulerPicker({
    required this.beginValue,
    required this.endValue,
    required this.onValueChange,
    required this.width,
    required this.height,
    this.hasDecimal = false,
    this.rulerMarginTop = 0,
    this.interval = 1.0,
    this.ruleScaleInterval = 10.0,
    this.scaleLineStyleList = const [
      ScaleLineStyle(
          scale: 0,
          color: Color.fromARGB(255, 188, 194, 203),
          width: 2,
          height: 32),
      ScaleLineStyle(
          color: Color.fromARGB(255, 188, 194, 203), width: 1, height: 20),
    ],
    this.rulerScaleTextStyle = const TextStyle(
      color: Color.fromARGB(255, 188, 194, 203),
      fontSize: 14,
    ),
    this.marker,
    this.onBuildRulerScalueText,
    this.initValue = 0,
    this.rulerBackgroundColor = Colors.white,
    this.controller,
  }) : assert(endValue > beginValue,
            initValue >= beginValue && initValue <= endValue);
  @override
  State<StatefulWidget> createState() {
    return RulerPickerState();
  }
}

class RulerPickerState extends State<RulerPicker> {
  double lastOffset = 0;
  bool isPosFixed = false;
  String value = '';
  late ScrollController scrollController;
  final Map<int, ScaleLineStyle> _scaleLineStyleMap = {};
  double _ruleScaleInterval = 10.0;

  @override
  void initState() {
    super.initState();
    // print('initState:: currentValue: ${widget.initValue}');
    for (var element in widget.scaleLineStyleList) {
      _scaleLineStyleMap[element.scale] = element;
    }
    _ruleScaleInterval = widget.ruleScaleInterval;
    double initValueOffset =
        (widget.initValue - widget.beginValue) * _ruleScaleInterval;
    scrollController = ScrollController(
        initialScrollOffset: initValueOffset > 0 ? initValueOffset : 0);

    scrollController.addListener(() {
      setState(() {
        double currentScale = double.parse(
            (scrollController.offset / _ruleScaleInterval)
                .toStringAsFixed(widget.hasDecimal ? 1 : 0));

        if (currentScale < 0) currentScale = 0;

        double currentValue = currentScale + widget.beginValue;

        if (currentValue > widget.endValue) currentValue = widget.endValue;
        if (widget.hasDecimal) {
          currentValue = double.parse((currentValue * 0.1).toStringAsFixed(2));
        } else {
          currentValue = double.parse(currentValue.toStringAsFixed(0));
        }
        widget.onValueChange(currentValue);
      });
    });
    widget.controller?.addListener(() {
      if (widget.controller!.value >= widget.beginValue &&
          widget.controller!.value <= widget.endValue) {
        setPositionByValue(widget.controller?.value ?? 0);
      }
    });
  }

  @override
  void didUpdateWidget(RulerPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initValue != oldWidget.initValue ||
        widget.beginValue != oldWidget.beginValue ||
        widget.endValue != oldWidget.endValue) {
      // print("I am difeerent=---");
      // print('didupdate:: currentValue: ${widget.initValue}');

      setState(() {
        for (var element in widget.scaleLineStyleList) {
          _scaleLineStyleMap[element.scale] = element;
        }
        _ruleScaleInterval = widget.ruleScaleInterval;
        double initValueOffset =
            (widget.initValue - widget.beginValue) * _ruleScaleInterval;
        scrollController = ScrollController(
            initialScrollOffset: initValueOffset > 0 ? initValueOffset : 0);

        scrollController.addListener(() {
          setState(() {
            double currentScale = double.parse(
                (scrollController.offset / _ruleScaleInterval)
                    .toStringAsFixed(widget.hasDecimal ? 1 : 0));

            if (currentScale < 0) currentScale = 0;

            double currentValue = currentScale + widget.beginValue;

            if (currentValue > widget.endValue) currentValue = widget.endValue;
            if (widget.hasDecimal) {
              currentValue =
                  double.parse((currentValue * 0.1).toStringAsFixed(2));
            } else {
              currentValue = double.parse(currentValue.toStringAsFixed(0));
            }
            widget.onValueChange(currentValue);
            // print("current value---: $currentValue");
          });
        });
        // print("beginValue: ${widget.beginValue}");
        // print("endValue: ${widget.endValue}");
        widget.controller?.addListener(() {
          if (widget.controller!.value >= widget.beginValue &&
              widget.controller!.value <= widget.endValue) {
            setPositionByValue(widget.controller?.value ?? 0);
          }
        });
      });
    }
  }

  /// default mark
  Widget _buildMark() {
    /// default mark arrow
    Widget triangle() {
      return SizedBox(
        width: 15,
        height: 15,
        child: CustomPaint(
          painter: _TrianglePainter(),
        ),
      );
    }

    return Container(
      child: SizedBox(
        width: _ruleScaleInterval * 2,
        height: 45,
        child: Stack(
          children: <Widget>[
            Align(alignment: Alignment.topCenter, child: triangle()),
            Align(
                child: Container(
              width: 3,
              height: 34,
              color: const Color.fromARGB(255, 118, 165, 248),
            )),
          ],
        ),
      ),
    );
  }

  // bool get isFirstOrLast => index == 0 ||
  bool isFirst(int index) {
    if (index == 0) return true;

    return false;
  }

  bool isLast(int index) {
    if (index == (widget.endValue - widget.beginValue)) return true;
    return false;
  }

  ///绘制刻度线
  Widget _buildRulerScaleLine(int index) {
    double width = 0;
    double height = 0;
    Color color = const Color.fromARGB(255, 188, 194, 203);
    int scale = index % 10;

    if (_scaleLineStyleMap[scale] != null) {
      width = _scaleLineStyleMap[scale]!.width;
      height = _scaleLineStyleMap[scale]!.height;
      color = _scaleLineStyleMap[scale]!.color;
    } else {
      if (_scaleLineStyleMap[-1] != null) {
        scale = -1;
        width = _scaleLineStyleMap[scale]!.width;
        height = _scaleLineStyleMap[scale]!.height;
        color = _scaleLineStyleMap[scale]!.color;
      } else {
        if (scale == 0) {
          width = 2;
          height = 32;
        } else {
          width = 1;
          height = 20;
        }
      }
    }

    return Container(
      width: width,
      height: height,
      color: color,
    );
  }

  Widget _buildRulerScale(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(
          left: isFirst(index) ? (widget.width - _ruleScaleInterval) / 2 : 0,
          right: isLast(index) ? (widget.width - _ruleScaleInterval) / 2 : 0),
      width: _ruleScaleInterval,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: _buildRulerScaleLine(index + 2)),
          Positioned(
            bottom: 5,
            width: 50,
            left: -45 + _ruleScaleInterval / 2,
            child: index % 10 == 0
                ? Container(
                    alignment: Alignment.center,
                    child: Text(
                      getRulerScaleText(widget.hasDecimal
                          ? double.parse(((index / 10)).toStringAsFixed(2))
                          : index.toDouble()),
                      // getRulerScaleText(index),
                      style: widget.rulerScaleTextStyle,
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  //尺子刻度间隔

//使得尺子刻度和指示器对齐
  void fixOffset() {
    int tempFixedOffset = (scrollController.offset + 0.5) ~/ 1;

    double fixedOffset = (tempFixedOffset + _ruleScaleInterval / 2) ~/
        _ruleScaleInterval.toInt() *
        _ruleScaleInterval;
    Future.delayed(Duration.zero, () {
      scrollController.animateTo(fixedOffset,
          duration: const Duration(milliseconds: 50),
          curve: Curves.bounceInOut);
    });
  }

  ///获取尺子的刻度提示文字
  String getRulerScaleText(double index) {
    double rulerScaleValue = index +
        (widget.hasDecimal ? widget.beginValue / 10 : widget.beginValue);

    if (widget.onBuildRulerScalueText == null) {
      return rulerScaleValue.toString();
    }

    return widget.onBuildRulerScalueText!.call(index, rulerScaleValue);
  }

  @override
  Widget build(BuildContext context) {
    // var totallength = widget.hasDecimal
    //     ? (widget.endValue - widget.beginValue).toInt() * 10
    //     : (widget.endValue - widget.beginValue).toInt() + 1;

    // print("  decimal totallength:$totallength");
    return SizedBox(
      width: widget.width,
      height: widget.height + widget.rulerMarginTop,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Listener(
              onPointerDown: (event) {
                FocusScope.of(context).requestFocus(FocusNode());
                isPosFixed = false;
              },
              onPointerUp: (event) {},
              child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollStartNotification) {
                  } else if (scrollNotification is ScrollUpdateNotification) {
                  } else if (scrollNotification is ScrollEndNotification) {
                    if (!isPosFixed) {
                      isPosFixed = true;
                      fixOffset();
                    }
                  }
                  return true;
                },
                child: Container(
                  width: double.infinity,
                  height: widget.height,
                  color: widget.rulerBackgroundColor,
                  child: ListView.builder(
                    itemCount:
                        (widget.endValue - widget.beginValue).toInt() + 1,
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: _buildRulerScale,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: widget.marker ?? _buildMark(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  // @override
  // void didUpdateWidget(RulerPicker oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  // }

  /// 根据数值设置标记位置
  void setPositionByValue(int value) {
    double targetValue = (value - widget.beginValue) * _ruleScaleInterval;
    if (targetValue < 0) targetValue = 0;
    scrollController.jumpTo(targetValue.toDouble());
  }
}

class ScaleLineStyle {
  final int scale;
  final Color color;
  final double width;
  final double height;

  const ScaleLineStyle({
    this.scale = -1,
    required this.color,
    required this.width,
    required this.height,
  });
}
