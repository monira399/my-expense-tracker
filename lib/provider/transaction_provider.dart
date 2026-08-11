import 'package:expense_tracker/models/transaction_model.dart';
import 'package:expense_tracker/services/transaction_service.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  final TransactionService _transactionService = TransactionService();

  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // ============ Get Transaction ============

  Future<void> getTransaction() async {
    _isLoading = true;
    notifyListeners();

    try {
      _transactions = await _transactionService.getTransaction();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ============ Add Transaction ============

  Future<void> addTransaction(TransactionModel transaction) async {
    try {
      await _transactionService.addTransaction(transaction);

      await getTransaction();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ============ Update Transaction ============

  Future<void> updateTransaction(TransactionModel transaction) async {
    try {
      await _transactionService.updateTransaction(transaction);

      await getTransaction();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ============ Delete Transaction ============

  Future<void> deleteTransaction(String transactionId) async {
    try {
      await _transactionService.deleteTransaction(transactionId);

      await getTransaction();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ============ Recent Transactions ============

  List<TransactionModel> get recentTransactions {
    return _transactions.take(5).toList();
  }

  // ============ Today Transactions ============

  List<TransactionModel> get todayTransactions {
    final now = DateTime.now();

    return _transactions.where((transaction) {
      return transaction.date.year == now.year &&
          transaction.date.month == now.month &&
          transaction.date.day == now.day;
    }).toList();
  }

  // ============ Yesterday Transactions ============

  List<TransactionModel> get yesterdayTransactions {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));

    return _transactions.where((transaction) {
      return transaction.date.year == yesterday.year &&
          transaction.date.month == yesterday.month &&
          transaction.date.day == yesterday.day;
    }).toList();
  }

  // ============ Older Transactions ============

  List<TransactionModel> get olderTransactions {
    final now = DateTime.now();

    return _transactions.where((transaction) {
      final transactionDate = transaction.date;

      final isToday =
          transactionDate.year == now.year &&
          transactionDate.month == now.month &&
          transactionDate.day == now.day;

      final yesterday = now.subtract(const Duration(days: 1));

      final isYesterday =
          transactionDate.year == yesterday.year &&
          transactionDate.month == yesterday.month &&
          transactionDate.day == yesterday.day;

      return !isToday && !isYesterday;
    }).toList();
  }

  // ============ Date + Type Filter ============

  List<TransactionModel> getTransactionsByDateAndType(
    String dateType,
    int selected,
  ) {
    List<TransactionModel> result;

    // ============ Date Filter ============

    if (dateType == 'today') {
      result = todayTransactions;
    } else if (dateType == 'yesterday') {
      result = yesterdayTransactions;
    } else {
      result = olderTransactions;
    }

    // ============ All / Income / Expense ============

    if (selected == 0) {
      return result;
    } else if (selected == 1) {
      return result.where((transaction) => transaction.isIncome).toList();
    } else {
      return result.where((transaction) => !transaction.isIncome).toList();
    }
  }

  //====Total Income====//
  double get totalIncome {
    return _transactions
        .where((transaction) => transaction.isIncome)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }
  //====Total Expense====//
  double get totalExpense {
    return _transactions
        .where((transaction) => !transaction.isIncome)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }
  //====Current Balance====//
  double get currentBalance {
    return totalIncome - totalExpense;
}

  //==========Today Income Filter================//

  double get todayIncome {
    final now = DateTime.now();

    return _transactions
        .where((transaction) {
      final date = transaction.date;

      return date.year == now.year &&
          date.month == now.month &&
          date.day == now.day &&
          transaction.isIncome;
    })
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  //==========Today Expense Filter================//
  double get todayExpense {
    final now = DateTime.now();

    return _transactions.where((transaction) {
      final date = transaction.date;

      return date.year == now.year &&
         date.month == now.month &&
         date.day == now.day &&
      !transaction.isIncome;
    })
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  // This Month Income
  double get thisMonthIncome {
    final now = DateTime.now();

    return _transactions.where((transaction) {
      final date = transaction.date;

      return date.year == now.year &&
          date.month == now.month &&
          transaction.isIncome;
    })
        .fold(0.0, (sum, transaction) => sum + transaction.amount);


  }

  // This Month Expense
  double get thisMonthExpense {
    final now = DateTime.now();

    return _transactions.where((transaction) {
      final date = transaction.date;

      return date.year == now.year &&
          date.month == now.month &&
          !transaction.isIncome;
    })
        .fold(0.0, (sum, transaction) => sum + transaction.amount);


  }

}
