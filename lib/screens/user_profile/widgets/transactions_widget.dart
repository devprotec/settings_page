import 'package:intl/intl.dart';

import 'package:mhc_customer/util/exports.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionWidget({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  transaction.title!,
                  style: AppStyle.poppinsTextStyle(
                      color: Constants.fromHex('#34405E'),
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
              ),
              transaction.isDebit!
                  ? Text("-" + transaction.amount.toString() + '0',
                      style: AppStyle.poppinsTextStyle(
                          color: Constants.fromHex('#E74C3C'),
                          fontWeight: FontWeight.w500,
                          fontSize: 15))
                  : Text("+" + transaction.amount.toString() + '0',
                      style: AppStyle.poppinsTextStyle(
                          color: Constants.fromHex('#24AE5F'),
                          fontWeight: FontWeight.w500,
                          fontSize: 15))
            ],
          ),
          Constants.spaceSmall,
          Text(
            DateFormat.yMEd().add_jms().format(transaction.date!),
            style: AppStyle.poppinsTextStyle(
                color: Constants.fromHex('#6E768D'),
                fontWeight: FontWeight.w400,
                fontSize: 13),
          ),
          Constants.spaceLarge,
          Constants.spaceSmall
        ],
      ),
    );
  }
}
