class ProfessionalProfileMutation {
  addProfessionalProfile() {
    return r'''
mutation addProfessionalProfile ($token: String!, $professionalProfile: ProfessionalProfileCreate!) {
    addProfessionalProfile (token: $token, professionalProfile: $professionalProfile) {
        id
    
        professionalSummary
        specializations
        institutionAttended
        dateEnrolled
        dateGraduated
        fieldOfStudy
        fieldOfCertification
        professionalAssociations
        businesses {
            id
            owner
            name
            registrationNumber
            taxIdentificationNumber
            phoneNumber
            email
            industry
            supportingDocumentsUrls
            addresses {
                id
                business
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
        certificates {
            id
            owner
            activities
            name
            issuingOrganization
            credentialId
            credentialUrl
            certificateJurisdiction
            issueDate
            willExpire
            expiryDate
            supportingDocumentsUrls
            isVerified
        }
        roles {
            id
            professional
            role
            status
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

  updateProfessionalProfile() {
    return r'''
mutation updateProfessionalProfile ($token: String!, $id: Int!, $professionalProfile: ProfessionalProfileUpdate!) {
    updateProfessionalProfile (token: $token, id: $id, professionalProfile: $professionalProfile) {
        id
        user {
            id
            userId
            email
            firstName
            lastName
        }
        professionalSummary
        specializations
        institutionAttended
        dateEnrolled
        dateGraduated
        fieldOfStudy
        fieldOfCertification
        professionalAssociations
        businesses {
            id
            owner
            name
            registrationNumber
            taxIdentificationNumber
            phoneNumber
            email
            industry
            supportingDocumentsUrls
            addresses {
                id
                business
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
        certificates {
            id
            owner
            activities
            name
            issuingOrganization
            credentialId
            credentialUrl
            certificateJurisdiction
            issueDate
            willExpire
            expiryDate
            supportingDocumentsUrls
            isVerified
        }
        roles {
            id
            professional
            role
            status
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
