import 'package:converter/components/appbar.dart';
import 'package:converter/components/buttons.dart';
import 'package:converter/screens/others/which_to_choose_screen.dart';
import 'package:converter/themes/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createHomeScreen(){
  return ProviderScope(
    child: MaterialApp(
      home: WhichToChooseScreen(),
    )
  );
}

void main() {

  group('which-to-choose screen widget test', (){
    testWidgets('test if appbar shows up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(StyledAppbar), findsOneWidget);
    });
    
    testWidgets('test if titles show up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(StyledTitleBuildVu), findsOneWidget);
      expect(find.byType(StyledTitleFormVu), findsOneWidget);
    });

    testWidgets('test if contents show up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(StyledText), findsExactly(6));
    });

    testWidgets('test if learn more btns show up', (tester)async{
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ColorfulBgBtn), findsExactly(2));
    });
  });
}
