class UserQueries {
  currentUser() {
    return r'''
query getCurrentUser ($token: String!) {
    getCurrentUser (token: $token) {
        id
        userId
        email
        firstName
        lastName
        isActive
        isVerified
        status
        userRoles {
            id
            name
            permissions
        }
        isAdmin
        userPermissions
        dateJoined
        dateModified
        lastLogin
        loginCount
        profile {
            id
            baseUser {
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
        }
        professionalProfile {
            id
            baseUser {
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
        }
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

  getOrganizers() {
    return r'''
query getUsers ($token: String!, $page: String) {
    getUsers (token: $token, page: $page) {
        count
        next
        previous
        results {
            profile {
                
                profilePicture
               
            }
            professionalProfile {
                
                user {
                  
                    userId
                   
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
             
                roles {
                    id
                    professional
                    role
                    status
                }
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

  getUsers() {
    return r'''
query getUsers ($token: String!, $page: String) {
    getUsers (token: $token, page: $page) {
        count
        next
        previous
        results {
            id
            userId
            email
            firstName
            lastName
            isActive
            isVerified
            status
            userRoles {
                id
                name
                permissions
            }
            isAdmin
            userPermissions
            dateJoined
            dateModified
            lastLogin
            loginCount
            profile {
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
            }
            professionalProfile {
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
            }
            deleted
            dateDeleted
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
