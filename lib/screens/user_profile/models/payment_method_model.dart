class PaymentMethod {
  final String? vendoName;
  final String? lastDigits;
  const PaymentMethod({this.vendoName, this.lastDigits});
}

const mtn = PaymentMethod(vendoName: "MTN Mobile Money", lastDigits: "7657");
const mastercard = PaymentMethod(vendoName: "MasterCard", lastDigits: "4567");
const visa = PaymentMethod(vendoName: "Visa", lastDigits: "1908");
const tigo = PaymentMethod(vendoName: "Tigo Cash", lastDigits: "7638");

String getVendorImage(String vendoName) {
  if (vendoName == "MasterCard") {
    return 'assets/images/mastercard.png';
  } else if (vendoName == "MTN Mobile Money") {
    return 'assets/images/mtn.png';
  } else if (vendoName == "Visa") {
    return 'assets/images/visa.png';
  } else if (vendoName == "Tigo Cash") {
    return 'assets/images/tigo.png';
  }
  return '';
}
