import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/models/transaction_model.dart';

class TransactionService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //Add Category

Future<void> addTransaction(TransactionModel transaction) async {
  await _fireStore.collection('transactions').add({
    'title': transaction.title,
    'date': transaction.date,
    'amount': transaction.amount,
    'isIncome': transaction.isIncome,
    'categoryId': transaction.categoryId,
    'note': transaction.note
  });

}


  //Get Category

Future<List<TransactionModel>> getTransaction() async {
  final snapShot = await _fireStore.collection('transactions').get();

  final transaction = snapShot.docs.map((doc) {
    final data = doc.data();

    return TransactionModel(
        id: doc.id,
        title: data['title'],
        date: (data['date'] as Timestamp).toDate(),
        amount: (data['amount'] as num).toDouble(),
        isIncome: data['isIncome'],
        categoryId: data['categoryId'],
        note: data['note']
    );
  }).toList();

  transaction.sort(
      (a, b) => b.date.compareTo(a.date)
  );

  return transaction;
}

  //Update Category

Future<void> updateTransaction(TransactionModel transaction) async {
  await _fireStore.collection('transactions').doc(transaction.id).update({
    'title': transaction.title,
    'date': transaction.date,
    'amount': transaction.amount,
    'isIncome': transaction.isIncome,
    'categoryId': transaction.categoryId,
    'note': transaction.note,
  });
}

  //Delete Category

Future<void> deleteTransaction(String transactionId) async {
  await _fireStore.collection('transactions').doc(transactionId).delete();
}
}