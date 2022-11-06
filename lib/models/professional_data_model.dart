import 'package:settings_page/util/enum.dart';

class ProfesionalDataModel {
  final String? Name;
  final String? imagePath;
  final int? numberOfStars;
  final double? rating;
  final int? numberOfReviews;
  final String? type;
  final String? individualRate;
  final String? Location;
  final String? locationType;
  final List<String>? certificates;
  bool? isRemoved;

  ProfesionalDataModel(
      {this.Name,
      this.imagePath,
      this.numberOfStars,
      this.numberOfReviews,
      this.rating,
      this.individualRate,
      this.Location,
      this.type,
      this.locationType,
      this.isRemoved = false, this.certificates});


  ProfesionalDataModel.fromJson(Map<String, dynamic> json)
      : Name = json['Name'],
        imagePath = json['imagePath'],
        numberOfStars = json['numberOfStars'],
        numberOfReviews = json['numberOfReviews'],
        rating = json['rating'],
        individualRate = json['individualRate'],
        Location = json['Location'],
        type = json['type'],
        locationType = json['locationType'],
        isRemoved = json['isRemoved'],
        certificates = json['certificates'];

}

ProfesionalDataModel cooper = ProfesionalDataModel(
    Name: "Jacob Cooper",
    rating: 5.0,
    numberOfReviews: 13,
    type: ProfessionalType.Fitness.name + " Coach",
    imagePath: "assets/images/img_bg.png",
    certificates: ["Boxing", "Yoga", "Stretching", "Crossfit", "HIIT"],
    );
ProfesionalDataModel nancy = ProfesionalDataModel(
    Name: "Nancy Tailor",
    rating: 5.0,
    numberOfReviews: 13,
    type: ProfessionalType.Nutrition.name + " Professional",
    imagePath: "assets/images/img_unsplashxmswve.png",
    certificates: ["Boxing", "Yoga", "Stretching", "Crossfit", "HIIT"],
   );
ProfesionalDataModel stefany = ProfesionalDataModel(
    Name: "Stefany Stewart",
    rating: 5.0,
    numberOfReviews: 13,
    type: ProfessionalType.Wellness.name + " Professional",
    imagePath: "assets/images/img_unsplashkvmirq.png",
    certificates: ["Boxing", "Yoga", "Stretching", "Crossfit", "HIIT"],
    );
ProfesionalDataModel guy = ProfesionalDataModel(
    Name: "Guy Hawkins",
    rating: 5.0,
    numberOfReviews: 13,
    type: ProfessionalType.Fitness.name + " Coach",
    imagePath: "assets/images/img_unsplashkvmirq_32X32.png",
    certificates: ["Boxing", "Yoga", "Stretching", "Crossfit", "HIIT"],

    );
ProfesionalDataModel amelia = ProfesionalDataModel(
    Name: "Amelia Blunt",
    rating: 5.0,
    numberOfReviews: 13,
    type: ProfessionalType.Nutrition.name + " Professional",
    imagePath: "assets/images/img_unsplashj1oscm.png",
    certificates: ["Boxing", "Yoga", "Stretching", "Crossfit", "HIIT"],
    );

    ProfesionalDataModel david = ProfesionalDataModel(
    Name: "David Brewu",
    rating: 5.0,
    numberOfReviews: 13,
    type: ProfessionalType.Fitness.name + " Coach",
    imagePath: "assets/images/img_bg.png",
     certificates: ["Boxing", "Yoga", "Stretching", "Crossfit", "HIIT"],
    );
ProfesionalDataModel anthony = ProfesionalDataModel(
    Name: "Anthony Asamoah",
    rating: 5.0,
    numberOfReviews: 13,
    type: ProfessionalType.Nutrition.name + " Professional",
    imagePath: "assets/images/img_unsplashxmswve.png",
    certificates: ["Boxing", "Yoga", "Stretching", "Crossfit", "HIIT"],
   );
ProfesionalDataModel oswald = ProfesionalDataModel(
    Name: "Oswald Gyabaah",
    rating: 5.0,
    numberOfReviews: 13,
    type: ProfessionalType.Wellness.name + " Professional",
    imagePath: "assets/images/img_unsplashkvmirq.png",
    certificates: ["Boxing", "Yoga", "Stretching", "Crossfit", "HIIT"],
    );
ProfesionalDataModel simon = ProfesionalDataModel(
    Name: "Simon Suuk",
    rating: 3.2,
    numberOfReviews: 13,
    type: ProfessionalType.Fitness.name + " Coach",
    imagePath: "assets/images/img_unsplashkvmirq_32X32.png",
    certificates: ["Boxing", "Yoga", "Stretching", "Crossfit", "HIIT"],
    );
ProfesionalDataModel bright = ProfesionalDataModel(
    Name: "Bright Okyere",
    rating: 5.0,
    numberOfReviews: 13,
    type: ProfessionalType.Nutrition.name + " Professional",
    imagePath: "assets/images/img_unsplashj1oscm.png",
    certificates: ["Boxing", "Yoga", "Stretching", "Crossfit", "HIIT"],
    );
