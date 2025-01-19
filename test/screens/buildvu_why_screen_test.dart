import 'package:converter/components/appbar.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/components/checkbox.dart';
import 'package:converter/components/clickable_logo.dart';
import 'package:converter/components/text_fields.dart';
import 'package:converter/screens/others/why_buildvu_screen.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createHomeScreen(){
  return ProviderScope(
    child: MaterialApp(
      home: WhyBuildVuScreen(),
    )
  );
}

void main() {

  group('BuildVu why screen widget test', (){
    testWidgets('test if appbar shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(StyledAppbar), findsOneWidget);
    });
    
    testWidgets('test if titles show up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(StyledTitleBuildVu), findsExactly(4));
    });

    testWidgets('test if contents show up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(StyledText), findsExactly(4));
    });

    testWidgets('test if learn more btn shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ColorfulBgBtn), findsOneWidget);
    });
  });
}
