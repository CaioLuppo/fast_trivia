import 'package:fast_trivia/controller/components/page_view_controller.dart';
import 'package:fast_trivia/controller/util/system.dart';
import 'package:fast_trivia/controller/store/confirmation_store.dart';
import 'package:fast_trivia/controller/store/trivia_appbar_store.dart';
import 'package:fast_trivia/view/global_components/trivia_app_bar.dart';
import 'package:fast_trivia/view/resources/themes.dart';
import 'package:fast_trivia/view/screens/confirmation/confirmation_screen.dart';
import 'package:fast_trivia/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FastTrivia());
}

class FastTrivia extends StatelessWidget {
  const FastTrivia({super.key});
  static final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    updateSystemUi();
    return MaterialApp(
      theme: lightTheme,
      home: MultiProvider(
        providers: [
          Provider(create: (context) => TriviaAppBarStore()),
          Provider(create: (context) => ConfirmationStore()),
        ],
        child: Builder(
          builder: (context) {
            final store = Provider.of<TriviaAppBarStore>(
              context,
              listen: false,
            );
            return WillPopScope(
              onWillPop: () => onWillPop(context, pageController, store),
              child: Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      Observer(
                        builder: (context) => TriviaAppBar(
                          elevate: store.elevate,
                          showBackButton: store.showBackButton,
                        ),
                      ),
                      Expanded(
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (pageIndex) {
                            TriviaAppBar.updateProperties(
                              context,
                              pageIndex == TriviaPages.home.index
                                  ? false
                                  : true,
                            );
                          },
                          controller: pageController,
                          children: const [
                            HomeScreen(),
                            ConfirmationScreen(),
                            Column(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
