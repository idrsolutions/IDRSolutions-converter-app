import 'package:flutter_riverpod/flutter_riverpod.dart';

// default formats
final buildvuOriginalFileFormatProvider = StateProvider<String>((ref) => 'pdf');
final buildvuConvertedFileFormatProvider = StateProvider<String>((ref) => 'html');