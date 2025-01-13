import 'package:converter/components/buttons.dart';
import 'package:converter/components/clickable_logo.dart';
import 'package:converter/screens/convert_result/buildvu_success_screen.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createHomeScreen(){
  return ProviderScope(
    child: MaterialApp(
      home: BuildvuSuccessScreen(),
    )
  );
}

void main() {

  group('BuildVu success screen widget test', (){
    testWidgets('test if app bar shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('test if logo shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ClickableLogo), findsOneWidget);
    });

    testWidgets('test if preview, download, convert, learn more btns show up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(WhiteBgBtn), findsExactly(3));
      expect(find.byType(ColorfulBgBtn), findsOneWidget);
    });

    testWidgets('test if the words show up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(StyledHeading), findsOneWidget);
      expect(find.byType(StyledText), findsOneWidget);
      expect(find.byKey(Key('businessRequirement')), findsOneWidget);
    });
  });
}
