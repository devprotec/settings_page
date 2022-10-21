import 'package:settings_page/util/exports.dart';

class EventCardCustomer extends StatelessWidget {
  final EventDataModel eventDataModel;
  const EventCardCustomer({Key? key, required this.eventDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:14,left: 16),
      padding: EdgeInsets.all(10),
      width: 320,
      height: 210,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity:0.4 ,
          image: NetworkImage(eventDataModel.eventImage!),
          fit: BoxFit.cover,
        ),
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
           // width: 48,
            //height: 24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color:Colors.white
                )
                ),
            child: Text(
              eventDataModel.eventName!,
              style: 
              AppStyle.poppinsTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 70),
          Text(
            eventDataModel.eventCategory!,
            style: AppStyle.poppinsTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Text(
               "21 Nov" +
                    " - " +
                    "22 Nov",
                style: AppStyle.poppinsTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 5,),
              Container(
                height: 12,
                width: 1,
                color: Colors.black54,
              ),
              SizedBox(width: 5,),
              Text(
                eventDataModel.numberOfClasses!.toString() +
                    " classes, " +
                    eventDataModel.eventSubCategory!,
                style: AppStyle.poppinsTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mon, Wed, Fri',
                style: AppStyle.poppinsTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 160,),
              Text(
                '\$350',
                style: AppStyle.poppinsTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}



