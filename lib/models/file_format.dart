class OriginalFile{
  const OriginalFile({
    required this.path,
    this.password,
    this.scale,
    this.isToEmbed,
    this.isInlineSVG,
    this.ui,
    this.textMode,
  });
  
  final String path;
  final String? password;
  final double? scale;
  final bool? isToEmbed;
  final bool? isInlineSVG;
  final String? ui;
  final String? textMode; 

  // copy constructor to create a new instance with updated values
  OriginalFile copyWith({String? path, 
    String? password, 
    double? scale, 
    bool? isToEmbed, 
    bool? isInlineSVG,
    String? ui,
    String? textMode}){
      return OriginalFile(
        path: path ?? this.path,
        password: password ?? this.password,
        scale: scale ?? this.scale,
        isToEmbed: isToEmbed ?? this.isToEmbed,
        isInlineSVG: isInlineSVG ?? this.isInlineSVG,
        ui: ui ?? this.ui,
        textMode: textMode ?? this.textMode,
      );
    }
}