import 'dart:collection';

import 'package:flutter/material.dart';

typedef BuildVuOriginalFormatsEntry = DropdownMenuEntry<BuildVuOriginalFormats>;

enum BuildVuOriginalFormats {
  pdf(
    value: 'PDF',
    label: 'PDF',
  ),
  word(
    value: 'Word',
    label: 'Word',
  ),
  powerpoint(
    value: 'PowerPoint',
    label: 'PowerPoint',
  ),
  excel(
    value: 'Excel',
    label: 'Excel',
  );
  
  const BuildVuOriginalFormats({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  static final List<BuildVuOriginalFormatsEntry> entries = UnmodifiableListView<BuildVuOriginalFormatsEntry>(
    values.map<BuildVuOriginalFormatsEntry>(
      (BuildVuOriginalFormats format) => BuildVuOriginalFormatsEntry(
        value: format,
        label: format.label,
      ),
    ),
  );
}

typedef BuildVuConvertedFormatsEntry = DropdownMenuEntry<BuildVuConvertedFormats>;

enum BuildVuConvertedFormats {
  html(
    value: 'HTML',
    label: 'HTML',
  ),
  html5(
    value: 'HTML5',
    label: 'HTML5',
  ),
  svg(
    value: 'SVG',
    label: 'SVG',
  );
  
  const BuildVuConvertedFormats({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  static final List<BuildVuConvertedFormatsEntry> entries = UnmodifiableListView<BuildVuConvertedFormatsEntry>(
    values.map<BuildVuConvertedFormatsEntry>(
      (BuildVuConvertedFormats format) => BuildVuConvertedFormatsEntry(
        value: format,
        label: format.label,
      ),
    ),
  );
}