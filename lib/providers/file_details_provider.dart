import 'package:converter/models/file_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuildVuOriginalFileNotifier extends Notifier<BuildVuOriginalFile>{
  @override
  BuildVuOriginalFile build() {
    return const BuildVuOriginalFile(path: '');
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
final buildvuOriginalFileProvider = NotifierProvider<BuildVuOriginalFileNotifier, BuildVuOriginalFile>((){
  return BuildVuOriginalFileNotifier();
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