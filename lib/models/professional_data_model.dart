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
      this.isRemoved = false});
}

ProfesionalDataModel cooper = ProfesionalDataModel(
    Name: "Jacob Cooper",
    rating: 5,
    numberOfReviews: 13,
    type: ProfessionalType.Fitness.name + " Coach",
    imagePath: "assets/images/img_bg.png",
    );
ProfesionalDataModel nancy = ProfesionalDataModel(
    Name: "Nancy Tailor",
    rating: 5,
    numberOfReviews: 13,
    type: ProfessionalType.Nutrition.name + " Professional",
    imagePath: "assets/images/img_unsplashxmswve.png",
   );
ProfesionalDataModel stefany = ProfesionalDataModel(
    Name: "Stefany Stewart",
    rating: 5,
    numberOfReviews: 13,
    type: ProfessionalType.Wellness.name + " Professional",
    imagePath: "assets/images/img_unsplashkvmirq.png",
    );
ProfesionalDataModel guy = ProfesionalDataModel(
    Name: "Guy Hawkins",
    rating: 5,
    numberOfReviews: 13,
    type: ProfessionalType.Fitness.name + " Coach",
    imagePath: "assets/images/img_unsplashkvmirq_32X32.png",
    );
ProfesionalDataModel amelia = ProfesionalDataModel(
    Name: "Amelia Blunt",
    rating: 5,
    numberOfReviews: 13,
    type: ProfessionalType.Nutrition.name + " Professional",
    imagePath: "assets/images/img_unsplashj1oscm.png",
    );

    ProfesionalDataModel david = ProfesionalDataModel(
    Name: "David Brewu",
    rating: 5,
    numberOfReviews: 13,
    type: ProfessionalType.Fitness.name + " Coach",
    imagePath: "assets/images/img_bg.png",
    );
ProfesionalDataModel anthony = ProfesionalDataModel(
    Name: "Anthony Asamoah",
    rating: 5,
    numberOfReviews: 13,
    type: ProfessionalType.Nutrition.name + " Professional",
    imagePath: "assets/images/img_unsplashxmswve.png",
   );
ProfesionalDataModel oswald = ProfesionalDataModel(
    Name: "Oswald Gyabaah",
    rating: 5,
    numberOfReviews: 13,
    type: ProfessionalType.Wellness.name + " Professional",
    imagePath: "assets/images/img_unsplashkvmirq.png",
    );
ProfesionalDataModel simon = ProfesionalDataModel(
    Name: "Simon Suuk",
    rating: 5,
    numberOfReviews: 13,
    type: ProfessionalType.Fitness.name + " Coach",
    imagePath: "assets/images/img_unsplashkvmirq_32X32.png",
    );
ProfesionalDataModel bright = ProfesionalDataModel(
    Name: "Bright Okyere",
    rating: 5,
    numberOfReviews: 13,
    type: ProfessionalType.Nutrition.name + " Professional",
    imagePath: "assets/images/img_unsplashj1oscm.png",
    );
