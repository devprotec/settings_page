class CreditCard {
  String cardNumber;
  String expiryDate;
  String cardType;
  bool isMain;

  CreditCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardType,
    required this.isMain,
  });
}

class MoMoDetails {
  String momoNumber;
  String momoName;
  String momoProvid;
  bool isMain;

  MoMoDetails({
    required this.momoNumber,
    required this.momoName,
    required this.momoProvid,
    required this.isMain,
  });
}
