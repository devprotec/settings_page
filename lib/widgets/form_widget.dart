import 'package:settings_page/util/exports.dart';

class InputForms extends StatefulWidget {
  final String? description;
  final String? placeholder;
  final ValueNotifier<String> notifier;
  final TextInputType inputType;
  final IconData? icon;
  final Widget? suffixicon;
  final TextStyle? descriptionTextStyle;
  final bool enabled;
  final bool obscure;
  final double? suffixIconSize;
  final IconData? visiblePasswordIcon;
  final IconData? hiddenPasswordIcon;
  final Function(String)? validation;
  final Function(String?)? onChange;
  final double? contentPadding;
  

  // ignore: use_key_in_widget_constructors
  InputForms(
      {this.description,
      required this.notifier,
      this.icon,
      this.suffixicon,
      this.placeholder,
      this.suffixIconSize,
      this.inputType = TextInputType.text,
      this.enabled = true,
      required this.obscure,
      required this.onChange,
      this.validation,
      this.visiblePasswordIcon,
      this.hiddenPasswordIcon,
      this.descriptionTextStyle,
      this.contentPadding});
  @override
  _InputFormsState createState() => _InputFormsState();
}

class _InputFormsState extends State<InputForms> {
  final FocusNode _focus = FocusNode();
  final _inFocus = ValueNotifier<bool>(false);
  TextEditingController controller = TextEditingController();
  bool seePassword = true;
  @override
  void initState() {
    super.initState();

    controller.text = widget.notifier.value;
    _focus.addListener(_onFocusChange);
    if (!widget.enabled) {
      widget.notifier.addListener(() {
        controller.text = widget.notifier.value;
      });
    }
  }

  void _onFocusChange() {
    _inFocus.value = _focus.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.description != null) ...[
            ValueListenableBuilder(
              valueListenable: _inFocus,
              builder: (_, focus, __) => Text(
                widget.description!,
                style: widget.descriptionTextStyle ??
                    TextStyle(
                      fontSize: 13,
                      color: focus as bool
                          ? Constants.mainColor
                          : const Color(0xff34405E),
                    ),
              ),
            ),
          ],
          const SizedBox(height: 5),
          ValueListenableBuilder(
            valueListenable: widget.notifier,
            builder: (_, value, __) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffF4F5FB),
              ),
              child: TextField(
                autocorrect: false,
                keyboardType: widget.inputType,
                focusNode: _focus,
                enabled: widget.enabled,
                controller: controller,
                onChanged: widget.onChange,
                obscureText: widget.obscure ? seePassword : false,
                style: const TextStyle(
                  fontSize: 15,
                  letterSpacing: 1.8,
                ),
                decoration: InputDecoration(
                  suffixStyle: TextStyle(fontSize: 12),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: widget.contentPadding ?? 16),
                  errorStyle: const TextStyle(
                    fontSize: 11,
                    color: Colors.red,
                  ),
                  focusColor: Constants.mainColor,
                  hintText: widget.placeholder,
                  errorText: widget.validation == null
                      ? null
                      : widget.validation!(value as String),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Constants.mainColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  prefixIcon: widget.icon != null
                      ? ValueListenableBuilder(
                          valueListenable: _inFocus,
                          builder: (_, focus, __) => Icon(
                            widget.icon,
                            color: focus as bool
                                ? Constants.mainColor
                                : Colors.black54,
                          ),
                        )
                      : null,
                  suffixIcon: widget.obscure
                      ? IconButton(
                          iconSize: widget.suffixIconSize ?? 18.0,
                          onPressed: () {
                            setState(() {
                              seePassword = !seePassword;
                            });
                          },
                          icon: seePassword
                              ? Icon(widget.visiblePasswordIcon ??
                                  Icons.visibility_off)
                              : Icon(widget.hiddenPasswordIcon ??
                                  Icons.visibility))
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LongText extends StatefulWidget {
  final String description;
  final ValueNotifier<String> notifier;
  final TextInputType inputType;
  final TextEditingController? controller;
  final IconData? icon;
  final bool enabled;
  final bool obscure;
  final Function(String)? validation;
  final Function(String?)? onChange;
  double height;

  // ignore: use_key_in_widget_constructors
  LongText({
    required this.description,
    required this.notifier,
    this.icon,
    this.controller,
    this.inputType = TextInputType.text,
    this.enabled = true,
    this.obscure = false,
    required this.onChange,
    this.validation,
    this.height = 48,
  });
  @override
  _LongTextState createState() => _LongTextState();
}

class _LongTextState extends State<LongText> {
  final FocusNode _focus = FocusNode();
  final _inFocus = ValueNotifier<bool>(false);
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.text = widget.notifier.value;
    }
    controller.text = widget.notifier.value;
    _focus.addListener(_onFocusChange);
    if (!widget.enabled) {
      widget.notifier.addListener(() {
        controller.text = widget.notifier.value;
      });
    }
  }

  void _onFocusChange() {
    _inFocus.value = _focus.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder(
            valueListenable: _inFocus,
            builder: (_, focus, __) => Text(
              widget.description,
              style: TextStyle(
                fontSize: 13,
                color: focus as bool ? Constants.mainColor : Colors.black54,
              ),
            ),
          ),
          const SizedBox(height: 5),
          ValueListenableBuilder(
            valueListenable: widget.notifier,
            builder: (_, value, __) => Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  autocorrect: false,
                  keyboardType: widget.inputType,
                  focusNode: _focus,
                  enabled: widget.enabled,
                  controller: widget.controller ?? controller,
                  onChanged: widget.onChange,
                  obscureText: widget.obscure,
                  maxLines: 3,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    errorStyle: const TextStyle(
                      fontSize: 11,
                      color: Colors.red,
                    ),
                    focusColor: Constants.mainColor,
                    hintText: widget.description,
                    errorText: widget.validation == null
                        ? null
                        : widget.validation!(value as String),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Constants.mainColor,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    // suffixIcon: ValueListenableBuilder(
                    //   valueListenable: _inFocus,
                    //   builder: (_, focus, __) => Icon(
                    //     widget.icon,
                    //     color: focus as bool
                    //         ? Constants.mainColor
                    //         : Colors.black54,
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputForms1 extends StatefulWidget {
  final String description;
  final ValueNotifier<String> notifier;
  final TextInputType inputType;
  final TextEditingController? controller;
  final IconData? icon;
  final bool enabled;
  final bool obscure;
  final Function(String)? validation;
  final Function(String?)? onChange;
  // ignore: use_key_in_widget_constructors
  const InputForms1({
    required this.description,
    required this.notifier,
    this.icon,
    this.controller,
    this.inputType = TextInputType.text,
    this.enabled = true,
    this.obscure = false,
    this.onChange,
    this.validation,
  });
  @override
  _InputForms1State createState() => _InputForms1State();
}

class _InputForms1State extends State<InputForms1> {
  final FocusNode _focus = FocusNode();
  final _inFocus = ValueNotifier<bool>(false);
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.text = widget.notifier.value;
    }
    controller.text = widget.notifier.value;
    _focus.addListener(_onFocusChange);
    if (!widget.enabled) {
      widget.notifier.addListener(() {
        controller.text = widget.notifier.value;
      });
    }
  }

  void _onFocusChange() {
    _inFocus.value = _focus.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        // horizontal: 30,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder(
            valueListenable: _inFocus,
            builder: (_, focus, __) => Text(
              widget.description,
              style: TextStyle(
                fontSize: 13,
                color: focus as bool ? Colors.teal : Colors.black54,
              ),
            ),
          ),
          const SizedBox(height: 5),
          ValueListenableBuilder(
            valueListenable: widget.notifier,
            builder: (_, value, __) => TextField(
              autocorrect: false,
              keyboardType: widget.inputType,
              focusNode: _focus,
              enabled: widget.enabled,
              controller: widget.controller ?? controller,
              onChanged: widget.onChange,
              obscureText: widget.obscure,
              style: const TextStyle(
                fontSize: 15,
                letterSpacing: 1.8,
              ),
              decoration: InputDecoration(
                isDense: true,
                errorStyle: const TextStyle(
                  fontSize: 11,
                  color: Colors.red,
                ),
                errorText: widget.validation == null
                    ? null
                    : widget.validation!(value as String),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                suffixIcon: ValueListenableBuilder(
                  valueListenable: _inFocus,
                  builder: (_, focus, __) => Icon(
                    widget.icon,
                    color: focus as bool ? Colors.teal : Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

validateEmail(String value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return null;
  }
  // ignore: unnecessary_null_comparison
  if (!regex.hasMatch(value) || value == null) {
    return 'Enter a valid email address';
  } else {
    return null;
  }
}

nameValidation(String value) {
  if (value.isEmpty) {
    return "This field cannot be empty";
  } else {
    return null;
  }
}

validateContactNumber(String value) {
  if (value.isEmpty) {
    return null;
  }
  if (value.length < 10 || value.length > 10) {
    return 'Enter valid phone number';
  } else {
    return null;
  }
}

validateIMEINumber(String value) {
  if (value.isEmpty) {
    return null;
  }
  if (value.length != 15) {
    return 'Enter valid IMEI number';
  } else {
    return null;
  }
}

validateYearNumber(String value) {
  if (value.isEmpty) {
    return null;
  }
  if (value.length != 4) {
    return 'Enter valid phone number';
  } else {
    return null;
  }
}

validateVoterNumber(String value) {
  if (value.isEmpty) {
    return null;
  }
  if (value.length < 10 || value.length > 10) {
    return 'Enter valid voters id number';
  } else {
    return null;
  }
}
