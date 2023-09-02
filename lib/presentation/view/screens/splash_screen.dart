import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_search/core/constants.dart';
import 'package:github_search/core/routing/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _goToNextScreen(context));
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          color: SearchColors.accentPrimary,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Search app',
                  style: SearchTextStyles.header
                      .copyWith(color: SearchColors.main),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CupertinoActivityIndicator(
                  color: SearchColors.textPlaceholder,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _goToNextScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      context.router.replace(const SearchScreenRoute());
    }
  }
}
