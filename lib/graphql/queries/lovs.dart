class LOVSQueries {
  getEquipments() {
    return r'''
query getEquipments ($token: String!, $page: String) {
    getEquipments (token: $token, page: $page) {
        count
        next
        previous
        results {
            id
            label
            description
            specs {
                type
                brand
                color
                height
                weight
                width
            }
        }
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
