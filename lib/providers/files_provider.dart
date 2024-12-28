import 'package:converter/models/file_format.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OriginalFileNotifier extends Notifier<OriginalFile>{
  @override
  OriginalFile build() {
    return const OriginalFile(path: '');
  }

  void updateFile(
    {String? path, 
    String? password, 
    double? scale, 
    bool? isToEmbed, 
    bool? isInlineSVG,
    String? ui,
    String? textMode}){
      // update the file
      state = state.copyWith(
        path: path ?? state.path,
        password: password ?? state.password,
        scale: scale ?? state.scale,
        isToEmbed: isToEmbed ?? state.isToEmbed,
        isInlineSVG: isInlineSVG ?? state.isInlineSVG,
        ui: ui ?? state.ui,
        textMode: textMode ?? state.textMode,
      );
    }
}

// default path
final originalFileProvider = NotifierProvider<OriginalFileNotifier, OriginalFile>((){
  return OriginalFileNotifier();
});