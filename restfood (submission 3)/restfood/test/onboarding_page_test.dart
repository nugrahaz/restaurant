import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:restfood/app/constants/constants.dart';
import 'package:restfood/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:restfood/app/modules/onboarding/views/onboarding_page.dart';

void main() {
  Widget onboardingPage() => GetMaterialApp(
        initialBinding: OnboardingBinding(),
        getPages: AppRoutes.getPages,
        // initialRoute: AppRoutes.onboardingPage,
        home: const OnboardingPage(),
        //
      );

  testWidgets("Test button onboarding", (tester) async {
    tester.view.physicalSize = const Size(300, 500);

    // me-render UI dari widget yang telah didefinisikan sebelumnya.
    await tester.pumpWidget(onboardingPage());

    await tester.ensureVisible(find.byKey(const Key("forward")));
    await tester.tap(find.byKey(const Key("forward")));

    // Rebuild tampilan karena perubahan state
    await tester.pumpAndSettle();

    //cek apakah tombol previous pada onboarding muncul setelah klik tombol forward
    expect(find.byKey(const Key("previous")), findsOneWidget);
  });
}
