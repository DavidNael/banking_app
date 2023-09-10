import 'package:banking_app/screens/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class CustomWidgets {
  static BoxShadow boxShadow({
    Color shadowColor = Colors.grey,
    Offset offset = const Offset(0, 0),
    double blurRadius = 20,
    double spreadRadius = 2,
    int alphaColor = 255,
  }) {
    return BoxShadow(
      offset: offset,
      blurRadius: blurRadius,
      color: shadowColor.withAlpha(alphaColor),
      spreadRadius: spreadRadius,
    );
  }

  static Border border({
    Color borderColor = Colors.grey,
    double borderWidth = 0.6,
  }) {
    return Border.all(
      color: borderColor,
      width: borderWidth,
    );
  }

  static LinearGradient linearGradient({
    List<Color> colors = const [],
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
  }) {
    List<Color> defaultColors = [
      Colors.blue.withAlpha(150),
      Colors.indigo.shade400,
      Colors.indigo.shade600,
      Colors.indigo.shade800,
    ];
    return LinearGradient(
      colors: colors.isNotEmpty ? colors : defaultColors,
      begin: begin,
      end: end,
    );
  }

  static BoxDecoration boxDecoration({
    // 1 Box Settings
    BoxShape boxShape = BoxShape.rectangle,
    Color? boxColor ,
    double? boxBorderRadius,
    double boxTopLeftBorderRadius = 0,
    double boxTopRightBorderRadius = 0,
    double boxBottomLeftBorderRadius = 0,
    double boxBottomRightBorderRadius = 0,

    // 2 Gradient Settings
    bool hasGradient = false,
    List<Color> gradientColors = const [],
    AlignmentGeometry gradientBegin = Alignment.topLeft,
    AlignmentGeometry gradientEnd = Alignment.bottomRight,

    // 3 Border Settings
    bool hasBorder = false,
    Color borderColor = Colors.grey,
    double borderWidth = 0.6,

    // 4 Shadow Settings
    bool hasShadow = false,
    Color shadowColor = Colors.grey,
    Offset shadowOffset = const Offset(0, 0),
    int shadowAlphaColor = 255,
    double shadowBlurRadius = 20,
    double shadowSpreadRadius = 2,
  }) {
    return BoxDecoration(
      shape: boxShape,
      color: boxColor,
      gradient: hasGradient
          ? linearGradient(
              colors: gradientColors,
              begin: gradientBegin,
              end: gradientEnd,
            )
          : null,
      border: hasBorder
          ? border(
              borderColor: borderColor,
              borderWidth: borderWidth,
            )
          : null,
      borderRadius: boxShape == BoxShape.circle
          ? null
          : boxBorderRadius != null
              ? BorderRadius.circular(boxBorderRadius)
              : BorderRadius.only(
                  topLeft: Radius.circular(boxTopLeftBorderRadius),
                  topRight: Radius.circular(boxTopRightBorderRadius),
                  bottomLeft: Radius.circular(boxBottomLeftBorderRadius),
                  bottomRight: Radius.circular(boxBottomRightBorderRadius),
                ),
      boxShadow: hasShadow
          ? [
              boxShadow(
                alphaColor: shadowAlphaColor,
                blurRadius: shadowBlurRadius,
                offset: shadowOffset,
                shadowColor: shadowColor,
                spreadRadius: shadowSpreadRadius,
              ),
            ]
          : null,
    );
  }

  static Widget textWidget({
    String text = "Test",
    int? maxLines,
    double? letterSpacing,
    double? wordSpacing,
    double? fontSize,
    bool isBold = false,
    bool isItalic = false,
    bool isUnderlined = false,
    bool isLineThrough = false,
    bool isOverline = false,
    isEllipsis = false,
    fontFamily = FontConstants.fontFamily,
    Color textColor = Colors.black,
    TextAlign? textAlign,
    EdgeInsetsGeometry? padding,
  }) {
    return Padding(
      padding: padding ??= EdgeInsets.zero,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
          fontFamily: fontFamily,
          color: textColor,
          decoration: isUnderlined
              ? TextDecoration.underline
              : isLineThrough
                  ? TextDecoration.lineThrough
                  : isOverline
                      ? TextDecoration.overline
                      : TextDecoration.none,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
        ),
        maxLines: maxLines,
        overflow: isEllipsis ? TextOverflow.ellipsis : TextOverflow.visible,
        textAlign: textAlign,
      ),
    );
  }

  static Widget iconWidget({
    Color color = Colors.indigo,
    double size = 20,
    IconData icon = Icons.info,
    VoidCallback? onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 35,
        color: Colors.white,
      ),
    );
  }

  static Widget dropDownMenu({
    dynamic selectedValue,
    double width = 180,
    double? height,
    String text = "",
    bool isBold = false,
    double fontSize = 20,
    EdgeInsets? padding,
    EdgeInsets? margin,
    List<DropdownMenuItem<dynamic>>? items,
    void Function(dynamic)? onChanged,
    // 1 Box Settings
    BoxShape boxShape = BoxShape.rectangle,
    Color boxColor = Colors.white,
    double? boxBorderRadius,
    double boxTopLeftBorderRadius = 5,
    double boxTopRightBorderRadius = 10,
    double boxBottomLeftBorderRadius = 10,
    double boxBottomRightBorderRadius = 10,

    // 2 Gradient Settings
    bool hasGradient = false,
    List<Color> gradientColors = const [],
    AlignmentGeometry gradientBegin = Alignment.topLeft,
    AlignmentGeometry gradientEnd = Alignment.bottomRight,

    // 3 Border Settings
    bool hasBorder = true,
    double borderRadius = 20,
    double borderWidth = 0,
    Color borderColor = Colors.transparent,

    // 4 Shadow Settings
    bool hasShadow = false,
    Color shadowColor = Colors.grey,
    Offset shadowOffset = const Offset(0, 2),
    int shadowAlphaColor = 255,
    double shadowBlurRadius = 10,
    double shadowSpreadRadius = 0.3,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Container(
            padding: padding,
            margin: margin,
            decoration: boxDecoration(
              boxColor: boxColor,
              boxShape: boxShape,
              boxBorderRadius: boxBorderRadius,
              boxTopLeftBorderRadius: boxTopLeftBorderRadius,
              boxTopRightBorderRadius: boxTopRightBorderRadius,
              boxBottomLeftBorderRadius: boxBottomLeftBorderRadius,
              boxBottomRightBorderRadius: boxBottomRightBorderRadius,
              hasBorder: true,
              borderColor: borderColor,
              borderWidth: borderWidth,
              hasGradient: hasGradient,
              gradientBegin: gradientBegin,
              gradientColors: gradientColors,
              gradientEnd: gradientEnd,
              hasShadow: hasShadow,
              shadowAlphaColor: shadowAlphaColor,
              shadowBlurRadius: shadowBlurRadius,
              shadowColor: shadowColor,
              shadowOffset: shadowOffset,
              shadowSpreadRadius: shadowBlurRadius,
            ),
            // alignment: Alignment.topRight,
            child: Align(
              alignment: Alignment.center,
              child: DropdownButton<dynamic>(
                underline: Container(),
                isExpanded: true,
                value: selectedValue,
                borderRadius: BorderRadius.circular(borderRadius),
                onChanged: onChanged,
                items: items,
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: textWidget(
              text: text,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              isBold: isBold,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }

  static Widget textFormField({
    VoidCallback? onPressed,
    void Function(String)? onChanged,
    String label = "",
    String? hint,
    String startingValue = "",
    Color? textColor,
    Color backgroundColor = Colors.transparent,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool alwaysShowHint = false,
    bool isEnabled = true,
    bool readOnly = false,
    bool obscureText = false,
    bool labelIsBold = false,
    double width = 180,
    double? height,
    VoidCallback? onTap,
    TextEditingController? controller,

    // 1 Border Settings
    bool hasBorder = false,
    double enabledBorderRadius = 10,
    double focusBorderRadius = 10,
    double enabledBorderWidth = 0,
    double disabledBorderWidth = 0,
    double focusBorderWidth = 0,
    Color? enabledBackgroundColor,
    Color? focusBackgroundColor,
    Color enabledBorderColor = Colors.black,
    Color disabledBorderColor = Colors.black,
    Color focusBorderColor = Colors.black,
    double verticalPadding = 0,
    double horizontalPadding = 0,
    double? fontSize,
    double? labelFontSize,
    double? hintFontSize,
    int? maxLines = 1,
    FocusNode? focusNode,
    TextInputType keyboardType = TextInputType.text,
    double? boxBorderRadius,
    double borderWidth = 0,
    double boxTopLeftBorderRadius = 10,
    double boxTopRightBorderRadius = 10,
    double boxBottomLeftBorderRadius = 10,
    double boxBottomRightBorderRadius = 10,
    Color borderColor = Colors.black,

    // Shadow Settings
    bool hasShadow = false,
    Color shadowColor = Colors.grey,
    Offset shadowOffset = const Offset(0, 2),
    int shadowAlphaColor = 255,
    double shadowBlurRadius = 10,
    double shadowSpreadRadius = 0.3,
  }) {
    BoxDecoration? decoration;
    if (hasBorder || hasShadow) {
      decoration = boxDecoration(
        // boxColor: backgroundColor,
        boxTopLeftBorderRadius: boxTopLeftBorderRadius,
        boxTopRightBorderRadius: boxTopRightBorderRadius,
        boxBottomLeftBorderRadius: boxBottomLeftBorderRadius,
        boxBottomRightBorderRadius: boxBottomRightBorderRadius,
        hasShadow: hasShadow,
        shadowAlphaColor: shadowAlphaColor,
        shadowBlurRadius: shadowBlurRadius,
        shadowColor: shadowColor,
        shadowOffset: shadowOffset,
        shadowSpreadRadius: shadowSpreadRadius,
        // hasBorder: hasBorder,
        // borderColor: borderColor,
        // borderWidth: borderWidth,
        boxBorderRadius: boxBorderRadius,
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: decoration,
        child: TextFormField(
          enabled: isEnabled,
          readOnly: readOnly,
          controller: controller ??= TextEditingController(text: startingValue),
          focusNode: focusNode,
          keyboardType: keyboardType,
          onChanged: onChanged,
          obscureText: obscureText,
          onTap: onTap,
          decoration: InputDecoration(
            filled: true,
            fillColor: backgroundColor,
            label: textWidget(
                text: label, fontSize: labelFontSize, isBold: labelIsBold),
            hintText: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            floatingLabelBehavior:
                alwaysShowHint ? FloatingLabelBehavior.always : null,
            enabledBorder: hasBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(boxTopLeftBorderRadius),
                      topRight: Radius.circular(boxTopRightBorderRadius),
                      bottomLeft: Radius.circular(boxBottomLeftBorderRadius),
                      bottomRight: Radius.circular(boxBottomRightBorderRadius),
                    ),
                    borderSide: BorderSide(
                      width: enabledBorderWidth,
                      color: enabledBorderColor,
                    ),
                  )
                : InputBorder.none,
            focusedBorder: hasBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(boxTopLeftBorderRadius),
                      topRight: Radius.circular(boxTopRightBorderRadius),
                      bottomLeft: Radius.circular(boxBottomLeftBorderRadius),
                      bottomRight: Radius.circular(boxBottomRightBorderRadius),
                    ),
                    borderSide: BorderSide(
                      width: focusBorderWidth,
                      color: focusBorderColor,
                    ),
                  )
                : InputBorder.none,
            disabledBorder: hasBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(boxTopLeftBorderRadius),
                      topRight: Radius.circular(boxTopRightBorderRadius),
                      bottomLeft: Radius.circular(boxBottomLeftBorderRadius),
                      bottomRight: Radius.circular(boxBottomRightBorderRadius),
                    ),
                    borderSide: BorderSide(
                      width: disabledBorderWidth,
                      color: disabledBorderColor,
                    ),
                  )
                : InputBorder.none,
          ),
          maxLines: maxLines,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );
  }

  static Future<void>? modalButton({
    required BuildContext context,
    required Widget builder,
    bool isScrollable = false,
  }) {
    showModalBottomSheet(
      isScrollControlled: isScrollable,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return builder;
      },
    );
    return null;
  }

  static Widget expansionTile({
    required String title,
    List<Widget> children = const <Widget>[],
    double collapsedBorderRadius = 10,
    double borderRadius = 10,
    EdgeInsets margin = const EdgeInsets.all(0),
    EdgeInsets padding = const EdgeInsets.all(0),
    EdgeInsets childrenPadding = const EdgeInsets.all(0),
    double? width,
    double? height,
    Color? collapsedBackgroundColor,
    Color? backgroundColor,
    bool isExpanded = false,
    bool hasBorder = false,
    double borderWidth = 0.2,
    Color borderColor = Colors.black,
    void Function(bool)? onExpansionChanged,
    // 1 Box Settings
    BoxShape boxShape = BoxShape.rectangle,
    Color boxColor = Colors.white,
    double? boxBorderRadius,
    double boxTopLeftBorderRadius = 0,
    double boxTopRightBorderRadius = 0,
    double boxBottomLeftBorderRadius = 0,
    double boxBottomRightBorderRadius = 0,

    // 2 Gradient Settings
    bool hasGradient = false,
    List<Color> gradientColors = const [],
    AlignmentGeometry gradientBegin = Alignment.topLeft,
    AlignmentGeometry gradientEnd = Alignment.bottomRight,

    // 4 Shadow Settings
    bool hasShadow = false,
    Color shadowColor = Colors.grey,
    Offset shadowOffset = const Offset(0, 0),
    int shadowAlphaColor = 255,
    double shadowBlurRadius = 20,
    double shadowSpreadRadius = 2,
  }) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: boxDecoration(
        boxShape: boxShape,
        boxColor: boxColor,
        boxTopLeftBorderRadius: boxTopLeftBorderRadius,
        boxTopRightBorderRadius: boxTopRightBorderRadius,
        boxBottomLeftBorderRadius: boxBottomLeftBorderRadius,
        boxBottomRightBorderRadius: boxBottomRightBorderRadius,
        boxBorderRadius: borderRadius,
        hasGradient: hasGradient,
        gradientColors: gradientColors,
        gradientBegin: gradientBegin,
        gradientEnd: gradientEnd,
        hasShadow: hasShadow,
        shadowAlphaColor: shadowAlphaColor,
        shadowBlurRadius: shadowBlurRadius,
        shadowColor: shadowColor,
        shadowOffset: shadowOffset,
        shadowSpreadRadius: shadowSpreadRadius,
        hasBorder: hasBorder,
        borderColor: borderColor,
        borderWidth: borderWidth,
      ),
      child: ExpansionTile(
        initiallyExpanded: isExpanded,
        title: textWidget(
          text: title,
        ),
        childrenPadding: childrenPadding,
        onExpansionChanged: onExpansionChanged,
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(collapsedBorderRadius)),
        collapsedBackgroundColor: collapsedBackgroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
            side: hasBorder
                ? BorderSide(
                    width: borderWidth,
                    color: borderColor,
                  )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius)),
        children: children,
      ),
    );
  }

  static Widget elevatedButton({
    required String text,
    double width = 100,
    double height = 50,
    Color buttonColor = Colors.blue,
    Color textColor = Colors.white,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          fixedSize: Size(width, height),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: buttonColor,
        ),
        child: textWidget(
          text: text,
          textColor: textColor,
        ),
      ),
    );
  }

  static Widget materialButton({
    String text = "",
    bool centerRow = false,
    bool expandedText = false,
    double? width,
    double? height = 60,
    double horizontalPadding = 0,
    double verticalPadding = 0,
    double fontSize = 15,
    Color buttonColor = Colors.blue,
    Color textColor = Colors.white,
    int? maxLines = 1,
    bool leadingIcon = false,
    bool iconOnly = false,
    bool isBold = false,
    IconData icon = Icons.info,
    Color iconColor = Colors.white,
    double iconSize = 30,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    EdgeInsetsGeometry iconPadding = const EdgeInsets.all(0),
    EdgeInsetsGeometry innerPadding = const EdgeInsets.all(10),
    // 1 Box Settings
    BoxShape boxShape = BoxShape.rectangle,
    Color boxColor = Colors.white,
    double? boxBorderRadius,
    double boxTopLeftBorderRadius = 0,
    double boxTopRightBorderRadius = 0,
    double boxBottomLeftBorderRadius = 0,
    double boxBottomRightBorderRadius = 0,

    // 2 Gradient Settings
    bool hasGradient = false,
    List<Color> gradientColors = const [],
    AlignmentGeometry gradientBegin = Alignment.topLeft,
    AlignmentGeometry gradientEnd = Alignment.bottomRight,
    VoidCallback? onPressed,

    // 3 Border Settings
    bool hasBorder = true,
    double borderWidth = 0,
    Color borderColor = Colors.transparent,

    // 4 Shadow Settings
    bool hasShadow = false,
    Color shadowColor = Colors.grey,
    Offset shadowOffset = const Offset(0, 2),
    int shadowAlphaColor = 255,
    double shadowBlurRadius = 10,
    double shadowSpreadRadius = 0.3,
  }) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      decoration: boxDecoration(
        boxShape: boxShape,
        boxColor: boxColor,
        boxBorderRadius: boxBorderRadius,
        boxTopLeftBorderRadius: boxTopLeftBorderRadius,
        boxTopRightBorderRadius: boxTopRightBorderRadius,
        boxBottomLeftBorderRadius: boxBottomLeftBorderRadius,
        boxBottomRightBorderRadius: boxBottomRightBorderRadius,
        hasGradient: hasGradient,
        gradientBegin: gradientBegin,
        gradientEnd: gradientEnd,
        gradientColors: gradientColors,
        hasBorder: hasBorder,
        borderWidth: borderWidth,
        borderColor: borderColor,
        hasShadow: hasShadow,
        shadowColor: shadowColor,
        shadowOffset: shadowOffset,
        shadowAlphaColor: shadowAlphaColor,
        shadowBlurRadius: shadowBlurRadius,
        shadowSpreadRadius: shadowSpreadRadius,
      ),
      child: Material(
        shape: boxShape == BoxShape.circle ? const CircleBorder() : null,
        borderRadius: boxShape == BoxShape.circle
            ? null
            : boxBorderRadius != null
                ? BorderRadius.circular(boxBorderRadius)
                : BorderRadius.only(
                    topLeft: Radius.circular(boxTopLeftBorderRadius),
                    topRight: Radius.circular(boxTopRightBorderRadius),
                    bottomLeft: Radius.circular(boxBottomLeftBorderRadius),
                    bottomRight: Radius.circular(boxBottomRightBorderRadius),
                  ),
        color: hasGradient ? Colors.transparent : buttonColor,
        child: InkWell(
          borderRadius: boxShape == BoxShape.circle
              ? BorderRadius.circular(500)
              : boxBorderRadius != null
                  ? BorderRadius.circular(boxBorderRadius)
                  : BorderRadius.only(
                      topLeft: Radius.circular(boxTopLeftBorderRadius),
                      topRight: Radius.circular(boxTopRightBorderRadius),
                      bottomLeft: Radius.circular(boxBottomLeftBorderRadius),
                      bottomRight: Radius.circular(boxBottomRightBorderRadius),
                    ),
          onTap: onPressed,
          child: Padding(
              padding: innerPadding,
              child: iconOnly
                  ? Icon(
                      icon,
                      color: iconColor,
                      size: iconSize,
                    )
                  : Row(
                      mainAxisSize: mainAxisSize,
                      mainAxisAlignment: centerRow
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (leadingIcon)
                          Padding(
                            padding: iconPadding,
                            child: Center(
                              child: Icon(
                                icon,
                                color: iconColor,
                                size: iconSize,
                              ),
                            ),
                          ),
                        if (text.isNotEmpty && expandedText)
                          Expanded(
                            child: OverflowBox(
                              maxWidth: double.infinity,
                              alignment: Alignment.centerLeft,
                              child: Center(
                                child: textWidget(
                                  text: text,
                                  textColor: textColor,
                                  fontSize: fontSize,
                                  maxLines: maxLines,
                                  isEllipsis: true,
                                ),
                              ),
                            ),
                          ),
                        if (text.isNotEmpty && !expandedText)
                          Center(
                            child: textWidget(
                              text: text,
                              textColor: textColor,
                              fontSize: fontSize,
                              maxLines: maxLines,
                            ),
                          ),
                      ],
                    )),
        ),
      ),
    );
  }

  static Widget checkbox({
    bool isActive = false,
    String text = "",
    double fontSize = 15,
    bool isBold = false,
    double checkboxSize = 24.0,
    double borderRadius = 5.0,
    VoidCallback? onTap,
    Color activeCheckboxColor = Colors.blue,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      padding: padding,
      margin: margin,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: onTap ??= () {},
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                width: checkboxSize,
                height: checkboxSize,
                decoration: boxDecoration(
                  boxBorderRadius: borderRadius,
                  hasBorder: true,
                  borderColor: isActive ? activeCheckboxColor : Colors.grey,
                  borderWidth: 2,
                ),
                // alignment: Alignment.center,
                child: isActive
                    ? Icon(
                        Icons.check,
                        color: activeCheckboxColor,
                        size: checkboxSize * 0.8,
                      )
                    : null,
              ),
            ),
          ),
          textWidget(
            text: text,
            fontSize: fontSize,
            isBold: isBold,
          ),
        ],
      ),
    );
  }

  static Widget slider({
    String title = "",
    double value = 0,
    double checkboxSize = 24.0,
    double borderRadius = 4.0,
    double minValue = 1,
    double maxValue = 50,
    double verticalPadding = 0,
    double horizontalPadding = 0,
    void Function(double)? onChanged,
    Color activeCheckboxColor = Colors.blue,
    // 2 Border Settings
    bool hasBorder = true,
    double? boxBorderRadius,
    double borderWidth = 0.9,
    double boxTopLeftBorderRadius = 10,
    double boxTopRightBorderRadius = 10,
    double boxBottomLeftBorderRadius = 10,
    double boxBottomRightBorderRadius = 10,
    Color borderColor = Colors.grey,

    // 3 Shadow Settings
    bool hasShadow = false,
    Color shadowColor = Colors.grey,
    Offset shadowOffset = const Offset(0, 2),
    int shadowAlphaColor = 255,
    double shadowBlurRadius = 10,
    double shadowSpreadRadius = 0.3,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: textWidget(
              text: title,
              isBold: true,
            ),
          ),
          Container(
            decoration: boxDecoration(
              boxTopLeftBorderRadius: boxTopLeftBorderRadius,
              boxTopRightBorderRadius: boxTopRightBorderRadius,
              boxBottomLeftBorderRadius: boxBottomLeftBorderRadius,
              boxBottomRightBorderRadius: boxBottomRightBorderRadius,
              hasBorder: hasBorder,
              borderWidth: borderWidth,
              borderColor: borderColor,
            ),
            child: Slider(
              value: value,
              onChanged: onChanged,
              min: minValue,
              max: maxValue,
            ),
          ),
        ],
      ),
    );
  }

  static Widget listTile({
    String title = "",
    String subtitle = "",
    IconData icon = Icons.info,
    Color iconColor = Colors.black,
    VoidCallback? onTap,
  }) {
    return ListTile(
      title: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            Text(title),
          ],
        ),
      ),
      onTap: onTap,
      subtitle: Text(subtitle),
    );
  }

  static Widget popupMenuButton({
    List<PopupMenuItem> options = const [],
    IconData icon = Icons.more_vert,
    Color iconColor = Colors.black,
    double? iconSize,
  }) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      icon: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      itemBuilder: (context) {
        return options;
      },
    );
  }

  static void showToast({
    String text = "",
    Color textColor = Colors.white,
    Color backgroundColor = Colors.black,
    ToastGravity gravity = ToastGravity.BOTTOM,
    double fontSize = 16,
    int timeInSecForIosWeb = 1,
  }) {
    Fluttertoast.showToast(
      msg: text,
      textColor: textColor,
      backgroundColor: backgroundColor,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIosWeb,
      fontSize: fontSize,
    );
  }
}
