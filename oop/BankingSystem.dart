import 'package:test/test.dart';

class InsufficientFundsException implements Exception {}

class AccountNotFoundException implements Exception {}

class BankingSystem {
  int _accountIdCounter = 0;
  List<Account> _accounts = [];

  Account openAccount(String ownerName) {
    final account = Account(_accountIdCounter++, ownerName);
    _accounts.add(account);
    return account;
  }

  void deposit(int accountId, double amount) {
    final account = _getAccountById(accountId);
    account.balance += amount;
    final String ownerName = account.ownerName;
    account.transactions.add(Transaction('$ownerName deposited $amount', amount));
  }

  void withdraw(int accountId, double amount) {
    final account = _getAccountById(accountId);
    if (account.balance < amount) {
      throw InsufficientFundsException();
    }
    account.balance -= amount;
    final String ownerName = account.ownerName;
    account.transactions.add(Transaction('$ownerName withdraw $amount', -amount));
  }

  void transfer(int fromAccountId, int toAccountId, double amount) {
    final fromAccount = _getAccountById(fromAccountId);
    final toAccount = _getAccountById(toAccountId);
    if (fromAccount.balance < amount) {
      throw InsufficientFundsException();
    }
    fromAccount.balance -= amount;
    toAccount.balance += amount;
    final String fromOwnerName = fromAccount.ownerName;
    final String toOwnerName = toAccount.ownerName;
    fromAccount.transactions.add(
      Transaction(
        '$fromOwnerName transferred $amount to $toOwnerName',
        -amount
      )
    );
    toAccount.transactions.add(
      Transaction(
        '$toOwnerName received $amount from $fromOwnerName',
        amount
      )
    );
  }

  double displayAccountBalance(int accountId) {
    final account = _getAccountById(accountId);
    return account.balance;
  }

  List<String> generateTransactionReport() {
    List<String> report = <String>[];
    for (final account in _accounts) {
      for (final transaction in account.transactions) {
        report.add(transaction.toString());
      }
    }
    return report;
  }

  Account _getAccountById(int accountId) {
    final account = _accounts.firstWhere(
      (account) => account.id == accountId
    );
    if (account == null) {
      throw AccountNotFoundException();
    }
    return account;
  }
}

class Account {
  final int id;
  final String ownerName;
  double balance = 0;
  final List<Transaction> transactions = [];

  Account(this.id, this.ownerName);

  @override
  String toString() {
    return '$ownerName ($id)';
  }
}

class Transaction {
  final DateTime dateTime;
  final String description;
  final double amount;

  Transaction(this.description, this.amount)
      : dateTime = DateTime.now();

  @override
  String toString() {
    return description;
  }
}

void main() {
  group('Banking System Tests', () {
    test('Can create an account with a balance of 0', () {
      final bankingSystem = BankingSystem();
      final account = bankingSystem.openAccount('Caio');
      expect(account.ownerName, equals('Caio'));
      expect(account.balance, equals(0));
    });

    test('Can deposit money into an account', () {
      final bankingSystem = BankingSystem();
      final account = bankingSystem.openAccount('Caio');
      bankingSystem.deposit(account.id, 500.0);
      expect(account.balance, equals(500.0));
    });

    test('Can withdraw money from an account', () {
      final bankingSystem = BankingSystem();
      final account = bankingSystem.openAccount('Caio');
      bankingSystem.deposit(account.id, 1000.0);
      bankingSystem.withdraw(account.id, 500.0);
      expect(account.balance, equals(500.0));
    });

    test('Can transfer money between accounts', () {
      final bankingSystem = BankingSystem();
      final account1 = bankingSystem.openAccount('Caio');
      final account2 = bankingSystem.openAccount('Marília');
      bankingSystem.deposit(account1.id, 1000.0);
      bankingSystem.transfer(account1.id, account2.id, 500.0);
      expect(account1.balance, equals(500.0));
      expect(account2.balance, equals(500.0));
    });

    test('Can display account balances', () {
      final bankingSystem = BankingSystem();
      final account1 = bankingSystem.openAccount('Caio');
      final account2 = bankingSystem.openAccount('Marília');
      bankingSystem.deposit(account1.id, 1000.0);
      bankingSystem.deposit(account2.id, 500.0);
      expect(bankingSystem.displayAccountBalance(account1.id), equals(1000.0));
      expect(bankingSystem.displayAccountBalance(account2.id), equals(500.0));
    });

    test('Can generate transaction reports', () {
      final bankingSystem = BankingSystem();
      final account1 = bankingSystem.openAccount('Caio');
      final account2 = bankingSystem.openAccount('Marília');
      bankingSystem.deposit(account1.id, 1000.0);
      bankingSystem.deposit(account2.id, 500.0);
      bankingSystem.transfer(account1.id, account2.id, 500.0);
      final report = bankingSystem.generateTransactionReport();
      expect(report.length, equals(4));

      expect(report[0], equals('Caio deposited 1000.0'));
      expect(report[1], equals('Caio transferred 500.0 to Marília'));
      expect(report[2], equals('Marília deposited 500.0'));
      expect(report[3], equals('Marília received 500.0 from Caio'));
    });
  });
}
