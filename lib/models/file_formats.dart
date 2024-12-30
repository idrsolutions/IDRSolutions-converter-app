class OriginalFile{
  const OriginalFile({
    required this.path,
    this.format,
    this.password,
    this.scale,
    this.isToEmbed,
    this.isInlineSVG,
    this.ui,
    this.textMode,
  });
  
  final String path;
  final String? format;
  final String? password;
  final double? scale;
  final bool? isToEmbed;
  final bool? isInlineSVG;
  final String? ui;
  final String? textMode; 

  // copy constructor to create a new instance with updated values
  OriginalFile copyWith({
    String? path,
    String? format,
    String? password, 
    double? scale, 
    bool? isToEmbed, 
    bool? isInlineSVG,
    String? ui,
    String? textMode}){
      return OriginalFile(
        path: path ?? this.path,
        format: format ?? this.format,
        password: password ?? this.password,
        scale: scale ?? this.scale,
        isToEmbed: isToEmbed ?? this.isToEmbed,
        isInlineSVG: isInlineSVG ?? this.isInlineSVG,
        ui: ui ?? this.ui,
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