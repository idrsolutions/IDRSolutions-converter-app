import 'package:flutter_riverpod/flutter_riverpod.dart';

// default formats
final originalBuildVuFileFormatProvider = StateProvider<String>((ref) => 'pdf');
final convertedBuildVuFileFormatProvider = StateProvider<String>((ref) => 'html');