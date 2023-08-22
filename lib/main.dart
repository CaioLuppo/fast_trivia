import 'package:fast_trivia/controller/store/trivia_appbar_store.dart';
import 'package:fast_trivia/view/global_components/trivia_app_bar.dart';
import 'package:fast_trivia/view/resources/themes.dart';
import 'package:fast_trivia/view/screens/confirmation/confirmation_screen.dart';
import 'package:fast_trivia/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: Provider(
        create: (context) => TriviaAppBarStore(),
        child: Builder(
          builder: (context) {
            final store = Provider.of<TriviaAppBarStore>(
              context,
              listen: false,
            );
            return WillPopScope(
              onWillPop: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
                store.updateProperties(
                  showBackButton: false,
                  elevate: false,
                );
                return Future.value(false);
              },
              child: SafeArea(
                child: Scaffold(
                  body: Column(
                    children: [
                      Observer(
                        builder: (context) => TriviaAppBar(
                          context,
                          elevate: store.elevate,
                          showBackButton: store.showBackButton,
                        ),
                      ),
                      Expanded(
                        child: PageView(
                          controller: pageController,
                          children: const [
                            HomeScreen(),
                            ConfirmationScreen(),
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
