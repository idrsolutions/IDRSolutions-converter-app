import 'package:converter/components/buildvu_format_selection.dart';
import 'package:converter/components/buttons.dart';
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

    testWidgets('test if contact us btn shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byKey(Key('contactUsBtn')), findsOneWidget);
    });
  });
}