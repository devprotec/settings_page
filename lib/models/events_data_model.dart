class EventDataModel {
  final String? eventStatus;
  final String? eventApprovalStatus;
  final String? eventLocation;
  final String? eventName;
  final String? eventCategory;
  final String? eventSubCategory;
  final String? eventEndDate;
  final String? eventStartDate;
  final String? eventStartTime;
  final String? eventEndTime;
  final bool? isOnline;
  final String? eventImage;
  final int? numberOfClasses;

  const EventDataModel(
      {this.eventStatus,
      this.eventApprovalStatus,
      this.eventLocation,
      this.eventName,
      this.eventCategory,
      this.eventSubCategory,
      this.eventEndDate,
      this.eventStartDate,
      this.eventStartTime,
      this.eventEndTime,
      this.isOnline,this.eventImage, this.numberOfClasses});

   EventDataModel.fromJson(Map<String, dynamic>event, int)
   : eventStatus = event["eventStatus"],
      eventApprovalStatus = event["eventApprovalStatus"],
      eventLocation = event["eventLocation"],
      eventName = event["eventName"],
      eventCategory = event["eventCategory"],
      eventSubCategory = event["eventSubCategory"],
      eventEndDate = event["eventEndDate"],
      eventStartDate = event["eventStartDate"],
      eventStartTime = event["eventStartTime"],
      eventEndTime = event["eventEndTime"],
      isOnline = event["isOnline"],
      eventImage = event["eventImage"],
      numberOfClasses = event["numberOfClasses"];
}


EventDataModel event1 = EventDataModel(
  eventApprovalStatus: "Active" ,
  eventCategory: "Yoga",
  eventEndDate: "22 November, 2022",
  eventStartDate: "21 November, 2022",
  eventEndTime: "11:00 AM",
  eventLocation: "Halo Salt Gym, 6392 Elgin St. Celina..." ,
  eventName:  "Healthy Eating Meetup",
  eventStartTime: "9:00 AM" ,
  eventStatus: "Active",
  eventSubCategory: "Meditation",
  isOnline: true,

);

EventDataModel event2 = EventDataModel(
  eventApprovalStatus: "Active" ,
  eventCategory: "Yoga",
  eventEndDate: "22 November, 2022",
  eventStartDate: "21 November, 2022",
  eventEndTime: "11:00 AM",
  eventLocation: "Halo Salt Gym, 6392 Elgin St. Celina..." ,
  eventName:  "Healthy Eating Meetup",
  eventStartTime: "9:00 AM" ,
  eventStatus: "Draft",
  eventSubCategory: "Meditation",
  isOnline: false,


);
EventDataModel event3 = EventDataModel(
  eventApprovalStatus: "Active" ,
  eventCategory: "Yoga",
  eventEndDate: "22 November, 2022",
  eventStartDate: "22 November, 2022",
  eventEndTime: "11:00 AM",
  eventLocation: "Halo Salt Gym, 6392 Elgin St. Celina..." ,
  eventName:  "Healthy Eating Meetup",
  eventStartTime: "9:00 AM" ,
  eventStatus: "Draft",
  eventSubCategory: "Meditation",
  isOnline: true,
  numberOfClasses: 12,
  eventImage: 'https://static01.nyt.com/images/2016/12/02/well/move/yoga_body_images-slide-HNVD/yoga_body_images-slide-HNVD-superJumbo.jpg'

);

EventDataModel event4 = EventDataModel(
  eventApprovalStatus: "Active" ,
  eventCategory: "Fitness Class",
  eventEndDate: "22 November, 2022",
  eventStartDate: "22 November, 2022",
  eventEndTime: "11:00 AM",
  eventLocation: "Halo Salt Gym, 6392 Elgin St. Celina..." ,
  eventName:  "Yoga",
  eventStartTime: "9:00 AM" ,
  eventStatus: "Draft",
  eventSubCategory: "nutrition plan",
  isOnline: true,
  numberOfClasses: 12,
  eventImage: 'https://static01.nyt.com/images/2016/12/02/well/move/yoga_body_images-slide-HNVD/yoga_body_images-slide-HNVD-superJumbo.jpg'

);

EventDataModel event5 = EventDataModel(
  eventApprovalStatus: "Active" ,
  eventCategory: "Fitness Class",
  eventEndDate: "22 November, 2022",
  eventStartDate: "22 November, 2022",
  eventEndTime: "11:00 AM",
  eventLocation: "Halo Salt Gym, 6392 Elgin St. Celina..." ,
  eventName:  "Yoga",
  eventStartTime: "9:00 AM" ,
  eventStatus: "Draft",
  eventSubCategory: "nutrition plan",
  isOnline: true,
  numberOfClasses: 12,
  eventImage: 'https://images.everydayhealth.com/images/healthy-living/fitness/yoga-poses-for-beginners-03-722x406.jpg?w=720'

);

EventDataModel event6 = EventDataModel(
  eventApprovalStatus: "Active" ,
  eventCategory: "Fitness Class",
  eventEndDate: "22 November, 2022",
  eventStartDate: "22 November, 2022",
  eventEndTime: "11:00 AM",
  eventLocation: "Halo Salt Gym, 6392 Elgin St. Celina..." ,
  eventName:  "Yoga",
  eventStartTime: "9:00 AM" ,
  eventStatus: "Draft",
  eventSubCategory: "nutrition plan",
  isOnline: true,
  numberOfClasses: 12,
  eventImage: 'https://i0.wp.com/post.greatist.com/wp-content/uploads/sites/2/2019/05/Wheel.jpg?w=1155&h=789'

);

final programs = [event4,event5,event6];