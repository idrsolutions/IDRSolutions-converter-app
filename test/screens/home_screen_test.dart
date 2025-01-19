import 'package:converter/components/buildvu_format_selection.dart';
import 'package:converter/components/formvu_format_selection.dart';
import 'package:converter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createHomeScreen(){
  return ProviderScope(
    child: MaterialApp(
      home: HomeScreen(),
    )
  );
}

void main() {

  group('home screen widget test', (){
    testWidgets('test if appbar shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('IDRSolutions Converter'), findsOneWidget);
    });

    testWidgets('test if BuildVu format picker shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(BuildVuFormatSelection), findsOneWidget);
    });

    testWidgets('test if FormVu format picker shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(FormVuFormatSelection), findsOneWidget);
    });

    testWidgets('test if contact us btn shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(Key('contactUsBtn')), findsOneWidget);
    });
  });

  group('BuildVu format selection widget test', (){
    testWidgets('test if title shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('PDF/ Word/ PowerPoint/ Excel to HTML/ SVG'), findsOneWidget);
    });

    testWidgets('test if 2 format dropdowns both show up and are clickable', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      await tester.tap(find.byKey(Key('originalFormatDropdown')));
      expect(find.text('Word (.doc)'), findsOneWidget);

      await tester.tap(find.byKey(Key('convertedFormatDropdown')));
      expect(find.text('SVG'), findsOneWidget);
    });

    testWidgets('test if BuildVu logo shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(Key('buildvuLogo')), findsOneWidget);
    });

    testWidgets('test if BuildVu GO btn shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(Key('buildvuGo')), findsOneWidget);
    });
  });

  group('FormVu format selection widget test', (){
    testWidgets('test if title shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Fillable PDF to HTML'), findsOneWidget);
    });

    testWidgets('test if FormVu logo shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(Key('formvuLogo')), findsOneWidget);
    });

    testWidgets('test if FormVu GO btn shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(Key('formvuGo')), findsOneWidget);
    });
  });
}