import 'package:converter/models/file_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// BuildVu original file
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
    bool? isEmbedImage, 
    bool? isInlineSVG,
    String? ui,
    String? textMode}){
      // update the file
      state = state.copyWith(
        path: path ?? state.path,
        format: format ?? state.format,
        password: password ?? state.password,
        scale: scale ?? state.scale,
        isEmbedImage: isEmbedImage ?? state.isEmbedImage,
        isInlineSVG: isInlineSVG ?? state.isInlineSVG,
        ui: ui ?? state.ui,
        textMode: textMode ?? state.textMode,
      );
    }
}

// default
final buildvuOriginalFileProvider = NotifierProvider<BuildVuOriginalFileNotifier, BuildVuOriginalFile>((){
  return BuildVuOriginalFileNotifier();
});

// FormVu original file
class FormVuOriginalFileNotifier extends Notifier<FormVuOriginalFile>{
  @override
  FormVuOriginalFile build() {
    return const FormVuOriginalFile(path: '');
  }

  void updateFile({
    String? path, 
    String? format, 
    double? scale, 
    bool? isSingleFileForm, 
    String? fieldBorderHex,
    String? fieldBackgroundHex,
    String? submitUrl,
    String? textMode}){
      // update the file
      state = state.copyWith(
        path: path ?? state.path,
        format: format ?? state.format,
        scale: scale ?? state.scale,
        isSingleFileForm: isSingleFileForm ?? state.isSingleFileForm,
        fieldBorderHex: fieldBorderHex ?? state.fieldBorderHex,
        fieldBackgroundHex: fieldBackgroundHex ?? state.fieldBackgroundHex,
        submitUrl: submitUrl ?? state.submitUrl,
        textMode: textMode ?? state.textMode,
      );
    }
}

// default
final formvuOriginalFileProvider = NotifierProvider<FormVuOriginalFileNotifier, FormVuOriginalFile>((){
  return FormVuOriginalFileNotifier();
});


// converted file
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

// default
final convertedFileProvider = NotifierProvider<ConvertedFileNotifier, ConvertedFile>((){
  return ConvertedFileNotifier();
});