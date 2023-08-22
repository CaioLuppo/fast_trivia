import 'package:fast_trivia/controller/store/trivia_appbar_store.dart';
import 'package:fast_trivia/main.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TriviaAppBar extends StatelessWidget {
  final bool elevate;
  final bool showBackButton;
  final BuildContext context;

  const TriviaAppBar(
    this.context, {
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
                    padding: const EdgeInsets.only(left: 16),
                    onPressed: () {
                      Provider.of<TriviaAppBarStore>(this.context,
                              listen: false)
                          .updateProperties(
                        elevate: false,
                        showBackButton: false,
                      );
                      MainApp.pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
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
}
