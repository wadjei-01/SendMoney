class TransactionModel {
  String id;
  String recipientImage;
  String recipientName;
  String recipientPhone;
  String senderName;
  String senderMsg;
  double amountPaid;
  bool isSuccessful;
  bool isBookmarked;
  DateTime dateTime;

  TransactionModel(
      {required this.id,
      required this.recipientImage,
      required this.recipientName,
      required this.recipientPhone,
      required this.senderName,
      required this.senderMsg,
      required this.amountPaid,
      required this.isSuccessful,
      required this.isBookmarked,
      required this.dateTime});

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'],
        recipientImage: json['recipientImage'],
        recipientName: json['recipientName'],
        recipientPhone: json['recipientPhone'],
        senderName: json['senderName'],
        senderMsg: json['senderMsg'],
        amountPaid: json['amountPaid'],
        isSuccessful: json['isSuccessful'],
        isBookmarked: json['isBookmarked'],
        dateTime: json['dateTime'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['recipientImage'] = recipientImage;
    data['recipientName'] = recipientName;
    data['senderName'] = senderName;
    data['senderMsg'] = senderMsg;
    data['amountPaid'] = amountPaid;
    data['isSuccessful'] = isSuccessful;
    data['isBookmarked'] = isBookmarked;
    data['dateTime'] = dateTime;

    return data;
  }
}
