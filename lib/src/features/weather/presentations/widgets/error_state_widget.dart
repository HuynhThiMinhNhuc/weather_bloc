import 'package:example_app/src/core/theme/dimens.dart';
import 'package:example_app/src/core/theme/palette.dart';
import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  final void Function() onRefresh;
  const ErrorStateWidget({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.kE85959,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.pt32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Something went wrong at our end!',
              style: TextStyle(
                color: Palette.kFFFFFF,
                fontSize: Dimens.pt54,
                fontWeight: FontWeight.w100,
              ),
            ),
            const SizedBox(height: Dimens.pt44),
            ElevatedButton(
              onPressed: onRefresh,
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Palette.k4A4A4A),
                shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
              ),
              child: Text(
                'RETRY',
                style: TextStyle(
                  color: Palette.kFFFFFF,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
