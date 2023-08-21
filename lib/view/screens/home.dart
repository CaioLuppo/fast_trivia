import 'package:fast_trivia/view/global_components/trivia_app_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TriviaAppBar(),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
