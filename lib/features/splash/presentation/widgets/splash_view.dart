import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../config/config.dart';
import '../../../../gen/assets.gen.dart';

part 'splash_background.dart';

part 'app_logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), _showModal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashBackground(
        child: Center(
          child: AppLogo(size: MediaQuery.of(context).size.width * 0.4),
        ),
      ),
    );
  }

  void _showModal() {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,

      backgroundColor: Colors.transparent,
      isDismissible: false,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.lg,
            vertical: Spacing.xl,
          ),
          child: Container(
            color: theme.colorScheme.primaryContainer,
            padding: const EdgeInsets.symmetric(horizontal: Spacing.lg),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Spacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Welcome!', style: theme.textTheme.displayMedium),
                  const Gap(Spacing.lg),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Scan bottle'),
                    ),
                  ),
                  const Gap(Spacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Have an account?',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.router.push(const SignInRoute());
                        },
                        child: const Text('Sign in first'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
