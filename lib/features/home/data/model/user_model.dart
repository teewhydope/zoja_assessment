class UserModel {
  UserModel({required this.userData, required this.smartSaverTransactions});

  final UserData? userData;
  final List<SmartSaverTransaction> smartSaverTransactions;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userData:
          json["user_data"] == null
              ? null
              : UserData.fromJson(json["user_data"]),
      smartSaverTransactions:
          json["smart_saver_transactions"] == null
              ? []
              : List<SmartSaverTransaction>.from(
                json["smart_saver_transactions"]!.map(
                  (x) => SmartSaverTransaction.fromJson(x),
                ),
              ),
    );
  }
}

class SmartSaverTransaction {
  SmartSaverTransaction({
    required this.amount,
    required this.type,
    required this.narration,
    required this.dateCreated,
  });

  final int? amount;
  final String? type;
  final String? narration;
  final DateTime? dateCreated;

  factory SmartSaverTransaction.fromJson(Map<String, dynamic> json) {
    return SmartSaverTransaction(
      amount: json["amount"],
      type: json["type"],
      narration: json["narration"],
      dateCreated: DateTime.tryParse(json["date_created"] ?? ""),
    );
  }
}

class UserData {
  UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.tier,
    required this.phoneNumber,
    required this.smartSaverBalance,
    required this.greenSaverBalance,
    required this.fixedDepositBalance,
    required this.emailVerified,
    required this.phoneVerified,
  });

  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? tier;
  final String? phoneNumber;
  final int? smartSaverBalance;
  final int? greenSaverBalance;
  final int? fixedDepositBalance;
  final bool? emailVerified;
  final bool? phoneVerified;

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      tier: json["tier"],
      phoneNumber: json["phone_number"],
      smartSaverBalance: json["smart_saver_balance"],
      greenSaverBalance: json["green_saver_balance"],
      fixedDepositBalance: json["fixed_deposit_balance"],
      emailVerified: json["email_verified"],
      phoneVerified: json["phone_verified"],
    );
  }
}
