class StatusCodeException implements Exception {
  final String errorMsg;

  const StatusCodeException(this.errorMsg);
}

class ClientErrorException implements Exception {
  final String message;

  const ClientErrorException(this.message);
}

class YoutubeUrlError implements Exception {
 
}
