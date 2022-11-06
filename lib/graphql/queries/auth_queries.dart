class AuthQueries {
  login() {
    return r'''
query login ($user: Login!) {
    login (user: $user) {
        access
        refresh
        tokenType
        responseMessage
        responseStatus {
            errorCode
            statusCode
            isSuccess
            isError
            isServerError
            isClientError
            isInformational
        }
    }
}
''';
  }
}
