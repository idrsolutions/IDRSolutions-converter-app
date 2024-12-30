import 'package:converter/models/file_formats.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OriginalFileNotifier extends Notifier<OriginalFile>{
  @override
  OriginalFile build() {
    return const OriginalFile(path: '');
  }

  void updateFile({
    String? path, 
    String? format, 
    String? password, 
    double? scale, 
    bool? isToEmbed, 
    bool? isInlineSVG,
    String? ui,
    String? textMode}){
      // update the file
      state = state.copyWith(
        path: path ?? state.path,
        format: format ?? state.format,
        password: password ?? state.password,
        scale: scale ?? state.scale,
        isToEmbed: isToEmbed ?? state.isToEmbed,
        isInlineSVG: isInlineSVG ?? state.isInlineSVG,
        ui: ui ?? state.ui,
        textMode: textMode ?? state.textMode,
      );
    }
}

// default file
final originalFileProvider = NotifierProvider<OriginalFileNotifier, OriginalFile>((){
  return OriginalFileNotifier();
});


class ConvertedFileNotifier extends Notifier<ConvertedFile>{
  @override
  ConvertedFile build() {
    return const ConvertedFile();
  }

  void updateFile({
    String? previewURL,
    String? downloadURL}){
      // update the file
      state = state.copyWith(
        previewURL: previewURL ?? state.previewURL,
        downloadURL: downloadURL ?? state.downloadURL,
      );
    }
}

// default file
final convertedFileProvider = NotifierProvider<ConvertedFileNotifier, ConvertedFile>((){
  return ConvertedFileNotifier();
});