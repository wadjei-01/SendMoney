import 'package:sendmoney/transactions/model/transaction_model.dart';

class MockData {
  static Future<List<TransactionModel>> fetchData() async {
    var data = [
      TransactionModel(
        id: '1',
        recipientImage: 'assets/images/mtn.png',
        recipientName: 'Emmanuel Rockson Kwabena Uncle Ebo',
        recipientPhone: '024 123 4567',
        senderName: 'Personal',
        senderMsg: 'Cool your heart wai',
        amountPaid: 500,
        isSuccessful: true,
        isBookmarked: true,
        dateTime: DateTime(2022, 05, 24, 14, 45),
      ),
      TransactionModel(
        id: '2',
        recipientImage: 'assets/images/absa.png',
        recipientName: 'Absa Bank',
        recipientPhone: '024 123 4567',
        senderName: 'Personal',
        senderMsg: 'Cool your heart wai',
        amountPaid: 500,
        isSuccessful: false,
        isBookmarked: false,
        dateTime: DateTime(2022, 05, 24, 14, 45),
      ),
      TransactionModel(
        id: '3',
        recipientImage: 'assets/images/mtn.png',
        recipientName: 'Emmanuel Rockson',
        recipientPhone: '024 123 4567',
        senderName: 'Other',
        senderMsg: 'Cool your heart wai',
        amountPaid: 500,
        isSuccessful: true,
        isBookmarked: true,
        dateTime: DateTime(2022, 05, 23, 14, 45),
      ),
      TransactionModel(
        id: '4',
        recipientImage: 'assets/images/mtn.png',
        recipientName: 'Emmanuel Rockson',
        recipientPhone: '024 123 4567',
        senderName: 'Other',
        senderMsg: 'Cool your heart wai',
        amountPaid: 500,
        isSuccessful: true,
        isBookmarked: true,
        dateTime: DateTime(2022, 05, 23, 14, 45),
      ),
    ];
    return data;
  }
}
