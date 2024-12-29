import 'package:converter/models/request_response_format.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResponseNotifier extends Notifier<RequestResponse>{
  @override
  RequestResponse build() {
    return RequestResponse();
  }

  void updateRequestResponse({
    int? code,
    String? content,
  }){
    state = state.copyWith(
      code: code ?? state.code,
      content: content ?? state.content,
    );
  }
}

// default response
final requestResponseProvider = NotifierProvider<ResponseNotifier, RequestResponse>((){
  return ResponseNotifier();
});