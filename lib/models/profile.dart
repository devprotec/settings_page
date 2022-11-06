// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.getCurrentUser,
  });

  final UserProfileModel? getCurrentUser;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        getCurrentUser: json["getCurrentUser"] == null
            ? null
            : UserProfileModel.fromJson(json["getCurrentUser"]),
      );

  Map<String, dynamic> toJson() => {
        "getCurrentUser": getCurrentUser?.toJson(),
      };
}

class UserProfileModel {
  UserProfileModel({
    this.id,
    this.userId,
    this.email,
    this.firstName,
    this.lastName,
    this.isActive,
    this.isVerified,
    this.status,
    this.userRoles,
    this.isAdmin,
    this.userPermissions,
    this.dateJoined,
    this.dateModified,
    this.lastLogin,
    this.loginCount,
    this.profile,
    this.professionalProfile,
    this.deleted,
    this.dateDeleted,
    this.responseMessage,
  });

  final int? id;
  final String? userId;
  final String? email;
  final String? firstName;
  final String? lastName;
  final bool? isActive;
  final bool? isVerified;
  final String? status;
  final dynamic? userRoles;
  final bool? isAdmin;
  final List<dynamic>? userPermissions;
  final DateTime? dateJoined;
  final DateTime? dateModified;
  final DateTime? lastLogin;
  final int? loginCount;
  final Profile? profile;
  final ProfessionalProfile? professionalProfile;
  final bool? deleted;
  final dynamic dateDeleted;
  final dynamic responseMessage;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json["id"],
        userId: json["userId"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        isActive: json["isActive"],
        isVerified: json["isVerified"],
        status: json["status"],
        userRoles: json["userRoles"],
        isAdmin: json["isAdmin"],
        userPermissions: json["userPermissions"] == null
            ? null
            : List<dynamic>.from(json["userPermissions"].map((x) => x)),
        dateJoined: json["dateJoined"] == null
            ? null
            : DateTime.parse(json["dateJoined"]),
        dateModified: json["dateModified"] == null
            ? null
            : DateTime.parse(json["dateModified"]),
        lastLogin: json["lastLogin"] == null
            ? null
            : DateTime.parse(json["lastLogin"]),
        loginCount: json["loginCount"],
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        professionalProfile: json["professionalProfile"] == null
            ? null
            : ProfessionalProfile.fromJson(json["professionalProfile"]),
        deleted: json["deleted"],
        dateDeleted: json["dateDeleted"],
        responseMessage: json["responseMessage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "isActive": isActive,
        "isVerified": isVerified,
        "status": status,
        "userRoles": userRoles,
        "isAdmin": isAdmin,
        "userPermissions": userPermissions == null
            ? null
            : List<dynamic>.from(userPermissions!.map((x) => x)),
        "dateJoined": dateJoined == null ? null : dateJoined!.toIso8601String(),
        "dateModified":
            dateModified == null ? null : dateModified!.toIso8601String(),
        "lastLogin": lastLogin == null ? null : lastLogin!.toIso8601String(),
        "loginCount": loginCount,
        "profile": profile,
        "professionalProfile":
            professionalProfile == null ? null : professionalProfile!.toJson(),
        "deleted": deleted,
        "dateDeleted": dateDeleted,
        "responseMessage": responseMessage,
      };
}

class ProfessionalProfile {
  ProfessionalProfile({
    this.id,
    this.professionalSummary,
    this.specializations,
    this.institutionAttended,
    this.dateEnrolled,
    this.dateGraduated,
    this.fieldOfStudy,
    this.fieldOfCertification,
    this.professionalAssociations,
    this.businesses,
    this.bankCards,
    this.momoAccounts,
    this.certificates,
    this.roles,
  });

  final int? id;
  final String? professionalSummary;
  final List<String>? specializations;
  final String? institutionAttended;
  final DateTime? dateEnrolled;
  final DateTime? dateGraduated;
  final String? fieldOfStudy;
  final String? fieldOfCertification;
  final List<String>? professionalAssociations;
  final List<Business>? businesses;
  final List<BankCard>? bankCards;
  final List<MomoAccount>? momoAccounts;
  final List<Certificate>? certificates;
  final List<Role>? roles;

  factory ProfessionalProfile.fromJson(Map<String, dynamic> json) =>
      ProfessionalProfile(
        id: json["id"],
        professionalSummary: json["professionalSummary"],
        specializations: json["specializations"] == null
            ? null
            : List<String>.from(json["specializations"].map((x) => x)),
        institutionAttended: json["institutionAttended"],
        dateEnrolled: json["dateEnrolled"] == null
            ? null
            : DateTime.parse(json["dateEnrolled"]),
        dateGraduated: json["dateGraduated"] == null
            ? null
            : DateTime.parse(json["dateGraduated"]),
        fieldOfStudy: json["fieldOfStudy"],
        fieldOfCertification: json["fieldOfCertification"],
        professionalAssociations: json["professionalAssociations"] == null
            ? null
            : List<String>.from(json["professionalAssociations"].map((x) => x)),
        businesses: json["businesses"] == null
            ? null
            : List<Business>.from(
                json["businesses"].map((x) => Business.fromJson(x))),
        bankCards: json["bankCards"] == null
            ? null
            : List<BankCard>.from(
                json["bankCards"].map((x) => BankCard.fromJson(x))),
        momoAccounts: json["momoAccounts"] == null
            ? null
            : List<MomoAccount>.from(
                json["momoAccounts"].map((x) => MomoAccount.fromJson(x))),
        certificates: json["certificates"] == null
            ? null
            : List<Certificate>.from(
                json["certificates"].map((x) => Certificate.fromJson(x))),
        roles: json["roles"] == null
            ? null
            : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "professionalSummary": professionalSummary,
        "specializations": specializations == null
            ? null
            : List<dynamic>.from(specializations!.map((x) => x)),
        "institutionAttended": institutionAttended,
        "dateEnrolled": dateEnrolled == null
            ? null
            : "${dateEnrolled?.year.toString().padLeft(4, '0')}-${dateEnrolled?.month.toString().padLeft(2, '0')}-${dateEnrolled?.day.toString().padLeft(2, '0')}",
        "dateGraduated": dateGraduated == null
            ? null
            : "${dateGraduated?.year.toString().padLeft(4, '0')}-${dateGraduated?.month.toString().padLeft(2, '0')}-${dateGraduated?.day.toString().padLeft(2, '0')}",
        "fieldOfStudy": fieldOfStudy,
        "fieldOfCertification": fieldOfCertification,
        "professionalAssociations": professionalAssociations == null
            ? null
            : List<dynamic>.from(professionalAssociations!.map((x) => x)),
        "businesses": businesses == null
            ? null
            : List<dynamic>.from(businesses!.map((x) => x.toJson())),
        "bankCards": bankCards == null
            ? null
            : List<dynamic>.from(bankCards!.map((x) => x.toJson())),
        "momoAccounts": momoAccounts == null
            ? null
            : List<dynamic>.from(momoAccounts!.map((x) => x.toJson())),
        "certificates": certificates == null
            ? null
            : List<dynamic>.from(certificates!.map((x) => x.toJson())),
        "roles": roles == null
            ? null
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
      };
}

class BankCard {
  BankCard({
    this.id,
    this.owner,
    this.cardNumber,
    this.expiration,
    this.cvc,
    this.isMain,
  });

  final int? id;
  final int? owner;
  final String? cardNumber;
  final DateTime? expiration;
  final String? cvc;
  final bool? isMain;

  factory BankCard.fromJson(Map<String, dynamic> json) => BankCard(
        id: json["id"],
        owner: json["owner"],
        cardNumber: json["cardNumber"],
        expiration: json["expiration"] == null
            ? null
            : DateTime.parse(json["expiration"]),
        cvc: json["cvc"],
        isMain: json["isMain"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "cardNumber": cardNumber,
        "expiration": expiration == null
            ? null
            : "${expiration?.year.toString().padLeft(4, '0')}-${expiration?.month.toString().padLeft(2, '0')}-${expiration?.day.toString().padLeft(2, '0')}",
        "cvc": cvc,
        "isMain": isMain,
      };
}

class Business {
  Business({
    this.id,
    this.owner,
    this.name,
    this.registrationNumber,
    this.taxIdentificationNumber,
    this.phoneNumber,
    this.email,
    this.industry,
    this.supportingDocumentsUrls,
    this.addresses,
  });

  final int? id;
  final int? owner;
  final String? name;
  final String? registrationNumber;
  final String? taxIdentificationNumber;
  final String? phoneNumber;
  final String? email;
  final String? industry;
  final List<String>? supportingDocumentsUrls;
  final List<Address>? addresses;

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        id: json["id"],
        owner: json["owner"],
        name: json["name"],
        registrationNumber: json["registrationNumber"],
        taxIdentificationNumber: json["taxIdentificationNumber"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        industry: json["industry"],
        supportingDocumentsUrls: json["supportingDocumentsUrls"] == null
            ? null
            : List<String>.from(json["supportingDocumentsUrls"].map((x) => x)),
        addresses: json["addresses"] == null
            ? null
            : List<Address>.from(
                json["addresses"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "name": name,
        "registrationNumber": registrationNumber,
        "taxIdentificationNumber": taxIdentificationNumber,
        "phoneNumber": phoneNumber,
        "email": email,
        "industry": industry,
        "supportingDocumentsUrls": supportingDocumentsUrls == null
            ? null
            : List<dynamic>.from(supportingDocumentsUrls!.map((x) => x)),
        "addresses": addresses == null
            ? null
            : List<dynamic>.from(addresses!.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    this.id,
    this.business,
    this.street,
    this.country,
    this.region,
    this.state,
    this.city,
    this.suburb,
    this.landmark,
    this.areacode,
    this.isPrimary,
  });

  final int? id;
  final int? business;
  final String? street;
  final String? country;
  final String? region;
  final String? state;
  final String? city;
  final String? suburb;
  final String? landmark;
  final String? areacode;
  final bool? isPrimary;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        business: json["business"],
        street: json["street"],
        country: json["country"],
        region: json["region"],
        state: json["state"],
        city: json["city"],
        suburb: json["suburb"],
        landmark: json["landmark"],
        areacode: json["areacode"],
        isPrimary: json["isPrimary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business": business,
        "street": street,
        "country": country,
        "region": region,
        "state": state,
        "city": city,
        "suburb": suburb,
        "landmark": landmark,
        "areacode": areacode,
        "isPrimary": isPrimary,
      };
}

class Certificate {
  Certificate({
    this.id,
    this.owner,
    this.activities,
    this.name,
    this.issuingOrganization,
    this.credentialId,
    this.credentialUrl,
    this.certificateJurisdiction,
    this.issueDate,
    this.willExpire,
    this.expiryDate,
    this.supportingDocumentsUrls,
    this.isVerified,
  });

  final int? id;
  final int? owner;
  final List<String>? activities;
  final String? name;
  final String? issuingOrganization;
  final String? credentialId;
  final String? credentialUrl;
  final String? certificateJurisdiction;
  final DateTime? issueDate;
  final bool? willExpire;
  final DateTime? expiryDate;
  final List<String>? supportingDocumentsUrls;
  final bool? isVerified;

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
        id: json["id"],
        owner: json["owner"],
        activities: json["activities"] == null
            ? null
            : List<String>.from(json["activities"].map((x) => x)),
        name: json["name"],
        issuingOrganization: json["issuingOrganization"],
        credentialId: json["credentialId"],
        credentialUrl: json["credentialUrl"],
        certificateJurisdiction: json["certificateJurisdiction"],
        issueDate: json["issueDate"] == null
            ? null
            : DateTime.parse(json["issueDate"]),
        willExpire: json["willExpire"],
        expiryDate: json["expiryDate"] == null
            ? null
            : DateTime.parse(json["expiryDate"]),
        supportingDocumentsUrls: json["supportingDocumentsUrls"] == null
            ? null
            : List<String>.from(json["supportingDocumentsUrls"].map((x) => x)),
        isVerified: json["isVerified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "activities": activities == null
            ? null
            : List<dynamic>.from(activities!.map((x) => x)),
        "name": name,
        "issuingOrganization": issuingOrganization,
        "credentialId": credentialId,
        "credentialUrl": credentialUrl,
        "certificateJurisdiction": certificateJurisdiction,
        "issueDate": issueDate == null
            ? null
            : "${issueDate?.year.toString().padLeft(4, '0')}-${issueDate?.month.toString().padLeft(2, '0')}-${issueDate?.day.toString().padLeft(2, '0')}",
        "willExpire": willExpire,
        "expiryDate": expiryDate == null
            ? null
            : "${expiryDate?.year.toString().padLeft(4, '0')}-${expiryDate?.month.toString().padLeft(2, '0')}-${expiryDate?.day.toString().padLeft(2, '0')}",
        "supportingDocumentsUrls": supportingDocumentsUrls == null
            ? null
            : List<dynamic>.from(supportingDocumentsUrls!.map((x) => x)),
        "isVerified": isVerified,
      };
}

class MomoAccount {
  MomoAccount({
    this.id,
    this.owner,
    this.momoNumber,
    this.accountName,
    this.network,
    this.isMain,
  });

  final int? id;
  final int? owner;
  final String? momoNumber;
  final String? accountName;
  final String? network;
  final bool? isMain;

  factory MomoAccount.fromJson(Map<String, dynamic> json) => MomoAccount(
        id: json["id"],
        owner: json["owner"],
        momoNumber: json["momoNumber"],
        accountName: json["accountName"],
        network: json["network"],
        isMain: json["isMain"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "momoNumber": momoNumber,
        "accountName": accountName,
        "network": network,
        "isMain": isMain,
      };
}

class BaseUser {
  BaseUser({
    this.id,
    this.userId,
    this.email,
    this.firstName,
    this.lastName,
  });

  final int? id;
  final String? userId;
  final String? email;
  final String? firstName;
  final String? lastName;

  factory BaseUser.fromJson(Map<String, dynamic> json) => BaseUser(
        id: json["id"],
        userId: json["userId"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
      };
}

class Role {
  Role({
    this.id,
    this.professional,
    this.role,
    this.status,
  });

  final int? id;
  final int? professional;
  final String? role;
  final String? status;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        professional: json["professional"],
        role: json["role"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "professional": professional,
        "role": role,
        "status": status,
      };
}

class Profile {
  Profile({
    this.id,
    this.baseUser,
    this.status,
    this.dateOfBirth,
    this.gender,
    this.phoneNumber,
    this.profilePicture,
    this.weight,
    this.height,
    this.bloodGroup,
    this.allergies,
    this.chronicDiseases,
    this.wellnessGoals,
    this.otherWellnessGoals,
    this.currentBmi,
    this.idealBmi,
    this.dailyCalorieIntake,
    this.addresses,
    this.bankCards,
    this.momoAccounts,
  });

  final int? id;
  final BaseUser? baseUser;
  final String? status;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? phoneNumber;
  final String? profilePicture;
  final String? weight;
  final String? height;
  final String? bloodGroup;
  final List<String>? allergies;
  final List<String>? chronicDiseases;
  final List<String>? wellnessGoals;
  final List<String>? otherWellnessGoals;
  final String? currentBmi;
  final String? idealBmi;
  final String? dailyCalorieIntake;
  final List<Address>? addresses;
  final List<BankCard>? bankCards;
  final List<MomoAccount>? momoAccounts;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        baseUser: json["baseUser"] == null
            ? null
            : BaseUser.fromJson(json["baseUser"]),
        status: json["status"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        gender: json["gender"],
        phoneNumber: json["phoneNumber"],
        profilePicture: json["profilePicture"],
        weight: json["weight"],
        height: json["height"],
        bloodGroup: json["bloodGroup"],
        allergies: json["allergies"] == null
            ? null
            : List<String>.from(json["allergies"].map((x) => x)),
        chronicDiseases: json["chronicDiseases"] == null
            ? null
            : List<String>.from(json["chronicDiseases"].map((x) => x)),
        wellnessGoals: json["wellnessGoals"] == null
            ? null
            : List<String>.from(json["wellnessGoals"].map((x) => x)),
        otherWellnessGoals: json["otherWellnessGoals"] == null
            ? null
            : List<String>.from(json["otherWellnessGoals"].map((x) => x)),
        currentBmi: json["currentBMI"],
        idealBmi: json["idealBMI"],
        dailyCalorieIntake: json["dailyCalorieIntake"],
        addresses: json["addresses"] == null
            ? null
            : List<Address>.from(
                json["addresses"].map((x) => Address.fromJson(x))),
        bankCards: json["bankCards"] == null
            ? null
            : List<BankCard>.from(
                json["bankCards"].map((x) => BankCard.fromJson(x))),
        momoAccounts: json["momoAccounts"] == null
            ? null
            : List<MomoAccount>.from(
                json["momoAccounts"].map((x) => MomoAccount.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "baseUser": baseUser == null ? null : baseUser!.toJson(),
        "status": status,
        "dateOfBirth": dateOfBirth == null
            ? null
            : "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phoneNumber": phoneNumber,
        "profilePicture": profilePicture,
        "weight": weight,
        "height": height,
        "bloodGroup": bloodGroup,
        "allergies": allergies == null
            ? null
            : List<dynamic>.from(allergies!.map((x) => x)),
        "chronicDiseases": chronicDiseases == null
            ? null
            : List<dynamic>.from(chronicDiseases!.map((x) => x)),
        "wellnessGoals": wellnessGoals == null
            ? null
            : List<dynamic>.from(wellnessGoals!.map((x) => x)),
        "otherWellnessGoals": otherWellnessGoals == null
            ? null
            : List<dynamic>.from(otherWellnessGoals!.map((x) => x)),
        "currentBMI": currentBmi,
        "idealBMI": idealBmi,
        "dailyCalorieIntake": dailyCalorieIntake,
        "addresses": addresses == null
            ? null
            : List<dynamic>.from(addresses!.map((x) => x.toJson())),
        "bankCards": bankCards == null
            ? null
            : List<dynamic>.from(bankCards!.map((x) => x.toJson())),
        "momoAccounts": momoAccounts == null
            ? null
            : List<dynamic>.from(momoAccounts!.map((x) => x.toJson())),
      };
}
