class RequestResponse {
  const RequestResponse({
    this.code,
    this.content,
  });

  final int? code;
  final String? content;

  // copy constructor to create a new response with updated values
  RequestResponse copyWith({
    int? code,
    String? content,
  }) {
    return RequestResponse(
      code: code ?? this.code,
      content: content ?? this.content,
    );
  }
}
