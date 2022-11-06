class SharedMutations {
  uploadFile() {
    return r'''
mutation uploadFile ($file: Upload!, $payload: FileMetaData!) {
    uploadFile (file: $file, payload: $payload) {
        key
        fileCategory
        ownerId
        filename
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
