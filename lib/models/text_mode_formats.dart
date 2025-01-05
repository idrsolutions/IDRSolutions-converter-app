import 'dart:collection';

import 'package:flutter/material.dart';

typedef TextModesEntry = DropdownMenuEntry<TextModes>;

enum TextModes {
  svgRealText(
    value: 'Real Text',
    label: 'Real Text'
  ),
  svgShapeTextSelectable(
    value: 'Shape Text',
    label: 'Shape Text'
  );

  const TextModes({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  static final List<TextModesEntry> entries = UnmodifiableListView<TextModesEntry>(
    values.map<TextModesEntry>(
      (TextModes mode) => TextModesEntry(
        value: mode,
        label: mode.label,
      ),
    ),
  );
}

