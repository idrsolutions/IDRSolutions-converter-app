import 'package:converter/components/appbar.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/components/checkbox.dart';
import 'package:converter/components/clickable_logo.dart';
import 'package:converter/components/text_fields.dart';
import 'package:converter/screens/convert/formvu_converter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createHomeScreen(){
  return ProviderScope(
    child: MaterialApp(
      home: FormvuConverterScreen(),
    )
  );
}

void main() {

  group('FormVu converter screen widget test', (){
    testWidgets('test if appbar shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(StyledAppbar), findsOneWidget);
    });
    
    testWidgets('test if logo shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ClickableLogo), findsOneWidget);
    });

    testWidgets('test if why btn shows up and is clickable', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(Key('whyBtn')), findsOne);
      await tester.tap(find.byKey(Key('whyBtn')));
      await tester.pumpAndSettle();
      expect(find.text('Why FormVu?'), findsOne);
    });

    testWidgets('test if select btn and convert btn show up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(Key('selectBtn')), findsOne);
      expect(find.byType(ColorfulBgBtn), findsOneWidget);
    });

    testWidgets('test if clicking on convert btn without selecting a file, a snackbar shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ColorfulBgBtn), findsOneWidget);
      await tester.tap(find.byType(ColorfulBgBtn));
      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('test if img scale text field and submit url text field show up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(RectangleTextField), findsExactly(2));
    });

    testWidgets('test if type in non-number in img scale text field, snackbar shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      await tester.enterText(find.byKey(Key('imgScaleTextField')), 'a');
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('test if type in off-limit number in img scale text field, the number changes according to logic', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      await tester.enterText(find.byKey(Key('imgScaleTextField')), '99');
      await tester.pumpAndSettle(const Duration(seconds: 1));
      
      final textField = tester.widget<RectangleTextField>(find.byKey(Key('imgScaleTextField')));
      expect(textField.controller.text, '10.0');
    });

    testWidgets('test if text mode shows up and is selectable', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      await tester.tap(find.byKey(Key('textModeDropDown')));
      expect(find.text('Shape Text'), findsOneWidget);
    });

    testWidgets('test if single file form checkbox shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(StyledCheckbox),findsOneWidget);
    });

    testWidgets('test if border color picker shows up and is clickable', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(Key('borderColorPicker')), findsOne);
      await tester.tap(find.byKey(Key('borderColorPicker')));
      await tester.pumpAndSettle();
      expect(find.byType(HueRingPicker),findsOneWidget);
    });

    testWidgets('test if background color picker shows up and is clickable', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(Key('backgroundColorPicker')), findsOne);
      await tester.tap(find.byKey(Key('backgroundColorPicker')));
      await tester.pumpAndSettle();
      expect(find.byType(HueRingPicker),findsOneWidget);
    });
  });
}
