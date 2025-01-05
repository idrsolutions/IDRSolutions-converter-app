import 'dart:collection';

import 'package:flutter/material.dart';

typedef IDRViewerUIsEntry = DropdownMenuEntry<IDRViewerUIs>;

enum IDRViewerUIs {
  complete(
    value: 'Complete',
    label: 'Complete'
  ),
  clean(
    value: 'Clean',
    label: 'Clean'
  ),
  simple(
    value: 'Simple',
    label: 'Simple'
  ),
  slideshow(
    value: 'Slideshow',
    label: 'Slideshow'
  ),
  custom(
    value: 'Custom (No index.html)',
    label: 'Custom (No index.html)'
  );

  const IDRViewerUIs({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  static final List<IDRViewerUIsEntry> entries = UnmodifiableListView<IDRViewerUIsEntry>(
    values.map<IDRViewerUIsEntry>(
      (IDRViewerUIs ui) => IDRViewerUIsEntry(
        value: ui,
        label: ui.label,
      ),
    ),
  );
}

