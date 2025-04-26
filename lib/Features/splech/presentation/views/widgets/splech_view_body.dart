import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/constents.dart';
import 'package:movies_app/core/utils/go_route.dart';

class SplachViewBody extends StatelessWidget {
  const SplachViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).go(APiGoRouter.homeView);
    });

    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 46, 40, 16),
              Color(0xff18160D),
              Color(0xff18160D),
              Color(0xff18160D),
              Color(0xff18160D),
              Color(0xff18160D),
              Color.fromARGB(255, 46, 40, 16),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Image.asset(
          AssetsData.image,
          fit: BoxFit.none,

          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
