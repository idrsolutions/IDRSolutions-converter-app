import 'package:flutter_riverpod/flutter_riverpod.dart';

class PollDataStateNotifier extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  void updatePollDataState(String newState) {
    state = newState;
  }
}

// default poll data state
final pollDataStateProvider =
    NotifierProvider<PollDataStateNotifier, String>(() {
  return PollDataStateNotifier();
});
