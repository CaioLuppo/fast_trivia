import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TriviaAppBar extends AppBar {
  TriviaAppBar({
    super.key,
    bool shadow = false,
    Function? onReturn,
  }) : super(
          titleSpacing: 0,
          toolbarHeight: 98,
          elevation: shadow ? null : 0,
          title: SizedBox(
            width: double.maxFinite,
            height: 98,
            child: Stack(
              children: [
                onReturn != null
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          padding: const EdgeInsets.only(left: 16),
                          onPressed: onReturn(),
                          icon: SvgPicture.asset(
                            "assets/leading_appbar.svg",
                          ),
                        ),
                      )
                    : Container(),
                FractionalTranslation(
                  translation: const Offset(0.485, 0.5),
                  child: SvgPicture.asset("assets/logo.svg"),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset("assets/separator.svg"),
                ),
              ],
            ),
          ),
        );
}
