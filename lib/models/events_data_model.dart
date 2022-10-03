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
      this.isOnline});

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
      isOnline = event["isOnline"];
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

);