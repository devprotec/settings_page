class AuthMutations {
  register() {
    return r'''
mutation register ($user: UserCreate!) {
    register (user: $user) {
        id
        userId
        email
        firstName
        lastName
        status
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

  verifyAccount() {
    return r'''
mutation verifyAccount ($payload: VerifyAccount!) {
    verifyAccount (payload: $payload) {
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

  resendVerification() {
    return r'''
mutation resendVerification ($payload: Email!) {
    resendVerification (payload: $payload) {
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

  forgotPassword() {
    return r'''
mutation forgotPassword ($payload: Email!) {
    forgotPassword (payload: $payload) {
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

  resetPassword() {
    return r'''
mutation resetPassword ($payload: ResetPassword!) {
    resetPassword (payload: $payload) {
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

  updateUser() {
    return r'''
mutation updateUser ($token: String!, $id: Int!, $user: UserUpdate!) {
    updateUser (token: $token, id: $id, user: $user) {
        id
        userId
        email
        firstName
        lastName
        isActive
        status
        deleted
        dateDeleted
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
