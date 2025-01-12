import 'package:converter/components/buttons.dart';
import 'package:converter/components/checkbox.dart';
import 'package:converter/components/clickable_logo.dart';
import 'package:converter/components/text_fields.dart';
import 'package:converter/screens/convert/buildvu_converter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createHomeScreen(){
  return ProviderScope(
    child: MaterialApp(
      home: BuildVuConverterScreen(),
    )
  );
}

void main() {

  group('BuildVu converter screen widget test', (){
    testWidgets('test if logo shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ClickableLogo), findsOneWidget);
    });

    testWidgets('test if why btn, select btn and convert btn show up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(WhiteBgBtn), findsExactly(2));
      expect(find.byType(ColorfulBgBtn), findsOneWidget);
    });

    testWidgets('test if pdf password text field and img scale text field show up', (tester)async{
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

    testWidgets('test if idr ui dropdown shows up and is selectable', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      await tester.tap(find.byKey(Key('uiDropDown')));
      expect(find.text('Clean'), findsOneWidget);
    });

    testWidgets('test if text mode shows up and is selectable', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      await tester.tap(find.byKey(Key('textModeDropDown')));
      expect(find.text('Shape Text'), findsOneWidget);
    });

    testWidgets('test if embed checkbox and inline checkbox show up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(StyledCheckbox), findsExactly(2));
    });
  });
}
