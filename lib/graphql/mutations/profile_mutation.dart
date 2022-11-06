class ProfileMutation {
  addProfile() {
    return r'''
mutation addProfile ($token: String!, $profile: ProfileCreate!) {
    addProfile (token: $token, profile: $profile) {
        id
      
        status
        dateOfBirth
        gender
        phoneNumber
        profilePicture
        weight
        height
        bloodGroup
        allergies
        chronicDiseases
        wellnessGoals
        otherWellnessGoals
        currentBMI
        idealBMI
        dailyCalorieIntake
        addresses {
            id
            owner
            name
            street
            country
            region
            state
            city
            suburb
            landmark
            areacode
            isPrimary
        }
        bankCards {
            id
            owner
            cardNumber
            expiration
            cvc
            isMain
        }
        momoAccounts {
            id
            owner
            momoNumber
            accountName
            network
            isMain
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

  updateProfile() {
    return r'''
mutation updateProfile ($token: String!, $id: Int!, $profile: ProfileUpdate!) {
    updateProfile (token: $token, id: $id, profile: $profile) {
        id
        user {
            id
            userId
            email
            firstName
            lastName
        }
        status
        dateOfBirth
        gender
        phoneNumber
        profilePicture
        weight
        height
        bloodGroup
        allergies
        chronicDiseases
        wellnessGoals
        otherWellnessGoals
        currentBMI
        idealBMI
        dailyCalorieIntake
        addresses {
            id
            owner
            name
            street
            country
            region
            state
            city
            suburb
            landmark
            areacode
            isPrimary
        }
        bankCards {
            id
            owner
            cardNumber
            expiration
            cvc
            isMain
        }
        momoAccounts {
            id
            owner
            momoNumber
            accountName
            network
            isMain
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
