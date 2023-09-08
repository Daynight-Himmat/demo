import 'package:demo/model/listData.dart';

abstract class RowData {
  static String jsonData = '{ "data": [{ "name": "Darrel", "transaction_id": "Transaction ID: 12345678Bjnao", "image": "", "amount": "55,000", "status": "Paid" },'
      '{ "name": "Jenny Wilson", "transaction_id": "Transaction ID: 12345678Bjnao", "image": "", "amount": "55,00", "status": "Pending" },'
      '{ "name": "Kathryn Murphy", "transaction_id": "Transaction ID: 12345678Bjnao", "image": "", "amount": "5500", "status": "Failed" },'
      '{ "name": "Cody Fisher", "transaction_id": "Transaction ID: 12345678Bjnao", "image": "", "amount": "500", "status": "Paid" }] }';
}