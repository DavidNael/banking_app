const String transactionTable = 'transactions';

class TransactionFields {
  static const String id = '_id';
  static const String sender = 'sender';
  static const String receiver = 'receiver';
  static const String amount = 'amount';
  static const String date = 'date';

  static final List<String> values = [id, sender, receiver, amount, date];
}

class TransactionModel {
  int? id;
  String sender;
  String receiver;
  double amount;
  String date;
  TransactionModel({
    this.id,
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.date,
  });

  static TransactionModel fromJson(Map<String, Object?> json) =>
      TransactionModel(
        id: json[TransactionFields.id] as int?,
        sender: json[TransactionFields.sender] as String,
        receiver: json[TransactionFields.receiver] as String,
        amount: json[TransactionFields.amount] as double,
        date: json[TransactionFields.date] as String,
      );
  Map<String, Object?> toJson() => {
        TransactionFields.id: id,
        TransactionFields.sender: sender,
        TransactionFields.receiver: receiver,
        TransactionFields.amount: amount,
        TransactionFields.date: date,
      };

  TransactionModel copyWith({
    int? id,
    String? sender,
    String? receiver,
    double? amount,
    String? date,
  }) =>
      TransactionModel(
        id: id ?? this.id,
        sender: sender ?? this.sender,
        receiver: receiver ?? this.receiver,
        amount: amount ?? this.amount,
        date: date ?? this.date,
      );
}
