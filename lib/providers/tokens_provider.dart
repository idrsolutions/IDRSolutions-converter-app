import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenNotifier extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  // update token value
  void updateToken(String token) {
    state = token;
  }
}

// default path
final buildvuTokenProvider = NotifierProvider<TokenNotifier, String>(() {
  return TokenNotifier();
});

// default path
final formvuTokenProvider = NotifierProvider<TokenNotifier, String>(() {
  return TokenNotifier();
});
