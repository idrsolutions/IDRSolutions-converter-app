import 'dart:collection';

import 'package:flutter/material.dart';

// BuildVu formates
typedef BuildVuOriginalFormatsEntry = DropdownMenuEntry<BuildVuOriginalFormats>;

enum BuildVuOriginalFormats {
  pdf(
    value: 'PDF',
    label: 'PDF',
  ),
  doc(
    value: 'Word (.doc)',
    label: 'Word (.doc)',
  ),
  docx(
    value: 'Word (.docx)',
    label: 'Word (.docx)',
  ),
  ppt(
    value: 'PowerPoint (.ppt)',
    label: 'PowerPoint (.ppt)',
  ),
  pptx(
    value: 'PowerPoint (.pptx)',
    label: 'PowerPoint (.pptx)',
  ),
  xls(
    value: 'Excel (.xls)',
    label: 'Excel (.xls)',
  ),
  xlsx(
    value: 'Excel (.xlsx)',
    label: 'Excel (.xlsx)',
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

// JPedal formats
typedef JPedalOriginalFormatsEntry = DropdownMenuEntry<JPedalOriginalFormats>;

enum JPedalOriginalFormats {
  pdf(
    value: 'PDF',
    label: 'PDF',
  ),
  doc(
    value: 'Word (.doc)',
    label: 'Word (.doc)',
  ),
  docx(
    value: 'Word (.docx)',
    label: 'Word (.docx)',
  ),
  ppt(
    value: 'PowerPoint (.ppt)',
    label: 'PowerPoint (.ppt)',
  ),
  pptx(
    value: 'PowerPoint (.pptx)',
    label: 'PowerPoint (.pptx)',
  ),
  xls(
    value: 'Excel (.xls)',
    label: 'Excel (.xls)',
  ),
  xlsx(
    value: 'Excel (.xlsx)',
    label: 'Excel (.xlsx)',
  );
  
  const JPedalOriginalFormats({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  static final List<JPedalOriginalFormatsEntry> entries = UnmodifiableListView<JPedalOriginalFormatsEntry>(
    values.map<JPedalOriginalFormatsEntry>(
      (JPedalOriginalFormats format) => JPedalOriginalFormatsEntry(
        value: format,
        label: format.label,
      ),
    ),
  );
}

typedef JPedalConvertedFormatsEntry = DropdownMenuEntry<JPedalConvertedFormats>;

enum JPedalConvertedFormats {
  bmp(
    value: 'BMP',
    label: 'BMP',
  ),
  heic(
    value: 'HEIC',
    label: 'HEIC',
  ),
  jpeg2000(
    value: 'JPEG2000',
    label: 'JPEG2000',
  ),
  jpg(
    value: 'JPG',
    label: 'JPG',
  ),
  png(
    value: 'PNG',
    label: 'PNG',
  ),
  tiff(
    value: 'TIFF',
    label: 'TIFF',
  ),
  webp(
    value: 'WEBP',
    label: 'WEBP',
  );
  
  const JPedalConvertedFormats({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  static final List<JPedalConvertedFormatsEntry> entries = UnmodifiableListView<JPedalConvertedFormatsEntry>(
    values.map<JPedalConvertedFormatsEntry>(
      (JPedalConvertedFormats format) => JPedalConvertedFormatsEntry(
        value: format,
        label: format.label,
      ),
    ),
  );
}

// FormVu formats
typedef FormVuOriginalFormatsEntry = DropdownMenuEntry<FormVuOriginalFormats>;

enum FormVuOriginalFormats {
  pdf(
    value: 'PDF',
    label: 'PDF',
  );
  
  const FormVuOriginalFormats({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  static final List<FormVuOriginalFormatsEntry> entries = UnmodifiableListView<FormVuOriginalFormatsEntry>(
    values.map<FormVuOriginalFormatsEntry>(
      (FormVuOriginalFormats format) => FormVuOriginalFormatsEntry(
        value: format,
        label: format.label,
      ),
    ),
  );
}

typedef FormVuConvertedFormatsEntry = DropdownMenuEntry<FormVuConvertedFormats>;

enum FormVuConvertedFormats {
  html(
    value: 'HTML',
    label: 'HTML',
  ),
  html5(
    value: 'HTML5',
    label: 'HTML5',
  );
  
  const FormVuConvertedFormats({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  static final List<FormVuConvertedFormatsEntry> entries = UnmodifiableListView<FormVuConvertedFormatsEntry>(
    values.map<FormVuConvertedFormatsEntry>(
      (FormVuConvertedFormats format) => FormVuConvertedFormatsEntry(
        value: format,
        label: format.label,
      ),
    ),
  );
}