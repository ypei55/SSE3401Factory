import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lab5_factory/main.dart' as app;

void main(){
  group('Test Lab 5 Factory', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('test function', (tester) async{
      app.main();
      await tester.pumpAndSettle();

      final phoneField = find.byType(TextField);
      final codeCheckbox = find.byType(Checkbox);
      final getActivationCode = find.byType(ElevatedButton);
      final otp = find.byType(TextField);
      final activate = find.byType(ElevatedButton);
      final fac1 = find.text('Factory 1').first;
      final fac2 = find.text('Factory 2').first;
      final fac3 = find.text('Factory 3').first;
      final person = find.byIcon(Icons.person);
      final invite = find.text('+');
      final name = find.byType(TextField).first;
      final telNumField = find.byType(TextField).last;
      final submit = find.byType(ElevatedButton);
      final understand = find.byType(TextButton);
      final setting = find.byIcon(Icons.settings).last;

      await tester.enterText(phoneField, "01234567891");
      await tester.tap(codeCheckbox);
      await tester.pumpAndSettle();
      
      await tester.tap(getActivationCode);
      await tester.pumpAndSettle();

      await tester.enterText(otp, "263454");
      await tester.pumpAndSettle();

      await tester.tap(activate);
      await tester.pumpAndSettle();

      // Verify initial state
      expect(fac1, findsOneWidget);
      expect(fac2, findsOneWidget);
      expect(fac3, findsOneWidget);

      // Tap on Factory 2 container
      await tester.tap(fac2);
      await tester.pumpAndSettle();

      // Tap on Factory 1 container
      await tester.tap(fac1);
      await tester.pumpAndSettle();

      // Tap on bottom navigation bar (icons.person)
      await tester.tap(person);
      await tester.pumpAndSettle();

      // invite new engineer
      await tester.tap(invite);
      await tester.pumpAndSettle();
      
      //test alert message
      await tester.tap(submit);
      await tester.pumpAndSettle();

      await tester.tap(understand); 
      await tester.pumpAndSettle();

      //enter name and test alert message
      await tester.enterText(name, "yp");
      await tester.tap(submit);
      await tester.pumpAndSettle();

      await tester.tap(understand);
      await tester.pumpAndSettle();

      //enter phone number 
      await tester.enterText(telNumField, "0129738577");
      await tester.pumpAndSettle();

      //Tap on submit 
      await tester.tap(submit);
      await tester.pumpAndSettle();

      //Tap on bottom navigation bar (icons.settings)
      await tester.tap(setting);
      await tester.pumpAndSettle();
    });
   });
}