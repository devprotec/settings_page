class EventsQueries {
  getEvents() {
    return r'''
query getEvents ($token: String!, $page: String) {
    getEvents (token: $token, page: $page) {
        count
        next
        previous
        results {
            id
            title
            coverImage
            overview
            isOpen
            status
            currency
            individualPrice
            groupPrice
            groupCapacity {
                min
                max
            }
            organizers
            outline
            otherDetails
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

  getEvent() {
    return r'''
query getEvents ($token: String!, $page: String) {
    getEvents (token: $token, page: $page) {
        count
        next
        previous
        results {
            id
            title
            coverImage
            overview
            isOpen
            status
            currency
            individualPrice
            groupPrice
            groupCapacity {
                min
                max
            }
            organizers
            outline
            otherDetails
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
