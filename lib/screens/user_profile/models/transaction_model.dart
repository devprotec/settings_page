class TransactionModel {
  final String? title;
  final DateTime? date;
  final bool? isDebit;
  final double? amount;

  const TransactionModel({this.title, this.date, this.isDebit, this.amount});
}

final topup1 = TransactionModel(
    amount: 50,
    title: "Top up of wallet",
    isDebit: false,
    date: DateTime.now());

final topup2 = TransactionModel(
    amount: 150,
    title: "Top up of the wallet",
    isDebit: false,
    date: DateTime.now());

final topup3 = TransactionModel(
    amount: 200,
    title: "Top up of wallet",
    isDebit: false,
    date: DateTime.now());

final programTransaction = TransactionModel(
    amount: 150,
    title: "Program: 3 Elements  - Adult Class",
    isDebit: true,
    date: DateTime.now());

final yogTransaction = TransactionModel(
    amount: 200, title: "Class: Yoga", isDebit: true, date: DateTime.now());
