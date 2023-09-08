import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/data_tab.dart';

class FlutterTabs extends StatefulWidget {
  final List<String> labels;
  final List<IconData?>? icons;
  final int selectedIndex;
  final double? width;
  final double? height;
  final bool isScroll;

  final BoxDecoration? selectedDecoration;
  final BoxDecoration? unSelectedDecoration;
  final List<Color>? selectedBackgroundColors;
  final List<Color>? unSelectedBackgroundColors;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;
  final Function(int) selectedLabelIndex;
  final double? borderRadius;
  final Alignment? begin;
  final Alignment? end;
  final double? elevation;
  final Border? border;

  final EdgeInsets? marginSelected;
  final bool isShadowEnable;

  const FlutterTabs(
      {Key? key,
        required this.labels,
        this.icons,
        required this.selectedIndex,
        this.width,
        this.height,
        required this.isScroll,
        this.selectedDecoration,
        this.unSelectedDecoration,
        this.selectedBackgroundColors,
        this.unSelectedBackgroundColors,
        required this.selectedTextStyle,
        required this.unSelectedTextStyle,
        required this.selectedLabelIndex,
        this.borderRadius,
        this.begin,
        this.end,
        this.elevation,
        this.border,
        this.marginSelected,
        required this.isShadowEnable})
      : super(key: key);

  @override
  _FlutterTabsState createState() => _FlutterTabsState();
}

class _FlutterTabsState extends State<FlutterTabs> {
  final List<DataTab> _labels = [];

  /// Set default selected for first build
  void _setDefaultSelected() {
    setState(() {
      /// loops label from widget labels
      for (int x = 0; x < widget.labels.length; x++) {
        _labels.add(DataTab(title: widget.labels[x], isSelected: false));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    /// init default selected in InitState
    _setDefaultSelected();
  }

  /// Update selected when selectedItem changed
  void _updateSelected() {
    setState(() {
      /// set all item to false
      for (final item in _labels) {
        item.isSelected = false;
      }

      /// Update selectedIndex isSelected to True
      _labels[widget.selectedIndex].isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _updateSelected();

    /// Check if width is null or not
    var width = widget.width != null
        ? widthInPercent(widget.width!, context)
        : widthInPercent(100, context);

    /// Show text error if length less 1
    return widget.labels.length <= 1
        ? const Text(
      "Error : Label should >1",
      style: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    )
        : Container(
        width: width,
        height: widget.height ?? 45,

        /// Default height is 45
        decoration: BoxDecoration(
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: widget.begin ?? Alignment.topCenter,
              end: widget.end ?? Alignment.bottomCenter,

              /// If unSelectedBackground is not null
              /// We check again if it's length only 1
              /// Using same color for gradients
              colors: widget.unSelectedBackgroundColors != null
                  ? (widget.unSelectedBackgroundColors!.length == 1
                  ? [
                widget.unSelectedBackgroundColors![0],
                widget.unSelectedBackgroundColors![0]
              ]
                  : widget.unSelectedBackgroundColors!)
                  : const [Color(0xffffffff), Color(0xffffffff)],
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),

            /// Handle if shadow is Enable or not
            boxShadow: [if (widget.isShadowEnable) bsInner]),
        child: ListView.builder(
          itemCount: _labels.length,

          /// Handle if isScroll or not
          physics: widget.isScroll
              ? const BouncingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            IconData? icon;

            // Using try catch to fix error Range array
            try {
              icon = widget.icons?[index];
            } catch (e) {
              icon = null;
            }

            return TabsButtons(
              marginSelected: widget.marginSelected,

              /// If unSelectedBackground is not null
              /// We check again if it's length only 1
              /// Using same color for gradients
              unSelectedColors: widget.unSelectedBackgroundColors != null
                  ? (widget.unSelectedBackgroundColors!.length == 1
                  ? [
                widget.unSelectedBackgroundColors![0],
                widget.unSelectedBackgroundColors![0]
              ]
                  : widget.unSelectedBackgroundColors)
                  : const [Color(0xffe0e0e0), Color(0xffe0e0e0)],
              width: width / widget.labels.length,
              title: _labels[index].title,
              icons: icon,
              selectedTextStyle: widget.selectedTextStyle,
              unSelectedTextStyle: widget.unSelectedTextStyle,
              isSelected: _labels[index].isSelected,
              radius: widget.borderRadius ?? 2,

              /// If selectedBackgroundColors is not null
              /// We check again if it's length only 1
              /// Using same color for gradients
              selectedColors: widget.selectedBackgroundColors != null
                  ? (widget.selectedBackgroundColors!.length == 1
                  ? [
                widget.selectedBackgroundColors![0],
                widget.selectedBackgroundColors![0]
              ]
                  : widget.selectedBackgroundColors)
                  : [
                Theme
                    .of(context)
                    .primaryColor,
                Theme
                    .of(context)
                    .primaryColor
              ],
              onPressed: () {
                try {
                  for (int x = 0; x < _labels.length; x++) {
                    setState(() {
                      if (_labels[index] == _labels[x]) {
                        _labels[x].isSelected = true;

                        /// Send value to callback
                        widget.selectedLabelIndex(index);
                      } else {
                        _labels[x].isSelected = false;
                      }
                    });
                  }
                } catch (e) {
                  print("err : $e");
                }
              },
            );
          },
        )
    );
  }
}

class TabsButtons extends StatefulWidget {
  final String? title;
  final Function? onPressed;
  final double? width;
  final double? height;
  final List<Color>? selectedColors;
  final List<Color>? unSelectedColors;
  final TextStyle? selectedTextStyle;
  final TextStyle? unSelectedTextStyle;

  final BoxDecoration? selectedDecoration;
  final BoxDecoration? unSelectedDecoration;
  final bool? isSelected;
  final double? radius;
  final IconData? icons;

  final Alignment? begin;
  final Alignment? end;

  final EdgeInsets? marginSelected;
  const TabsButtons(
      {Key? key,
        this.title,
        this.onPressed,
        this.width,
        this.height,
        this.selectedColors,
        this.unSelectedColors,
        this.selectedTextStyle,
        this.unSelectedTextStyle,
        this.isSelected,
        this.radius,
        this.icons,
        this.begin,
        this.end,
        this.marginSelected,
        this.selectedDecoration,
        this.unSelectedDecoration})
      : super(key: key);

  @override
  _TabsButtonsState createState() => _TabsButtonsState();
}

class _TabsButtonsState extends State<TabsButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width ?? widthInPercent(100, context),
        height: widget.height ?? 50,
        //wrap with container to fix margin issue
        child: Container(
          margin: widget.isSelected! ? widget.marginSelected : EdgeInsets.zero,
          decoration: widget.isSelected!
              ? bdHeader.copyWith(
              borderRadius: BorderRadius.circular(widget.radius ?? 0),
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: widget.begin ?? Alignment.topCenter,
                end: widget.end ?? Alignment.bottomCenter,
                colors: widget.selectedColors ??
                    [Theme.of(context).primaryColor],
              ))
              : null,
          child: TextButton(
            onPressed: widget.onPressed as void Function()?,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icons != null
                    ? Icon(
                  widget.icons,
                  color: widget.isSelected!
                      ? widget.selectedTextStyle!.color
                      : widget.unSelectedTextStyle!.color,
                )
                    : Container(),
                Visibility(
                  visible: widget.icons != null,
                  child: const SizedBox(
                    width: 4,
                  ),
                ),
                Text(
                  widget.title!,
                  style: widget.isSelected!
                      ? widget.selectedTextStyle
                      : widget.unSelectedTextStyle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ));
  }
}

widthInPercent(double percent, BuildContext context) {
  var toDouble = percent / 100;
  return MediaQuery.of(context).size.width * toDouble;
}

heightInPercent(double percent, BuildContext context) {
  var toDouble = percent / 100;
  return MediaQuery.of(context).size.height * toDouble;
}

const BoxShadow bsInner = BoxShadow(
  color: Colors.black12,
  offset: Offset(0.0, 0),
  blurRadius: 0,
  spreadRadius: -1.0,
);

const BoxShadow bsOuter = BoxShadow(
  color: Colors.black12,
  offset: Offset(0.0, 0),
  blurRadius: 0,
  spreadRadius: 0,
);

const BoxDecoration bdHeader = BoxDecoration(boxShadow: [bsOuter]);
