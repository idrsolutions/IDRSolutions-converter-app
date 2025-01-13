class BuildVuOriginalFile{
  const BuildVuOriginalFile({
    required this.path,
    this.format,
    this.password,
    this.scale,
    this.isEmbedImage,
    this.isInlineSVG,
    this.ui,
    this.textMode,
  });
  
  final String path;
  final String? format;
  final String? password;
  final double? scale;
  final bool? isEmbedImage;
  final bool? isInlineSVG;
  final String? ui;
  final String? textMode; 

  // copy constructor to create a new instance with updated values
  BuildVuOriginalFile copyWith({
    String? path,
    String? format,
    String? password, 
    double? scale, 
    bool? isEmbedImage, 
    bool? isInlineSVG,
    String? ui,
    String? textMode}){
      return BuildVuOriginalFile(
        path: path ?? this.path,
        format: format ?? this.format,
        password: password ?? this.password,
        scale: scale ?? this.scale,
        isEmbedImage: isEmbedImage ?? this.isEmbedImage,
        isInlineSVG: isInlineSVG ?? this.isInlineSVG,
        ui: ui ?? this.ui,
        textMode: textMode ?? this.textMode,
      );
    }
}

class FormVuOriginalFile{
  const FormVuOriginalFile({
    required this.path,
    this.format,
    this.password,
    this.scale,
    this.isSingleFileForm,
    this.hasFieldBorders,
    this.hasFieldBackgrounds,
    this.submitUrl,
    this.textMode,
  });
  
  final String path;
  final String? format;
  final String? password;
  final double? scale;
  final bool? isSingleFileForm;
  final bool? hasFieldBorders;
  final bool? hasFieldBackgrounds;
  final String? submitUrl;
  final String? textMode; 

  // copy constructor to create a new instance with updated values
  FormVuOriginalFile copyWith({
    String? path,
    String? format,
    String? password, 
    double? scale, 
    bool? isSingleFileForm, 
    bool? hasFieldBorders,
    bool? hasFieldBackgrounds,
    String? submitUrl,
    String? textMode}){
      return FormVuOriginalFile(
        path: path ?? this.path,
        format: format ?? this.format,
        password: password ?? this.password,
        scale: scale ?? this.scale,
        isSingleFileForm: isSingleFileForm ?? this.isSingleFileForm,
        hasFieldBorders: hasFieldBorders ?? this.hasFieldBorders,
        hasFieldBackgrounds: hasFieldBackgrounds ?? this.hasFieldBackgrounds,
        submitUrl: submitUrl ?? this.submitUrl,
        textMode: textMode ?? this.textMode,
      );
    }
}

class ConvertedFile{
  const ConvertedFile({
    this.previewURL,
    this.downloadURL,
  });
  
  final String? previewURL;
  final String? downloadURL; 

  // copy constructor to create a new instance with updated values
  ConvertedFile copyWith({
    String? previewURL,
    String? downloadURL}){
      return ConvertedFile(
        previewURL: previewURL ?? this.previewURL,
        downloadURL: downloadURL ?? this.downloadURL,
      );
    }
}