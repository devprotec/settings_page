class EventDataModel {
  final String? eventStatus;
  final String? eventApprovalStatus;
  final String? eventLocation;
  final String? eventName;
  final String? eventCategory;
  final String? eventSubCategory;
  final String? eventDate;
  final String? eventTime;

  const EventDataModel(
      {this.eventStatus,
      this.eventApprovalStatus,
      this.eventLocation,
      this.eventName,
      this.eventCategory,
      this.eventSubCategory,
      this.eventDate,
      this.eventTime});

   EventDataModel.fromJson(Map<String, dynamic>event)
   : eventStatus = event["eventStatus"],
      eventApprovalStatus = event["eventApprovalStatus"],
      eventLocation = event["eventLocation"],
      eventName = event["eventName"],
      eventCategory = event["eventCategory"],
      eventSubCategory = event["eventSubCategory"],
      eventDate = event["eventDate"],
      eventTime = event["eventTime"];
}
