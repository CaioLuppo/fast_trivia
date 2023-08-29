import 'package:fast_trivia/controller/components/page_view_controller.dart';
import 'package:fast_trivia/controller/store/trivia_appbar_store.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TriviaAppBar extends StatelessWidget {
  final bool elevate;
  final bool showBackButton;

  const TriviaAppBar({
    super.key,
    required this.elevate,
    required this.showBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      decoration: elevate
          ? BoxDecoration(
              color: TriviaColors.scaffoldBg,
              boxShadow: const [BoxShadow(blurRadius: 4, offset: Offset(0, 4))],
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      width: double.maxFinite,
      child: Stack(
        children: [
          showBackButton
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    padding: const EdgeInsets.only(left: 16),
                    onPressed: () => changeToPreviousPage(),
                    icon: SvgPicture.asset("assets/leading_appbar.svg"),
                  ),
                )
              : Container(),
          Center(
            child: SvgPicture.asset("assets/logo.svg"),
          ),
          !elevate
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset("assets/separator.svg"),
                )
              : Container(),
        ],
      ),
    );
  }

  static updateProperties(BuildContext context, bool showButton) {
    Provider.of<TriviaAppBarStore>(
      context,
      listen: false,
    ).updateProperties(elevate: false, showBackButton: showButton);
  }
}
